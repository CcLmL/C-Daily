using System;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// 工作日志的实体方法
/// </summary>
public class WorkLogDA
{
    //定义常量表示字段名称或SQL语句。
    private const string SQL_INSERT_WORKLOG = "INSERT INTO worklog VALUES(@employeeid,@title,@content, @logdate)";
    private const string PARM_WORKLOG_TITLE = "@title";
    private const string PARM_WORKLOG_CONTENT = "@content";
    private const string PARM_WORKLOG_LOGDATE = "@logdate";
    private const string PARM_EMPLOYEE_NAME = "@name";
    private const string PARM_EMPLOYEE_ID = "@employeeid";
    private const string SQL_SELECT_EMPLOYEEID = "SELECT employeeid FROM employeeinfo WHERE employeename=@name";

    public WorkLogDA()
	{
	}
    /// <summary>
    /// 添加工作日志
    /// </summary>
    /// <param name="employee">日志实体</param>
    /// <returns>添加是否成功</returns>
    public bool InsertWorkLog(WorkLogEntity worklog)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlParameter[] worklogParms = GetParameters();
        SqlCommand cmd = new SqlCommand();

        // 依次给实体参数赋值
        worklogParms[1].Value = worklog.Title;
        worklogParms[2].Value = worklog.Content;
        worklogParms[3].Value = worklog.LogDate;
        //获取员工的ID
        int employeeid = GetEmployeeID(worklog.Name);
        worklogParms[0].Value = employeeid;

        //遍历所有参数，并将参数添加到SqlCommand命令中
        foreach (SqlParameter parm in worklogParms)
            cmd.Parameters.Add(parm);

        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            strSQL.Append(SQL_INSERT_WORKLOG);
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
    private static SqlParameter[] GetParameters()
    {
        //将SQL_INSERT_WORKLOG做为哈希表缓存的键值
        SqlParameter[] parms = SqlHelper.GetCachedParameters(SQL_INSERT_WORKLOG);

        //首先判断缓存是否已经存在
        if (parms == null)
        {
            //缓存不存在的情况下，新建参数列表
            parms = new SqlParameter[] {
                    new SqlParameter(PARM_EMPLOYEE_ID, SqlDbType.Int),
                    new SqlParameter(PARM_WORKLOG_TITLE, SqlDbType.NVarChar, 20),
                    new SqlParameter(PARM_WORKLOG_CONTENT, SqlDbType.NVarChar, 100),
                    new SqlParameter(PARM_WORKLOG_LOGDATE, SqlDbType.DateTime) };

            //将新建的参数列表添加到哈希表中缓存起来
            SqlHelper.CacheParameters(SQL_INSERT_WORKLOG, parms);
        }
        //返回参数数组
        return parms;
    }
    #endregion
}
