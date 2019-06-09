using System;

/// <summary>
/// 邮件服务器配置实体
/// </summary>
public class SmtpEntity
{
    private string _Host = "";
    private string _Mail = "";
    private string _Name = "";
    private string _Pass = "";
    private int _Port = 25;

    //不带参数的构造函数
	public SmtpEntity()
	{
	}
    //带参数的构造函数
    public SmtpEntity(string host,int port,string name,string mail,string pass)
    {
        this._Host = host;
        this._Port = port;
        this._Name = name;
        this._Mail = mail;
        this._Pass = pass;
    }
    //邮件服务器地址
    public string Host
    {
        get { return _Host; }
        set { _Host = value; }
    }
    //邮件服务器端口
    public int  Port
    {
        get { return _Port; }
        set { _Port = value; }
    }
    //员工名称
    public string UserName
    {
        get { return _Name; }
        set { _Name = value; }
    }
    //邮件全名
    public string Mail
    {
        get { return _Mail; }
        set { _Mail = value; }
    }
    //邮件服务器登录密码
    public string Password
    {
        get { return _Pass; }
        set { _Pass = value; }
    }
}
