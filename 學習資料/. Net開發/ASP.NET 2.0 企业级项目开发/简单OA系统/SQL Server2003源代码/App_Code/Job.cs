using System;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// 关于招聘的操作类
/// </summary>
public class Job
{
   //SQL语句设置为常量，方便日后的维护
    private const string SQL_PARM_DEPARTID = "@departid";
    private const string SQL_PARM_OPENINGJOB = "@jobname";
    private const string SQL_PARM_AMOUNT = "@peopleamount";
    private const string SQL_PARM_REQUIREMENT = "@require";
    private const string SQL_PARM_NOTE = "@note";
    private const string SQL_INSERT_INVITE = "INSERT INTO invite (departid,openingjob,peopleamount,require,note) VALUES(@departid,@jobname,@peopleamount,@require,@note)";
    public Job()
	{
	}
    /// <summary>
    /// 申请空缺的方法
    /// </summary>
    /// <param name="departid">部门ID</param>
    /// <param name="jobname">空缺职位</param>
    /// <param name="peopleamount">招聘人数</param>
    /// <param name="require">招聘要求</param>
    public void SaveApply(int departid, string jobname, int peopleamount, string require,string note)
    {
        //初始化参数数组
        SqlParameter[] parms = new SqlParameter[] {
                new SqlParameter(SQL_PARM_DEPARTID, SqlDbType.Int),
                new SqlParameter(SQL_PARM_OPENINGJOB, SqlDbType.NVarChar,20),
                new SqlParameter(SQL_PARM_AMOUNT, SqlDbType.Int),
                new SqlParameter(SQL_PARM_REQUIREMENT, SqlDbType.NVarChar,200),
                new SqlParameter(SQL_PARM_NOTE, SqlDbType.NVarChar,100)};
        SqlCommand cmd = new SqlCommand();

        // 依次给参数赋值
        parms[0].Value = departid;
        parms[1].Value = jobname;
        parms[2].Value = peopleamount;
        parms[3].Value = require;
        parms[4].Value = note;

        //将参数添加到SqlCommand命令中
        foreach (SqlParameter parm in parms)
            cmd.Parameters.Add(parm);

        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //打开数据库连接，执行命令
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = SQL_INSERT_INVITE;
            //执行添加的SqlCommand命令
            cmd.ExecuteNonQuery();
            //清空SqlCommand命令中的参数
            cmd.Parameters.Clear();
        }
    }
}
