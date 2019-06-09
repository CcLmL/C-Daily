using System;

/// <summary>
/// 最近联系记录的实体
/// </summary>
public class LinkRecordEntity
{
    //定义私有变量
    private string _name = "";
    private string _username = "";
    private string _note = "";
    //设置日期默认为当日日期
    private DateTime _linkdate = DateTime.Now.Date;

    //无参数的构造函数
	public LinkRecordEntity()
	{
	}
    /// <summary>
    /// 有参数的构造函数，初始化日志内容
    /// </summary>
    /// <param name="name">员工姓名</param>
    /// <param name="username">客户名称</param>
    /// <param name="note">联系备注</param>
    /// <param name="linkdate">日期</param>
    public LinkRecordEntity(string name, string username, string note, DateTime linkdate)
    {
        //为私有变量赋值
        this._name = name;
        this._username = username;
        this._note = note;
        this._linkdate = linkdate;
    }
    
    //员工姓名
    public string Name
    {
        get { return _name; }
        set { _name = value; }
    }
    //客户名称
    public string UserName
    {
        get { return _username; }
        set { _username = value; }
    }
    //联系备注
    public string Note
    {
        get { return _note; }
        set { _note = value; }
    }
    //联系日期
    public DateTime LinkDate
    {
        get { return _linkdate; }
        set { _linkdate = value; }
    }
}
