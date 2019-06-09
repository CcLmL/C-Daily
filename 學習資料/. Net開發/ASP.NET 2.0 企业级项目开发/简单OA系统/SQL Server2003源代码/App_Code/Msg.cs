using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Configuration;

/// <summary>
/// 短信息管理类
/// </summary>
public class Msg
{
    //SQL语句设置为常量，方便日后的维护
    private const string SQL_PARM_RECEIVE = "@receive";
    private const string SQL_PARM_SEND = "@send";
    private const string SQL_PARM_TITLE = "@title";
    private const string SQL_PARM_CONTENT = "@content";
    private const string SQL_PARM_MSGID = "@msgid";
    private const string SQL_INSERT_MESSAGE = "INSERT INTO message VALUES(@receive,@send,@title,@content,'0')";
    private const string SQL_UPDATE_ISREAD = "UPDATE message SET isread='1' where msgid=@msgid";

    private const string SQL_SELECT_MESSAGE = "SELECT msgid FROM message WHERE isread=0 and receive=@receive";

    public Msg()
    {
    }
    /// <summary>
    /// 发送信息的方法
    /// </summary>
    /// <param name="receive">收件人</param>
    /// <param name="send">发件人</param>
    /// <param name="title">主题</param>
    /// <param name="content">内容</param>
    /// <returns>返回是否成功</returns>
    public bool SendMSG(string receive,string send,string title,string content)
    {
        //首先要判断填写的用户名是否正确。
        if (Membership.FindUsersByName(receive) == null)
            return false;
        else
        {
            //初始化参数数组
            SqlParameter[] parms = new SqlParameter[] {
                    new SqlParameter(SQL_PARM_RECEIVE, SqlDbType.NVarChar,20),
                    new SqlParameter(SQL_PARM_SEND, SqlDbType.NVarChar,20),
                    new SqlParameter(SQL_PARM_TITLE, SqlDbType.NVarChar,20),
                    new SqlParameter(SQL_PARM_CONTENT, SqlDbType.NVarChar, 100)};
            SqlCommand cmd = new SqlCommand();

            // 依次给参数赋值
            parms[0].Value = receive;
            parms[1].Value = send;
            parms[2].Value = title;
            parms[3].Value = content;

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
                cmd.CommandText = SQL_INSERT_MESSAGE;
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
    }
    public void UpdateSign(int msgid)
    {
        SqlParameter parm = new SqlParameter(SQL_PARM_MSGID, SqlDbType.Int);
        SqlCommand cmd = new SqlCommand();

        // 给参数赋值
        parm.Value = msgid;

        //将参数添加到SqlCommand命令中
        cmd.Parameters.Add(parm);

        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //打开数据库连接，执行命令
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = SQL_UPDATE_ISREAD;
            //执行添加的SqlCommand命令
            int val = cmd.ExecuteNonQuery();
            //清空SqlCommand命令中的参数
            cmd.Parameters.Clear();
        }
    }
    /// <summary>
    /// 判断是否有新消息的方法
    /// </summary>
    /// <param name="username">登录用户名</param>
    public static bool GetNewMsg(string username)
    {
        SqlParameter parm = new SqlParameter(SQL_PARM_RECEIVE, SqlDbType.NVarChar, 20);
        parm.Value = username;
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.Add(parm);
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //打开数据库连接，执行命令
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = SQL_SELECT_MESSAGE;
            //执行添加的SqlCommand命令
            SqlDataReader dr = cmd.ExecuteReader();
            //只是判断是否有值，不需要返回值内容
            int msgid=0;
            while (dr.Read())
                //选取第一列的内容
                msgid = dr.GetInt32(0);
            if (msgid == 0)
                return false;
            else
                return true;
        }
    }
}
