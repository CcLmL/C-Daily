using System;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
/// <summary>
/// 联系记录的实体方法
/// </summary
public class LinkRecordDA
{
    //定义常量表示字段名称或SQL语句。
    private const string SQL_INSERT_LINKRECORD = "INSERT INTO linkrecord VALUES(@employeeid,@userid,@linkdate,@linknote )";
    private const string PARM_LINK_NOTE = "@linknote";
    private const string PARM_LINK_DATE = "@linkdate";
    private const string PARM_EMPLOYEE_NAME = "@name";
    private const string PARM_EMPLOYEE_ID = "@employeeid";
    private const string PARM_USER_NAME = "@username";
    private const string PARM_USER_ID = "@userid";
    private const string SQL_SELECT_EMPLOYEEID = "SELECT employeeid FROM employeeinfo WHERE employeename=@name";
    private const string SQL_SELECT_USERID = "SELECT userid FROM userinfo WHERE username=@username";

    public LinkRecordDA()
	{
	}
    /// <summary>
    /// 添加联系记录
    /// </summary>
    /// <param name="employee">联系记录实体</param>
    /// <returns>添加是否成功</returns>
    public bool InsertLinkRecord(LinkRecordEntity link)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlParameter[] linkParms = GetParameters();
        SqlCommand cmd = new SqlCommand();

        // 依次给实体参数赋值
        linkParms[2].Value = link.Note;
        linkParms[3].Value = link.LinkDate;
        //获取员工的ID
        int employeeid = GetEmployeeID(link.Name);
        linkParms[0].Value = employeeid;
        //获取客户的ID
        int userid = GetUserID(link.UserName);
        linkParms[1].Value = userid;

        //遍历所有参数，并将参数添加到SqlCommand命令中
        foreach (SqlParameter parm in linkParms)
            cmd.Parameters.Add(parm);

        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            strSQL.Append(SQL_INSERT_LINKRECORD);
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
    #region 私有方法
    /// <summary>
    /// 获取员工ID的方法
    /// </summary>
    /// <param name="cityname">员工名称</param>
    /// <returns>该员工的ID</returns>
    private int GetEmployeeID(string employeename)
    {
        //创建新参数并给参数赋值，用来指定会员名称
        SqlParameter parm = new SqlParameter(PARM_EMPLOYEE_NAME, SqlDbType.NVarChar, 20);
        parm.Value = employeename;

        //调用SqlHelper访问组件的方法返回第一行第一列的值
        //如果用户填写错误的员工名称，则给予错误提示
        try
        {
            int employeeid = (int)SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_EMPLOYEEID, parm);
            return employeeid;
        }
        catch(Exception e)
        {
            throw new Exception("请确认姓名填写是否正确！");
        }

    }
    /// <summary>
    /// 获取客户ID的方法
    /// </summary>
    /// <param name="username">客户名称</param>
    /// <returns>该客户的ID</returns>
    private int GetUserID(string username)
    {
        //创建新参数并给参数赋值，用来指定会员名称
        SqlParameter parm = new SqlParameter(PARM_USER_NAME, SqlDbType.NVarChar, 20);
        parm.Value = username;

        //调用SqlHelper访问组件的方法返回第一行第一列的值
        //如果用户填写错误的客户名称，则给予错误提示
        try
        {
            int userid = (int)SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_USERID, parm);
            return userid;
        }
        catch (Exception e)
        {
            throw new Exception("请确认客户名称填写是否正确！");
        }

    }
    private static SqlParameter[] GetParameters()
    {
        //将SQL_INSERT_WORKLOG做为哈希表缓存的键值
        SqlParameter[] parms = SqlHelper.GetCachedParameters(SQL_INSERT_LINKRECORD);

        //首先判断缓存是否已经存在
        if (parms == null)
        {
            //缓存不存在的情况下，新建参数列表
            parms = new SqlParameter[] {
                    new SqlParameter(PARM_EMPLOYEE_ID, SqlDbType.Int),
                    new SqlParameter(PARM_USER_ID, SqlDbType.Int),
                    new SqlParameter(PARM_LINK_NOTE, SqlDbType.NVarChar, 100),
                    new SqlParameter(PARM_LINK_DATE, SqlDbType.DateTime) };

            //将新建的参数列表添加到哈希表中缓存起来
            SqlHelper.CacheParameters(SQL_INSERT_LINKRECORD, parms);
        }
        //返回参数数组
        return parms;
    }
    #endregion
}
