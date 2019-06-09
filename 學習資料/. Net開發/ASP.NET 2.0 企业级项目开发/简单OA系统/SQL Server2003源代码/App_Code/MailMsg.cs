using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Net;
using System.Net.Sockets;
/// <summary>
/// 处理MAIL信息的类
/// </summary>
public class MailMsg
{
    //SQL语句设置为常量，方便日后的维护
    private const string SQL_PARM_HOST = "@host";
    private const string SQL_PARM_PORT = "@port";
    private const string SQL_PARM_MAIL = "@mail";
    private const string SQL_PARM_PASSWORD = "@pass";
    private const string SQL_PARM_USERNAME = "@username";
    private const string SQL_INSERT_SMTPSET = "INSERT INTO smtpset VALUES(@host,@port,@username,@mail,@pass)";
    private const string SQL_SELECT_SMTPSET = "SELECT * FROM smtpset WHERE username=@username";
	public MailMsg()
	{
	}
    /// <summary>
    /// 保存SMTP配置的方法
    /// </summary>
    /// <param name="host">邮件服务器</param>
    public void SaveSmtpSet(SmtpEntity smtp)
    {
        //初始化参数数组
        SqlParameter[] parms = new SqlParameter[] {
                new SqlParameter(SQL_PARM_HOST, SqlDbType.NVarChar,20),
                new SqlParameter(SQL_PARM_PORT, SqlDbType.Int),
                new SqlParameter(SQL_PARM_USERNAME, SqlDbType.NVarChar,20),
                new SqlParameter(SQL_PARM_MAIL, SqlDbType.NVarChar,50),
                new SqlParameter(SQL_PARM_PASSWORD, SqlDbType.NVarChar, 50)};
        SqlCommand cmd = new SqlCommand();

        // 依次给参数赋值
        parms[0].Value = smtp.Host;
        parms[1].Value = smtp.Port;
        parms[2].Value = smtp.UserName;
        parms[3].Value = smtp.Mail;
        parms[4].Value = smtp.Password;

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
            cmd.CommandText = SQL_INSERT_SMTPSET;
            //执行添加的SqlCommand命令
            int val = cmd.ExecuteNonQuery();
            //清空SqlCommand命令中的参数
            cmd.Parameters.Clear();
        }
    }
    /// <summary>
    /// 获取当前用户的SMTP设置
    /// </summary>
    /// <param name="name">用户名</param>
    /// <returns>返回设置实体</returns>
    public static SmtpEntity GetUserByName(string name)
    {
        //初始化返回的变量
        SmtpEntity mysmtp = null;
        //初始化参数并赋值
        SqlParameter parm = new SqlParameter(SQL_PARM_USERNAME, SqlDbType.NVarChar, 20);
        parm.Value = name;

        //执行DataReader命令，获取数据
        using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_SMTPSET, parm))
        {
            //通过循环依次获取
            while (rdr.Read())
            {
                //使用有参数的构造函数为信息实体赋值
                mysmtp = new SmtpEntity(rdr.GetString(1), rdr.GetInt32(2), rdr.GetString(3), rdr.GetString(4), rdr.GetString(5));
            }
        }
        //返回实体信息
        return mysmtp;
    }
    /// <summary>
    /// 读取邮件的设置
    /// </summary>
    /// <param name="pop">邮件服务器地址</param>
    /// <param name="username">用户名</param>
    /// <param name="pass">密码</param>
    /// <returns>新内容</returns>
    public string  ReadMail(string pop, string username, string pass)
    {
        //定义一个新的客户端连接，并连接到远程端口
        TcpClient tcp = new TcpClient(pop, 110);
        //返回此连接的网络数据流
        NetworkStream stream = tcp.GetStream();
        string response = GetResponse(tcp, stream);
        //创建新行
        string newline = Environment.NewLine;
        string strEnd = newline + "." + newline + "+OK " + newline;
        //向服务器发送命令
        SendCommand(tcp, stream, "user " + username);
        SendCommand(tcp, stream, "pass " + pass);
        response = SendCommand(tcp, stream, "stat");
        int iCount = Int32.Parse(response.Split(' ')[1]);
        //Response.Write(iCount + " Messages");
        for (int i = 1; i < 5; i++) response += SendCommand(tcp, stream, "top " + i + " 0");
        response += SendCommand(tcp, stream, "QUIT");
        // while (!response.EndsWith(strEnd)) response += GetResponse(tcp,stream);
        //关闭端口
        tcp.Close();
        return response;
    }
    //定义一个发送POP命令的方法
    private string SendCommand(TcpClient tcp,NetworkStream stream,string content)
    {
        //获取字节流
        byte[] data = Encoding.GetEncoding(936).GetBytes(content + Environment.NewLine);
        //写入到定义的网络数据流内
        stream.Write(data, 0, data.Length);
        //返回数据流
        return GetResponse(tcp,stream);
    }
    private string GetResponse(TcpClient tcp, NetworkStream stream)
    {
        //设置数据缓冲区
        byte[] data = new byte[tcp.ReceiveBufferSize];
        //从数据流的开始位置读取整个数据内容
        int myrec = stream.Read(data, 0, data.Length);
        return Encoding.GetEncoding(936).GetString(data, 0, myrec);
    }

}
