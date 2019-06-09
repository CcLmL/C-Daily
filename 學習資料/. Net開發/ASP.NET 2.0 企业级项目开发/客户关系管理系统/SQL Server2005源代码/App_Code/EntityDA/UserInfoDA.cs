using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;

/// <summary>
/// UserInfoDA 的摘要说明
/// </summary>
public class UserInfoDA
{
    //定义常量表示字段名称或SQL语句。
    private const string SQL_INSERT_USERINFO = "INSERT INTO userinfo VALUES(@cityid,@gradeid,@stateid,@typeid, @username, @useraddress, @softversion, @linkman, @phone,@mail,@qq,@fax,@peopleamount)";
    //private const string SQL_UPDATE_USERINFO = "update memberinfo set custname=@custname,custphone=@custphone,custaddress=@custaddress";
    private const string PARM_USER_NAME = "@username";
    private const string PARM_USER_ADDRESS = "@useraddress";
    private const string PARM_USER_SOFTVERSION = "@softversion";
    private const string PARM_USER_LINKMAN = "@linkman";
    private const string PARM_USER_PHONE = "@phone";
    private const string PARM_USER_MAIL = "@mail";
    private const string PARM_USER_QQ = "@qq";
    private const string PARM_USER_FAX = "@fax";
    private const string PARM_USER_PEOPLEAMOUNT = "@peopleamount";
    private const string PARM_USER_CITYID = "@cityid";
    private const string PARM_USER_STATEID = "@stateid";
    private const string PARM_USER_GRADEID = "@gradeid";
    private const string PARM_USER_TYPEID = "@typeid";

    private const string PARM_USER_CITY = "@city";
    private const string PARM_USER_STATE = "@state";
    private const string PARM_USER_GRADE = "@grade";
    private const string PARM_USER_TYPE = "@type";
    private const string SQL_SELECT_CITYNAME = "SELECT cityid FROM city WHERE cityname=@city";
    private const string SQL_SELECT_STATENAME = "SELECT stateid FROM userstate WHERE statename=@state";
    private const string SQL_SELECT_GRADENAME = "SELECT gradeid FROM usergrade WHERE gradename=@grade";
    private const string SQL_SELECT_TYPENAME = "SELECT typeid FROM usertype WHERE typename=@type";
    //private const string SQL_SELECT_BYSOFTVERSION = "";


    public UserInfoDA()
	{
	}
    /// <summary>
    /// 添加客户资料
    /// </summary>
    /// <param name="user">客户资料实体</param>
    /// <returns>添加是否成功</returns>
    public bool InsertUser(UserInfoEntity user)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlParameter[] userParms = GetParameters();
        SqlCommand cmd = new SqlCommand();

        // 依次给实体参数赋值
        userParms[0].Value = user.UserName;
        userParms[1].Value = user.Address;
        userParms[2].Value = user.SoftVersion;
        userParms[3].Value = user.LinkMan;
        userParms[4].Value = user.Phone;
        userParms[5].Value = user.Mail;
        userParms[6].Value = user.QQ;
        userParms[7].Value = user.Fax;
        userParms[8].Value = user.PeopleAmount;
        //因为客户资料表中存储的是以下几个属性的ID
        //所以必须通过名称先获取这几个属性的ID
        //获取城市的ID
        int cityid = GetCityID(user.City);
        //获取用户状态的ID
        int stateid = GetStateID(user.UserState);
        //获取用户等级的ID
        int gradeid = GetGradeID(user.UserGrade);
        //获取用户业务类型的ID
        int typeid = GetTypeID(user.UserType);

        userParms[9].Value = cityid;
        userParms[10].Value = stateid;
        userParms[11].Value = gradeid;
        userParms[12].Value = typeid;

        //遍历所有参数，并将参数添加到SqlCommand命令中
        foreach (SqlParameter parm in userParms)
            cmd.Parameters.Add(parm);

        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            strSQL.Append(SQL_INSERT_USERINFO);
            //打开数据库连接，执行命令
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
            //执行添加的SqlCommand命令
            int val = cmd.ExecuteNonQuery();
            //清空SqlCommand命令中的参数
            cmd.Parameters.Clear();
            //判断是否添加成功，注意返回的是添加是否成功，不是影响的行数
            if (val > 0)
                return true;
            else
                return false;
        }
    }
    #region 私有方法-获取ID
    /// <summary>
    /// 获取城市ID的方法（私有方法）
    /// </summary>
    /// <param name="cityname">城市名称</param>
    /// <returns>该城市的ID</returns>
    private int GetCityID(string cityname)
    {
        int cityid = 0;

        //创建新参数并给参数赋值，用来指定城市名称
        SqlParameter parm = new SqlParameter(PARM_USER_CITY, SqlDbType.NVarChar, 20);
        parm.Value = cityname;

        //调用SqlHelper访问组件的方法返回第一行第一列的值
        cityid = (int)SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_CITYNAME, parm);

        return cityid;
    }
    /// <summary>
    /// 获取用户状态ID的方法（私有方法）
    /// </summary>
    /// <param name="cityname">用户状态名称</param>
    /// <returns>该状态的ID</returns>
    private int GetStateID(string statename)
    {
        int stateid = 0;

        //创建新参数并给参数赋值，用来指定用户状态的名称
        SqlParameter parm = new SqlParameter(PARM_USER_STATE, SqlDbType.NVarChar, 20);
        parm.Value = statename;

        //调用SqlHelper访问组件的方法返回第一行第一列的值
        stateid = (int)SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_STATENAME, parm);

        return stateid;
    }
    /// <summary>
    /// 获取用户等级ID的方法（私有方法）
    /// </summary>
    /// <param name="cityname">用户等级名称</param>
    /// <returns>该等级的ID</returns>
    private int GetGradeID(string gradename)
    {
        int gradeid = 0;

        //创建新参数并给参数赋值，用来指定用户等级的名称
        SqlParameter parm = new SqlParameter(PARM_USER_GRADE, SqlDbType.NVarChar, 20);
        parm.Value = gradename;

        //调用SqlHelper访问组件的方法返回第一行第一列的值
        gradeid = (int)SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_GRADENAME, parm);

        return gradeid;
    }
    /// <summary>
    /// 获取用户业务类型ID的方法（私有方法）
    /// </summary>
    /// <param name="cityname">业务类型名称</param>
    /// <returns>该业务类型的ID</returns>
    private int GetTypeID(string typename)
    {
        int typeid = 0;

        //创建新参数并给参数赋值，用来指定用户等级的名称
        SqlParameter parm = new SqlParameter(PARM_USER_TYPE, SqlDbType.NVarChar, 20);
        parm.Value = typename;

        //调用SqlHelper访问组件的方法返回第一行第一列的值
        typeid = (int)SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_TYPENAME, parm);

        return typeid;
    }
#endregion
    //#region 对客户资料的查询
    /// <summary>
    /// 通过软件版本查询
    /// </summary>
    /// <param name="softversion">软件版本号</param>
    /// <returns>数据集</returns>
    //public SqlDataReader GetUsersBySoftVersion(string softversion)
    //{
    //    SqlDataReader dr = new SqlDataReader();

    //    //创建新参数并给参数赋值，用来指定用户状态的名称
    //    SqlParameter parm = new SqlParameter(PARM_USER_STATE, SqlDbType.NVarChar, 20);
    //    parm.Value = statename;

    //    //调用SqlHelper访问组件的方法返回第一行第一列的值
    //    stateid = (int)SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_STATENAME, parm);

    //    return stateid;
    //}
    //#endregion

    private static SqlParameter[] GetParameters()
    {
        //将SQL_INSERT_USERINFO做为哈希表缓存的键值
        SqlParameter[] parms = SqlHelper.GetCachedParameters(SQL_INSERT_USERINFO);

        //首先判断缓存是否已经存在
        if (parms == null)
        {
            //缓存不存在的情况下，新建参数列表
            parms = new SqlParameter[] {
                    new SqlParameter(PARM_USER_NAME, SqlDbType.NVarChar,50),
                    new SqlParameter(PARM_USER_ADDRESS, SqlDbType.NVarChar, 100),
                    new SqlParameter(PARM_USER_SOFTVERSION, SqlDbType.NVarChar, 50),
                    new SqlParameter(PARM_USER_LINKMAN, SqlDbType.NVarChar, 20),
                    new SqlParameter(PARM_USER_PHONE, SqlDbType.NVarChar, 20),
                    new SqlParameter(PARM_USER_MAIL, SqlDbType.NVarChar, 20),
                    new SqlParameter(PARM_USER_QQ, SqlDbType.NVarChar, 20),
                    new SqlParameter(PARM_USER_FAX, SqlDbType.NVarChar, 20),
                    new SqlParameter(PARM_USER_PEOPLEAMOUNT, SqlDbType.Int),
                    new SqlParameter(PARM_USER_CITYID, SqlDbType.Int),
                    new SqlParameter(PARM_USER_STATEID, SqlDbType.Int),
                    new SqlParameter(PARM_USER_GRADEID, SqlDbType.Int),
                    new SqlParameter(PARM_USER_TYPEID, SqlDbType.Int)};

            //将新建的参数列表添加到哈希表中缓存起来
            SqlHelper.CacheParameters(SQL_INSERT_USERINFO, parms);
        }
        //返回参数数组
        return parms;
    }
}
