using System;
using System.Data;
using System.Data.SqlClient;


/// <summary>
/// MsgManager 的摘要说明
/// </summary>
public class MsgManager
{
	public MsgManager()
	{
	}
    /// <summary>
    /// 添加聊天内容到数据库中
    /// </summary>
    /// <param name="fromname">发言人</param>
    /// <param name="toname">目标对象</param>
    /// <param name="contentdata">发言内容</param>
    /// <param name="posttime">发言时间</param>
    public void AddMsg(string fromname,string toname,string contentdata,DateTime posttime)
    {
        string sql = "INSERT INTO ChatInfo VALUES('" + fromname + "','" + toname
            + "','" + contentdata + "','" + posttime.ToString()+"')";
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
    /// <summary>
    /// 获取当前最大的聊天ID
    /// </summary>
    /// <returns>最大的聊天ID</returns>
    public int  GetMsgID()
    {
        string sql = "SELECT top 1 chatid FROM chatinfo order by ChatID DESC";
        SqlCommand cmd = new SqlCommand();
        //调用SqlHelper访问组件的方法返回第一行第一列的值
        int count = (int)SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql, null);
        return count;
    }
    /// <summary>
    /// 读取聊天记录
    /// </summary>
    /// <param name="msgid">发生的ID</param>
    /// <returns>聊天记录</returns>
    public string  GetMsg(int msgid)
    {
        string sql = "SELECT * FROM chatinfo  WHERE chatid >" + msgid + "order by ChatID DESC";
        SqlCommand cmd = new SqlCommand();
        string msg="";
       //使用DataReader来保存返回的数据
        using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql, null))
        {
            //如果数据有多条，循环读取
            while (rdr.Read())
            {

                msg = rdr.GetString(1) + " 对 " + rdr.GetString(2)
                    + " 说:" + rdr.GetString(3)
                    + rdr.GetDateTime(4);
            }
        }
        //返回信息字符串
        return msg;
    }
}
