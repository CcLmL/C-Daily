using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// 员工考核的方法
/// </summary>
public class Check
{
    //SQL语句设置为常量，方便日后的维护
    private const string SQL_PARM_NAME = "@employeename";
    private const string SQL_PARM_DATA = "@checkdata";
    private const string SQL_PARM_DATE = "@checkdate";
    private const string SQL_INSERT_CHECK = "INSERT INTO checks VALUES(@employeename,@checkdata,@checkdate)";
    public Check()
	{
	}
    /// <summary>
    /// 登记考核的方法
    /// </summary>
    /// <param name="name">被考核员工</param>
    /// <param name="data">考核数据</param>
    /// <param name="checkdate">考核日期</param>
    public void SaveCheck(string name,string data,DateTime checkdate)
    {
        //初始化参数数组
        SqlParameter[] parms = new SqlParameter[] {
                new SqlParameter(SQL_PARM_NAME, SqlDbType.NVarChar,20),
                new SqlParameter(SQL_PARM_DATA, SqlDbType.NVarChar,50),
                new SqlParameter(SQL_PARM_DATE, SqlDbType.DateTime)};
        SqlCommand cmd = new SqlCommand();

        // 依次给参数赋值
        parms[0].Value = name;
        parms[1].Value = data;
        parms[2].Value = checkdate;

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
            cmd.CommandText = SQL_INSERT_CHECK;
            //执行添加的SqlCommand命令
            cmd.ExecuteNonQuery();
            //清空SqlCommand命令中的参数
            cmd.Parameters.Clear();
        }
    }
}
