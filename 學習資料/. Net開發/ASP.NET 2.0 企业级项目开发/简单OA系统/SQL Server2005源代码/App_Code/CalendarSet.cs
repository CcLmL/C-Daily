using System;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// 关于日程安排的操作类
/// </summary>
public class CalendarSet
{
    //SQL语句设置为常量，方便日后的维护
    private const string SQL_PARM_NAME = "@employeename";
    private const string SQL_PARM_TITLE = "@title";
    private const string SQL_PARM_CONTENT = "@content";
    private const string SQL_PARM_SETDATE = "@date";
    private const string SQL_INSERT_CALENDAR = "INSERT INTO calendar VALUES(@employeename,@title,@content,@date)";

	public CalendarSet()
	{
	}
    /// <summary>
    /// 保存一个新的日程
    /// </summary>
    /// <param name="employeename">员工姓名</param>
    /// <param name="title">日程主题</param>
    /// <param name="content">日程内容</param>
    /// <param name="setdate">日程的安排日期</param>
    public void SaveCalendar(string employeename,string title,string content,DateTime setdate)
    {
        //初始化参数数组
        SqlParameter[] parms = new SqlParameter[] {
                new SqlParameter(SQL_PARM_NAME, SqlDbType.NVarChar,20),
                new SqlParameter(SQL_PARM_TITLE, SqlDbType.NVarChar,20),
                new SqlParameter(SQL_PARM_CONTENT, SqlDbType.NVarChar,100),
                new SqlParameter(SQL_PARM_SETDATE, SqlDbType.DateTime)};
        SqlCommand cmd = new SqlCommand();

        // 依次给参数赋值
        parms[0].Value = employeename;
        parms[1].Value = title;
        parms[2].Value = content;
        parms[3].Value = setdate;

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
            cmd.CommandText = SQL_INSERT_CALENDAR;
            //执行添加的SqlCommand命令
            int val = cmd.ExecuteNonQuery();
            //清空SqlCommand命令中的参数
            cmd.Parameters.Clear();
        }
    }
}
