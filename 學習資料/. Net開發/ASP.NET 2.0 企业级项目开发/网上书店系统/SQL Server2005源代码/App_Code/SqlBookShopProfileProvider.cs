using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

/// <summary>
/// 为配置提供操作类
/// </summary>
public class SqlBookShopProfileProvider
{
	public SqlBookShopProfileProvider()	{	}
	// 匿名用户变量
	private const int AUTH_ANONYMOUS = 0;
	// 身份验证变量
	private const int AUTH_AUTHENTICATED = 1;
	// 验证设置
	private const int AUTH_ALL = 2;

    /// <summary>
    /// 获取当前用户的帐户信息
    /// </summary>
    /// <param name="userName">用户名</param>
    /// <param name="appName">应用程序名</param>
    /// <returns>帐户信息</returns>
    public AddressInfo GetAccountInfo(string userName, string appName)
    {
        //SQL选择语句
        string sqlSelect = "SELECT Account.Mail, Account.UserName, Account.Address,  Account.Code, Account.Country, Account.Phone FROM Account INNER JOIN Profiles ON Account.ProfileID = Profiles.ProfileID WHERE Profiles.Username = @Username AND Profiles.ApplicationName = @ApplicationName;";
        SqlParameter[] parms = {					   
            new SqlParameter("@Username", SqlDbType.VarChar, 256),
            new SqlParameter("@ApplicationName", SqlDbType.VarChar, 256)};
        parms[0].Value = userName;
        parms[1].Value = appName;

        AddressInfo addressInfo = null;

        SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sqlSelect, parms);
        while (dr.Read())
        {
            addressInfo = new AddressInfo(dr.GetString(1), dr.GetString(2), dr.GetString(3), dr.GetString(4), dr.GetString(5),dr.GetString(0));
        }
        dr.Close();

        return addressInfo;
    }

    /// <summary>
    ///更新当前用户的帐户地址
    /// </summary>
    /// <param name="uniqueID">配置ID</param>
    /// <param name="addressInfo">当前用户帐户地址信息</param>   
    public void SetAccountInfo(int uniqueID, AddressInfo addressInfo)
    {
        string sqlDelete = "DELETE FROM Account WHERE ProfileID = @UniqueID;";
        SqlParameter param = new SqlParameter("@UniqueID", SqlDbType.Int);
        param.Value = uniqueID;

        string sqlInsert = "INSERT INTO Account (ProfileID, Mail, UserName, Address, Code, Country, Phone) VALUES (@UniqueID, @Email, @UserName,@Address, @Code, @Country, @Phone);";

        //初始化参数数组并赋值
        SqlParameter[] parms = {					   
        new SqlParameter("@UniqueID", SqlDbType.Int),
        new SqlParameter("@Email", SqlDbType.VarChar, 80),
        new SqlParameter("@UserName", SqlDbType.VarChar, 80),
        new SqlParameter("@Address", SqlDbType.VarChar, 80),
        new SqlParameter("@Code", SqlDbType.VarChar, 80),
        new SqlParameter("@Country", SqlDbType.VarChar, 80),
        new SqlParameter("@Phone", SqlDbType.VarChar, 80)};

        parms[0].Value = uniqueID;
        parms[1].Value = addressInfo.Email;
        parms[2].Value = addressInfo.UserName;
        parms[3].Value = addressInfo.Address;
        parms[4].Value = addressInfo.ZipCode;
        parms[5].Value = addressInfo.Country;
        parms[6].Value = addressInfo.Phone;

        SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction);
        conn.Open();
        //开始事务
        SqlTransaction trans = conn.BeginTransaction(IsolationLevel.ReadCommitted);
        try
        {
            SqlHelper.ExecuteNonQuery(trans, CommandType.Text, sqlDelete, param);
            SqlHelper.ExecuteNonQuery(trans, CommandType.Text, sqlInsert, parms);
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

    /// <summary>
    /// 获取购物篮信息
    /// </summary>
    /// <param name="userName">用户名</param>
    /// <param name="appName">应用程序名</param>
    /// <param name="isShoppingCart">购物篮标志</param>
    /// <returns>购物篮中数据</returns>
	public IList<CartItemInfo> GetCartItems(string userName, string appName, bool isShoppingCart) {
        string sqlSelect = "SELECT Cart.ItemId, Cart.ProductName,  Cart.Price, Cart.ProductId, Cart.Quantity FROM Profiles INNER JOIN Cart ON Profiles.ProfileID = Cart.ProfileID WHERE Profiles.Username = @Username AND Profiles.ApplicationName = @ApplicationName ;";

        //创建参数并赋值
		SqlParameter[] parms = {						   
			new SqlParameter("@Username", SqlDbType.VarChar, 256),
			new SqlParameter("@ApplicationName", SqlDbType.VarChar, 256),
			new SqlParameter("@IsShoppingCart", SqlDbType.Bit)};
		parms[0].Value = userName;
		parms[1].Value = appName;
		parms[2].Value = isShoppingCart;

        //执行选择操作
        SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sqlSelect, parms);
		IList<CartItemInfo> cartItems = new List<CartItemInfo>();
		while(dr.Read()) {
			CartItemInfo cartItem = new CartItemInfo(dr.GetInt32(0), dr.GetString(1), dr.GetInt32(4), dr.GetDecimal(2), 0, dr.GetInt32(3));
			cartItems.Add(cartItem);
		}
		dr.Close();
		return cartItems;  
	}

    /// <summary>
    /// 更新当前用户的购物篮
    /// </summary>
    /// <param name="uniqueID">配置ID</param>
    /// <param name="cartItems">购物篮数据集合</param>
    /// <param name="isShoppingCart">购物篮标志/param>
	public void SetCartItems(int uniqueID, ICollection<CartItemInfo> cartItems, bool isShoppingCart) {
        string sqlDelete = "DELETE FROM Cart WHERE ProfileID = @ProfileID ;";
		SqlParameter parms1 = 	new SqlParameter("@ProfileID", SqlDbType.Int);
		parms1.Value = uniqueID;
        if (cartItems.Count > 0) {

            // 使用事务更新数据
            string sqlInsert = "INSERT INTO Cart (ProfileID, ItemId, ProductName,  Price,  ProductId, Quantity) VALUES (@ProfileID, @ItemId, @Name,  @Price,  @ProductId,  @Quantity);";

            //创建参数列表
            SqlParameter[] parms2 = {				   
			new SqlParameter("@ProfileID", SqlDbType.Int),	
			new SqlParameter("@ItemId", SqlDbType.VarChar, 10),
			new SqlParameter("@Name", SqlDbType.VarChar, 80),
			new SqlParameter("@Price", SqlDbType.Decimal, 8),
			new SqlParameter("@ProductId", SqlDbType.VarChar, 10),
			new SqlParameter("@Quantity", SqlDbType.Int)};
            parms2[0].Value = uniqueID;
            SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction);
            conn.Open();
            //开始事务
            SqlTransaction trans = conn.BeginTransaction(IsolationLevel.ReadCommitted);
            try {
                SqlHelper.ExecuteNonQuery(trans, CommandType.Text, sqlDelete, parms1);

                //将购物篮内容添加到表中
                foreach (CartItemInfo cartItem in cartItems) {
                    parms2[1].Value = cartItem.ItemId;
                    parms2[2].Value = cartItem.Name;
                    parms2[3].Value = cartItem.Price;
                    parms2[4].Value = cartItem.ProductId;
                    parms2[5].Value = cartItem.Quantity;
                    SqlHelper.ExecuteNonQuery(trans, CommandType.Text, sqlInsert, parms2);
                }
                //执行事务
                trans.Commit();
            }
            catch (Exception e) {
                //事务回滚
                trans.Rollback();
                throw new ApplicationException(e.Message);
            }
            finally {
                conn.Close();
            }
        }
        else 
            // 删除购物篮商品
            SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sqlDelete, parms1);
	}

    /// <summary>
    /// 更新当前用户的激活日期
    /// </summary>
    /// <param name="userName">用户名</param>
    /// <param name="activityOnly">激活标志</param>
    /// <param name="appName">应用程序名</param>
	public void UpdateActivityDates(string userName, bool activityOnly, string appName) {
		DateTime activityDate = DateTime.Now;
		string sqlUpdate;
		SqlParameter[] parms;
		if(activityOnly) {
            //更改激活日期
            sqlUpdate = "UPDATE Profiles Set LastActivityDate = @LastActivityDate WHERE Username = @Username AND ApplicationName = @ApplicationName;";
			parms = new SqlParameter[]{						   
				new SqlParameter("@LastActivityDate", SqlDbType.DateTime),
				new SqlParameter("@Username", SqlDbType.VarChar, 256),
				new SqlParameter("@ApplicationName", SqlDbType.VarChar, 256)};
			parms[0].Value = activityDate;
			parms[1].Value = userName;
			parms[2].Value = appName;
		}
		else {
            //更改更新日期
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
    /// 获取当前用户的配置ID
    /// </summary>
    /// <param name="userName">用户名</param>
    /// <param name="isAuthenticated">验证标志</param>
    /// <param name="ignoreAuthenticationType">忽略验证标志</param>
    /// <param name="appName">应用程序名</param>
    /// <returns>配置ID</returns>
	public int GetUniqueID(string userName, bool isAuthenticated, bool ignoreAuthenticationType, string appName) {
		string sqlSelect = "SELECT ProfileID FROM Profiles WHERE Username = @Username AND ApplicationName = @ApplicationName";

		SqlParameter[] parms = {
			new SqlParameter("@Username", SqlDbType.VarChar, 256),
			new SqlParameter("@ApplicationName", SqlDbType.VarChar, 256)};
		parms[0].Value = userName;
		parms[1].Value = appName;
		if(!ignoreAuthenticationType) {
			Array.Resize<SqlParameter>(ref parms, parms.Length + 1);
			parms[2] = new SqlParameter("@IsAnonymous", SqlDbType.Bit);
			parms[2].Value = !isAuthenticated;
		}
		int uniqueID = 0;
		object retVal = null;
        retVal = SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sqlSelect, parms);
		if(retVal == null)
			uniqueID = CreateProfileForUser(userName, isAuthenticated, appName);
		else
			uniqueID = Convert.ToInt32(retVal);
		return uniqueID;
	}

    /// <summary>
    /// 创建当前用户的配置记录
    /// </summary>
    /// <param name="userName">用户名</param>
    /// <param name="isAuthenticated">验证标志</param>
    /// <param name="appName">应用程序名</param>
    /// <returns>记录条数</returns>
	public int CreateProfileForUser(string userName, bool isAuthenticated, string appName) {

		string sqlInsert = "INSERT INTO Profiles (Username,  LastActivityDate, LastUpdateDate, ApplicationName) Values(@Username, @LastActivityDate, @LastUpdatedDate, @ApplicationName); SELECT @@IDENTITY;";

		SqlParameter[] parms = {
			new SqlParameter("@Username", SqlDbType.VarChar, 256),
			new SqlParameter("@ApplicationName", SqlDbType.VarChar, 256),
			new SqlParameter("@LastActivityDate", SqlDbType.DateTime),
			new SqlParameter("@LastUpdatedDate", SqlDbType.DateTime)};

		parms[0].Value = userName;
		parms[1].Value = appName;
		parms[2].Value = DateTime.Now;
		parms[3].Value = DateTime.Now;
		int uniqueID = 0;
        int.TryParse(SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sqlInsert, parms).ToString(), out uniqueID);
		return uniqueID;
	}

    /// <summary>
    /// 获取非活动用户集合
    /// </summary>
    /// <param name="authenticationOption">验证设置</param>
    /// <param name="userInactiveSinceDate">搜索日期</param>
    /// <param name="appName">应用程序名</param>
    /// <returns>非活动的用户集合</returns>
	public IList<string> GetInactiveProfiles(int authenticationOption, DateTime userInactiveSinceDate, string appName) {

		StringBuilder sqlSelect = new StringBuilder("SELECT Username FROM Profiles WHERE ApplicationName = @ApplicationName AND LastActivityDate <= @LastActivityDate");

		SqlParameter[] parms = {
			new SqlParameter("@ApplicationName", SqlDbType.VarChar, 256),
			new SqlParameter("@LastActivityDate", SqlDbType.DateTime)};
		parms[0].Value = appName;
		parms[1].Value = userInactiveSinceDate;

        //判断验证设置
		switch(authenticationOption) {
			case AUTH_ANONYMOUS:
				sqlSelect.Append(" AND IsAnonymous = @IsAnonymous");
				Array.Resize<SqlParameter>(ref parms, parms.Length + 1);
				parms[2] = new SqlParameter("@IsAnonymous", SqlDbType.Bit);
				parms[2].Value = true;
				break;
			case AUTH_AUTHENTICATED:
				sqlSelect.Append(" AND IsAnonymous = @IsAnonymous");
				Array.Resize<SqlParameter>(ref parms, parms.Length + 1);
				parms[2] = new SqlParameter("@IsAnonymous", SqlDbType.Bit);
				parms[2].Value = false;
				break;
			default:
				break;
		}

		IList<string> usernames = new List<string>();
        //获取用户数据集
        SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sqlSelect.ToString(), parms);
		while(dr.Read()) {
			usernames.Add(dr.GetString(0));
		}
		dr.Close();
		return usernames;
	}

    /// <summary>
    /// 删除用户的配置
    /// </summary>
    /// <param name="userName">用户名</param>
    /// <param name="appName">应用程序名</param>
    /// <returns>是否成功</returns>
	public bool DeleteProfile(string userName, string appName) 
    {
        //获取用户的配置ID
        int uniqueID = GetUniqueID(userName, false, true, appName);
        //创建参数并赋值
		string sqlDelete = "DELETE FROM Profiles WHERE UniqueID = @UniqueID;";
		SqlParameter param = new SqlParameter("@UniqueId", SqlDbType.Int, 4);
		param.Value = uniqueID;
        //执行删除语句
        int numDeleted = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sqlDelete, param);
		if(numDeleted <= 0)
			return false;
		else
			return true;
	}
    /// <summary>
    /// 找回配置信息
    /// </summary>
    /// <param name="authenticationOption">验证设置</param>
    /// <param name="usernameToMatch">用户名</param>
    /// <param name="userInactiveSinceDate">搜索日期</param>
    /// <param name="appName">应用程序名</param>
    /// <param name="totalRecords">返回条数</param>
    /// <returns>配置集合</returns>
	public IList<CustomProfileInfo> GetProfileInfo(int authenticationOption, string usernameToMatch, DateTime userInactiveSinceDate, string appName, out int totalRecords) {
        
		// 返回总条数
		StringBuilder sqlSelect1 = new StringBuilder("SELECT COUNT(*) FROM Profiles WHERE ApplicationName = @ApplicationName");
		SqlParameter[] parms1 = {
			new SqlParameter("@ApplicationName", SqlDbType.VarChar, 256)};
		parms1[0].Value = appName;

		// 找回配置信息
		StringBuilder sqlSelect2 = new StringBuilder("SELECT Username, LastActivityDate, LastUpdateDate, IsAnonymous FROM Profiles WHERE ApplicationName = @ApplicationName");
		SqlParameter[] parms2 = { new SqlParameter("@ApplicationName", SqlDbType.VarChar, 256) };
		parms2[0].Value = appName;
		int arraySize;
		// 通过用户名搜索.
		if(usernameToMatch != null) {
			arraySize = parms1.Length;
			sqlSelect1.Append(" AND Username LIKE @Username ");
			Array.Resize<SqlParameter>(ref parms1, arraySize + 1);
			parms1[arraySize] = new SqlParameter("@Username", SqlDbType.VarChar, 256);
			parms1[arraySize].Value = usernameToMatch;
			sqlSelect2.Append(" AND Username LIKE @Username ");
			Array.Resize<SqlParameter>(ref parms2, arraySize + 1);
			parms2[arraySize] = new SqlParameter("@Username", SqlDbType.VarChar, 256);
			parms2[arraySize].Value = usernameToMatch;
		}
		// 通过激活日期
		if(userInactiveSinceDate != null) {
			arraySize = parms1.Length;
			sqlSelect1.Append(" AND LastActivityDate >= @LastActivityDate ");
			Array.Resize<SqlParameter>(ref parms1, arraySize + 1);
			parms1[arraySize] = new SqlParameter("@LastActivityDate", SqlDbType.DateTime);
			parms1[arraySize].Value = (DateTime)userInactiveSinceDate;

			sqlSelect2.Append(" AND LastActivityDate >= @LastActivityDate ");
			Array.Resize<SqlParameter>(ref parms2, arraySize + 1);
			parms2[arraySize] = new SqlParameter("@LastActivityDate", SqlDbType.DateTime);
			parms2[arraySize].Value = (DateTime)userInactiveSinceDate;
		}
		//通过验证设置
		if(authenticationOption != AUTH_ALL) {
			arraySize = parms1.Length;
			Array.Resize<SqlParameter>(ref parms1, arraySize + 1);
			sqlSelect1.Append(" AND IsAnonymous = @IsAnonymous");
			parms1[arraySize] = new SqlParameter("@IsAnonymous", SqlDbType.Bit);  

			Array.Resize<SqlParameter>(ref parms2, arraySize + 1);
			sqlSelect2.Append(" AND IsAnonymous = @IsAnonymous");
			parms2[arraySize] = new SqlParameter("@IsAnonymous", SqlDbType.Bit);
            //判断是否是匿名
			switch(authenticationOption) {
				case AUTH_ANONYMOUS:   						
					parms1[arraySize].Value = true;
					parms2[arraySize].Value = true;
					break;
				case AUTH_AUTHENTICATED:
					parms1[arraySize].Value = false;
					parms2[arraySize].Value = false;
					break;
				default:
					break;
			}
		}
		IList<CustomProfileInfo> profiles = new List<CustomProfileInfo>();
		// 获取配置条数
        totalRecords = (int)SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sqlSelect1.ToString(), parms1);

		// 没有发现配置信息
		if(totalRecords <= 0)
			return profiles;
		SqlDataReader dr;
        dr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sqlSelect2.ToString(), parms2);
		while(dr.Read()) {
			CustomProfileInfo profile = new CustomProfileInfo(dr.GetString(0), dr.GetDateTime(1), dr.GetDateTime(2), dr.GetBoolean(3));
			profiles.Add(profile);	
		}	
		dr.Close();
		return profiles;
	}
}