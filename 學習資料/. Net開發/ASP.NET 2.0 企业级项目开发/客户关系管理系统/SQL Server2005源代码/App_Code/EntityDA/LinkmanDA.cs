using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// LinkmanDA 的摘要说明
/// </summary>
public class LinkmanDA
{
    //定义常量表示字段名称或SQL语句。
    private const string SQL_INSERT_LINKMAN = "INSERT INTO linkman VALUES(@userid,@name,@phone, @mail,@qq,@birthday,@like,@sex,@note)";
    private const string PARM_COMPANY_ID = "@userid";
    private const string PARM_LINKMAN_NAME = "@name";
    private const string PARM_LINKMAN_PHONE = "@phone";
    private const string PARM_LINKMAN_MAIL = "@mail";
    private const string PARM_LINKMAN_QQ = "@qq";
    private const string PARM_LINKMAN_BIRTHDAY = "@birthday";
    private const string PARM_LINKMAN_LIKE = "@like";
    private const string PARM_LINKMAN_SEX = "@sex";
    private const string PARM_LINKMAN_NOTE = "@note";
    private const string PARM_COMPANY_NAME= "@company";
    private const string SQL_SELECT_COMPANYNAME = "SELECT userid FROM userinfo WHERE username=@company";

    private const string SQL_SELECT_BIRTHDAY = "SELECT linkmanname FROM linkman WHERE linkmanbirthday between @today and @endday";


	public LinkmanDA()
	{
	}
    /// <summary>
    /// 添加联系人资料
    /// </summary>
    /// <param name="user">联系人资料实体</param>
    /// <returns>添加是否成功</returns>
    public bool InsertLinkman(LinkmanEntity linkman)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlParameter[] linkmanParms = GetParameters();
        SqlCommand cmd = new SqlCommand();

        // 依次给实体参数赋值
        linkmanParms[1].Value = linkman.Name;
        linkmanParms[2].Value = linkman.Phone;
        linkmanParms[3].Value = linkman.Mail;
        linkmanParms[4].Value = linkman.QQ;
        linkmanParms[5].Value = linkman.Birthday;
        linkmanParms[6].Value = linkman.Like;
        linkmanParms[7].Value = linkman.Sex;
        linkmanParms[8].Value = linkman.Note;
        //因为联系人表中的USERID是用来存放联系人所在单位的
        //所以必须通过名称先获取这单位的ID
        //获取单位的ID
        int userid = GetCompanyID(linkman.CompanyName);
        //如果userid为0，表示联系人所在单位并不是公司用户，将其设置为空。
        if (userid == 0)
        {
            linkmanParms[0].Value = DBNull.Value;
        }

        //遍历所有参数，并将参数添加到SqlCommand命令中
        foreach (SqlParameter parm in linkmanParms)
            cmd.Parameters.Add(parm);

        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            strSQL.Append(SQL_INSERT_LINKMAN);
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
    public SqlDataReader GetBirthdayMan()
    {
        //初始化输入参数并赋值
        SqlParameter[] parm = new SqlParameter[] { new SqlParameter("@today", SqlDbType.DateTime),
                                          new SqlParameter("@endday", SqlDbType.DateTime) };
       //获取今天的日期
        parm[0].Value = DateTime.Now.Date;
        //加7天表示一周后的日期
        parm[1].Value = DateTime.Now.Date.AddDays(7);
        //根据日期区间返回SqlDataReader
        SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_BIRTHDAY, parm);
        return rdr;
    }
    #region 私有方法
    /// <summary>
    /// 获取单位ID的方法
    /// </summary>
    /// <param name="cityname">单位名称</param>
    /// <returns>该单位的ID</returns>
    private int GetCompanyID(string companyname)
    {
        int userid = 0;

        //创建新参数并给参数赋值，用来指定单位名称
        SqlParameter parm = new SqlParameter(PARM_COMPANY_NAME, SqlDbType.NVarChar, 20);
        parm.Value = companyname;

        //调用SqlHelper访问组件的方法返回第一行第一列的值
        try
        {
            userid = (int)SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_COMPANYNAME, parm);
        }
        catch
        {
            //出现错误时，设置为0
            userid =0;
        }

        return userid;
    }
    private static SqlParameter[] GetParameters()
    {
        //将SQL_INSERT_LINKMAN做为哈希表缓存的键值
        SqlParameter[] parms = SqlHelper.GetCachedParameters(SQL_INSERT_LINKMAN);

        //首先判断缓存是否已经存在
        if (parms == null)
        {
            //缓存不存在的情况下，新建参数列表
            parms = new SqlParameter[] {
                    new SqlParameter(PARM_COMPANY_ID, SqlDbType.Int),
                    new SqlParameter(PARM_LINKMAN_NAME, SqlDbType.NVarChar,20),
                    new SqlParameter(PARM_LINKMAN_PHONE, SqlDbType.NVarChar, 20),
                    new SqlParameter(PARM_LINKMAN_MAIL, SqlDbType.NVarChar, 20),
                    new SqlParameter(PARM_LINKMAN_QQ, SqlDbType.NVarChar, 20),
                    new SqlParameter(PARM_LINKMAN_BIRTHDAY, SqlDbType.DateTime),
                    new SqlParameter(PARM_LINKMAN_LIKE, SqlDbType.NVarChar,50),
                    new SqlParameter(PARM_LINKMAN_SEX, SqlDbType.NVarChar,2),
                    new SqlParameter(PARM_LINKMAN_NOTE, SqlDbType.NVarChar,50) };

            //将新建的参数列表添加到哈希表中缓存起来
            SqlHelper.CacheParameters(SQL_INSERT_LINKMAN, parms);
        }
        //返回参数数组
        return parms;
    }
#endregion
}
