using System;
using System.Text;
using System.Configuration;
using System.Web;
using System.Web.Profile;
using System.Collections;
using System.Collections.Specialized;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
//自定义配置文件提供程序
public sealed class BookShopProfileProvider : ProfileProvider
{

    //// 获取数据操作配置类
    private static readonly SqlBookShopProfileProvider dal = new SqlBookShopProfileProvider();

    // 内部变量
    private const string ERR_INVALID_PARAMETER = "Invalid Profile parameter:";
    private const string PROFILE_SHOPPINGCART = "ShoppingCart";
    private const string PROFILE_ACCOUNT = "AccountInfo";
    private static string applicationName = "BookShop";

    /// <summary>
    /// 应用程序名
    /// </summary>
    public override string ApplicationName
    {
        get
        {
            return applicationName;
        }
        set
        {
            applicationName = value;
        }
    }

    /// <summary>
    /// 初始化提供程序
    /// </summary>
    /// <param name="name">提供程序的名称</param>
    /// <param name="config">提供程序的配置</param>
    public override void Initialize(string name, NameValueCollection config)
    {
        if (config == null)
            throw new ArgumentNullException("config");
        if (string.IsNullOrEmpty(config["description"]))
        {
            config.Remove("description");
            config.Add("description", "BookShop Custom Profile Provider");
        }
        if (string.IsNullOrEmpty(name))
            name = "ShoppingCartProvider";

        if (config["applicationName"] != null && !string.IsNullOrEmpty(config["applicationName"].Trim()))
            applicationName = config["applicationName"];
        base.Initialize(name, config);
    }

    /// <summary>
    /// 返回指定应用程序实例的设置属性值集合和设置属性组。
    /// </summary>
    /// <param name="context">当前应用程序上下文</param>
    /// <param name="collection">一个系统的配置集合</param>
    /// <returns>返回一个当前的配置集合</returns>
    public override SettingsPropertyValueCollection GetPropertyValues(SettingsContext context, SettingsPropertyCollection collection)
    {
        //获取登录用户信息
        string username = (string)context["UserName"];
        bool isAuthenticated = (bool)context["IsAuthenticated"];

        SettingsPropertyValueCollection svc = new SettingsPropertyValueCollection();
        //遍历集合中的属性
        foreach (SettingsProperty prop in collection)
        {
            SettingsPropertyValue pv = new SettingsPropertyValue(prop);
            //判断属性名称
            //本实例涉及到两个属性的保存：购物篮和帐户地址
            switch (pv.Property.Name)
            {
                case PROFILE_SHOPPINGCART:
                    pv.PropertyValue = GetCartItems(username, true);
                    break;
                case PROFILE_ACCOUNT:
                    pv.PropertyValue = GetAccountInfo(username);
                    break;
                default:
                    throw new ApplicationException(ERR_INVALID_PARAMETER + " name.");
            }
            svc.Add(pv);
        }
        return svc;
    }

    /// <summary>
    /// 设置指定的属性设置组的值。
    /// </summary>
    /// <param name="context">当前应用程序上下文</param>
    /// <param name="collection">一个系统的配置集合.</param>
    public override void SetPropertyValues(SettingsContext context, SettingsPropertyValueCollection collection)
    {
        //判断当前登录用户
        string username = (string)context["UserName"];
        CheckUserName(username);
        bool isAuthenticated = (bool)context["IsAuthenticated"];
        int uniqueID = dal.GetUniqueID(username, isAuthenticated, false, ApplicationName);
        if (uniqueID == 0)
            uniqueID = dal.CreateProfileForUser(username, isAuthenticated, ApplicationName);

        //遍历用户的保存信息
        foreach (SettingsPropertyValue pv in collection)
        {
            if (pv.PropertyValue != null)
            {
                switch (pv.Property.Name)
                {
                    case PROFILE_SHOPPINGCART:
                        SetCartItems(uniqueID, (CartItem)pv.PropertyValue, true);
                        break;
                    case PROFILE_ACCOUNT:
                            SetAccountInfo(uniqueID, (AddressInfo)pv.PropertyValue);
                        break;
                    default:
                        throw new ApplicationException(ERR_INVALID_PARAMETER + " name.");
                }
            }
        }
        //更新配置时间等信息
        UpdateActivityDates(username, false);
    }

    // 获取profile属性

    // 获取帐户信息
    private static AddressInfo GetAccountInfo(string username)
    {
        return dal.GetAccountInfo(username, applicationName);
    }
    // 获取购物篮信息
    private static CartItem GetCartItems(string username, bool isShoppingCart)
    {
        //初始化一个购物篮实体操作类
        CartItem cart = new CartItem();
        foreach (CartItemInfo cartItem in dal.GetCartItems(username, applicationName, isShoppingCart))
        {
            //在购物篮中添加商品信息
            cart.Add(cartItem);
        }
        return cart;
    }
    // 更新帐户地址
    private static void SetAccountInfo(int uniqueID, AddressInfo addressInfo)
    {
        dal.SetAccountInfo(uniqueID, addressInfo);
    }
    // 更新购物篮信息
    private static void SetCartItems(int uniqueID, CartItem cart, bool isShoppingCart)
    {
        dal.SetCartItems(uniqueID, cart.CartItems, isShoppingCart);
    }
    /// <summary>
    /// 更新当前用户的购物篮信息
    /// </summary>
    /// <param name="uniqueID">用户ID</param>
    /// <param name="cartItems">购物篮中的商品</param>
    /// <param name="isShoppingCart">购物篮标志</param>
    private void SetCartItemsProfile(int uniqueID, ICollection<CartItemInfo> cartItems, bool isShoppingCart)
    {
        string sqlDelete = "DELETE FROM Cart WHERE UniqueID = @UniqueID AND IsShoppingCart = @IsShoppingCart;";

        SqlParameter[] parms1 = {				   
			new SqlParameter("@UniqueID", SqlDbType.Int),
			new SqlParameter("@IsShoppingCart", SqlDbType.Bit)};
        parms1[0].Value = uniqueID;
        parms1[1].Value = isShoppingCart;

        if (cartItems.Count > 0)
        {

            // 通过SQL事务更新信息
            string sqlInsert = "INSERT INTO Cart (UniqueID, ItemId, Name, Type, Price, CategoryId, ProductId, IsShoppingCart, Quantity) VALUES (@UniqueID, @ItemId, @Name, @Type, @Price, @CategoryId, @ProductId, @IsShoppingCart, @Quantity);";
            //定义购物篮的参数
            SqlParameter[] parms2 = {				   
			new SqlParameter("@UniqueID", SqlDbType.Int),	
			new SqlParameter("@IsShoppingCart", SqlDbType.Bit),
			new SqlParameter("@ItemId", SqlDbType.VarChar, 10),
			new SqlParameter("@Name", SqlDbType.VarChar, 80),
			new SqlParameter("@Type", SqlDbType.VarChar, 80),
			new SqlParameter("@Price", SqlDbType.Decimal, 8),
			new SqlParameter("@CategoryId", SqlDbType.VarChar, 10),
			new SqlParameter("@ProductId", SqlDbType.VarChar, 10),
			new SqlParameter("@Quantity", SqlDbType.Int)};
            parms2[0].Value = uniqueID;
            parms2[1].Value = isShoppingCart;
            SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction);
            conn.Open();
            //开始事务
            SqlTransaction trans = conn.BeginTransaction(IsolationLevel.ReadCommitted);
            try
            {
                //在购物篮中添加信息
                SqlHelper.ExecuteNonQuery(trans, CommandType.Text, sqlDelete, parms1);
                foreach (CartItemInfo cartItem in cartItems)
                {
                    parms2[2].Value = cartItem.ItemId;
                    parms2[3].Value = cartItem.Name;
                    parms2[4].Value = cartItem.Price;
                    parms2[5].Value = cartItem.SupplierId;
                    parms2[6].Value = cartItem.ProductId;
                    parms2[7].Value = cartItem.Quantity;
                    SqlHelper.ExecuteNonQuery(trans, CommandType.Text, sqlInsert, parms2);
                }
                //执行事务
                trans.Commit();
            }
            catch (Exception e)
            {
                //出现错误，回滚事务
                trans.Rollback();
                throw new ApplicationException(e.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        else
            // 删除购物篮信息
            SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sqlDelete, parms1);
    }


    // 更新配置时间等信息
    private static void UpdateActivityDates(string username, bool activityOnly)
    {
        UpdateActivityDatesProfile(username, activityOnly, applicationName);
    }
    /// <summary>
    /// 更新配置时间和最后更新日期等信息
    /// </summary>
    /// <param name="userName">当前登录用户名</param>
    /// <param name="activityOnly">激活标志</param>
    /// <param name="appName">应用程序名称</param>
    private static void UpdateActivityDatesProfile(string userName, bool activityOnly, string appName)
    {
        //获取当天日期
        DateTime activityDate = DateTime.Now;
        string sqlUpdate;
        SqlParameter[] parms;
        //激活日期 
        if (activityOnly)
        {
            //更新配置表
            sqlUpdate = "UPDATE Profiles Set LastActivityDate = @LastActivityDate WHERE Username = @Username AND ApplicationName = @ApplicationName;";
            parms = new SqlParameter[]{						   
				new SqlParameter("@LastActivityDate", SqlDbType.DateTime),
				new SqlParameter("@Username", SqlDbType.VarChar, 256),
				new SqlParameter("@ApplicationName", SqlDbType.VarChar, 256)};

            parms[0].Value = activityDate;
            parms[1].Value = userName;
            parms[2].Value = appName;
        }
        else
        {
            //更新日期
            sqlUpdate = "UPDATE Profiles Set LastActivityDate = @LastActivityDate, LastUpdateDate = @LastUpdatedDate WHERE Username = @Username AND ApplicationName = @ApplicationName;";
            parms = new SqlParameter[]{
				new SqlParameter("@LastActivityDate", SqlDbType.DateTime),
				new SqlParameter("@LastUpdatedDate", SqlDbType.DateTime),
				new SqlParameter("@Username", SqlDbType.VarChar, 256),
				new SqlParameter("@ApplicationName", SqlDbType.VarChar, 256)};

            parms[0].Value = activityDate;
            parms[1].Value = activityDate;
            parms[2].Value = userName;
            parms[3].Value = appName;
        }
        SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sqlUpdate, parms);
    }

    /// <summary>
    /// 从数据源中删除配置文件属性和信息。
    /// </summary>
    /// <param name="profiles">属性ID</param>
    /// <returns>删除的记录数</returns>
    public override int DeleteProfiles(ProfileInfoCollection profiles)
    {
        int deleteCount = 0;
        //通过遍历进行删除-条件为当前登录用户
        foreach (ProfileInfo p in profiles)
            if (DeleteProfile(p.UserName))
                deleteCount++;
        return deleteCount;
    }

    /// <summary>
    /// 通过提供的登录用户名删除其配置信息
    /// </summary>
    /// <param name="usernames">用户名数组</param>
    /// <returns>删除的记录数</returns>
    public override int DeleteProfiles(string[] usernames)
    {

        int deleteCount = 0;

        foreach (string user in usernames)
            if (DeleteProfile(user))
                deleteCount++;

        return deleteCount;
    }
    // 通过登录名删除其配置信息
    private static bool DeleteProfile(string username)
    {
        CheckUserName(username);
        return dal.DeleteProfile(username, applicationName);
    }
    // 检查用户
    private static void CheckUserName(string userName)
    {
        if (string.IsNullOrEmpty(userName) || userName.Length > 256 || userName.IndexOf(",") > 0)
            throw new ApplicationException(ERR_INVALID_PARAMETER + " user name.");
    }

    /// <summary>
    /// 删除最后一次活动在指定日期之前发生的配置文件的所有用户配置文件数据。 
    /// </summary>
    public override int DeleteInactiveProfiles(ProfileAuthenticationOption authenticationOption, DateTime userInactiveSinceDate)
    {
        string[] userArray = new string[0];
        dal.GetInactiveProfiles((int)authenticationOption, userInactiveSinceDate, ApplicationName).CopyTo(userArray, 0);
        return DeleteProfiles(userArray);
    }

    /// <summary>
    /// 检索用户名与指定用户名相匹配的配置文件的配置文件信息。 
    /// </summary>
    public override ProfileInfoCollection FindProfilesByUserName(ProfileAuthenticationOption authenticationOption, string usernameToMatch, int pageIndex, int pageSize, out int totalRecords)
    {

        CheckParameters(pageIndex, pageSize);

        return GetProfileInfo(authenticationOption, usernameToMatch, null, pageIndex, pageSize, out totalRecords);
    }

    /// <summary>
    /// 检索最后一次活动在指定日期或指定日期之前发生并且用户名与指定用户名相匹配的配置文件的配置文件信息。
    /// </summary>
    public override ProfileInfoCollection FindInactiveProfilesByUserName(ProfileAuthenticationOption authenticationOption, string usernameToMatch, DateTime userInactiveSinceDate, int pageIndex, int pageSize, out int totalRecords)
    {
        CheckParameters(pageIndex, pageSize);
        return GetProfileInfo(authenticationOption, usernameToMatch, userInactiveSinceDate, pageIndex, pageSize, out totalRecords);
    }

    /// <summary>
    /// 检索数据源中所有配置文件的用户配置文件数据。 
    /// </summary>
    public override ProfileInfoCollection GetAllProfiles(ProfileAuthenticationOption authenticationOption, int pageIndex, int pageSize, out int totalRecords)
    {
        CheckParameters(pageIndex, pageSize);
        return GetProfileInfo(authenticationOption, null, null, pageIndex, pageSize, out totalRecords);
    }

    /// <summary>
    ///从数据源中检索最后一次活动在指定日期或指定日期之前发生的配置文件的用户配置文件数据。
    /// </summary>
    public override ProfileInfoCollection GetAllInactiveProfiles(ProfileAuthenticationOption authenticationOption, DateTime userInactiveSinceDate, int pageIndex, int pageSize, out int totalRecords)
    {
        CheckParameters(pageIndex, pageSize);

        return GetProfileInfo(authenticationOption, null, userInactiveSinceDate, pageIndex, pageSize, out totalRecords);
    }
    /// <summary>
    /// 返回最后一次活动在指定日期或指定日期之前发生的配置文件的数目。 
    /// </summary>
    /// <param name="authenticationOption">已通过验证的属性集合</param>
    /// <param name="userInactiveSinceDate">当前用户最后激活的日期</param>
    /// <returns>发生的配置文件的数目</returns>
    public override int GetNumberOfInactiveProfiles(ProfileAuthenticationOption authenticationOption, DateTime userInactiveSinceDate)
    {

        int inactiveProfiles = 0;

        ProfileInfoCollection profiles = GetProfileInfo(authenticationOption, null, userInactiveSinceDate, 0, 0, out inactiveProfiles);

        return inactiveProfiles;
    }

    //判断页数和当前页码参数
    private static void CheckParameters(int pageIndex, int pageSize)
    {
        if (pageIndex < 1 || pageSize < 1)
            throw new ApplicationException(ERR_INVALID_PARAMETER + " page index.");
    }

    //获取属性信息
    private static ProfileInfoCollection GetProfileInfo(ProfileAuthenticationOption authenticationOption, string usernameToMatch, object userInactiveSinceDate, int pageIndex, int pageSize, out int totalRecords)
    {
        //初始化属性集合
        ProfileInfoCollection profiles = new ProfileInfoCollection();
        totalRecords = 0;
        if (pageSize == 0)
            return profiles;
        int counter = 0;
        int startIndex = pageSize * (pageIndex - 1);
        int endIndex = startIndex + pageSize - 1;

        DateTime dt = new DateTime(1900, 1, 1);
        if (userInactiveSinceDate != null)
            dt = (DateTime)userInactiveSinceDate;
        foreach (CustomProfileInfo profile in dal.GetProfileInfo((int)authenticationOption, usernameToMatch, dt, applicationName, out totalRecords))
        {
            if (counter >= startIndex)
            {
                ProfileInfo p = new ProfileInfo(profile.UserName, profile.IsAnonymous, profile.LastActivityDate, profile.LastUpdatedDate, 0);
                profiles.Add(p);
            }
            if (counter >= endIndex)
            {
                break;
            }
            counter++;
        }
        return profiles;
    }
}