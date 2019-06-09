using System;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// 员工培训记录的操作类
/// </summary>
public class EmployeeTrain
{
   //SQL语句设置为常量，方便日后的维护
    private const string SQL_PARM_TITLE = "@title";
    private const string SQL_PARM_CONTENT = "@content";
    private const string SQL_PARM_DATE = "@traindate";
    private const string SQL_PARM_PEOPLE = "@peoplename";
    private const string SQL_INSERT_TRAIN = "INSERT INTO train VALUES(@title,@content,@traindate,@peoplename,'')";
    public EmployeeTrain()
	{
	}
    /// <summary>
    /// 添加培训记录的方法
    /// </summary>
    /// <param name="title">培训主题</param>
    /// <param name="content">培训内容</param>
    /// <param name="traindate">培训日期</param>
    /// <param name="peoplename">被培训人员</param>
    public void SaveCheck(string title, string content, DateTime traindate, string peoplename)
    {
        //初始化参数数组
        SqlParameter[] parms = new SqlParameter[] {
                new SqlParameter(SQL_PARM_TITLE, SqlDbType.NVarChar,20),
                new SqlParameter(SQL_PARM_CONTENT, SqlDbType.NVarChar,200),
                new SqlParameter(SQL_PARM_DATE, SqlDbType.DateTime),
                new SqlParameter(SQL_PARM_PEOPLE, SqlDbType.NVarChar,100)};
        SqlCommand cmd = new SqlCommand();

        // 依次给参数赋值
        parms[0].Value = title;
        parms[1].Value = content;
        parms[2].Value = traindate;
        parms[3].Value = peoplename;

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
            cmd.CommandText = SQL_INSERT_TRAIN;
            //执行添加的SqlCommand命令
            cmd.ExecuteNonQuery();
            //清空SqlCommand命令中的参数
            cmd.Parameters.Clear();
        }
    }
}
