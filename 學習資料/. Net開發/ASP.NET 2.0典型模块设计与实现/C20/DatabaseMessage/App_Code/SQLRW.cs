using System;
using System.Data;
using System.Data.SqlClient;
/// <summary>
/// 数据库保存方法
/// </summary>
public class SQLRW
{
	public SQLRW()
	{	}
    /// <summary>
    /// 添加留言到数据库中
    /// </summary>
    /// <param name="name">发言人姓名</param>
    /// <param name="url">发言人网址</param>
    /// <param name="mail">发言人邮箱</param>
    /// <param name="msg">发言内容</param>
    public void AddMsg(string name,string url,string mail,string msg )
    {
        string sql = "INSERT INTO msgView VALUES('" + name + "','" + mail
    + "','" + url + "','" + msg + "')";
        SqlCommand cmd = new SqlCommand();
        //定义对象资源保存的范围，一旦using范围结束，将释放对方所占的资源
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            conn.Open();
            //设定SqlCommand的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = sql;
            //执行SqlCommand命令
            cmd.ExecuteNonQuery();
        }
    }
}
