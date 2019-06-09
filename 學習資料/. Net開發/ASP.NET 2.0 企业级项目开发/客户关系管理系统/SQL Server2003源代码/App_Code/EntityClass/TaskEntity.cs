using System;

/// <summary>
/// TaskEntity 的摘要说明
/// </summary>
public class TaskEntity
{
        //定义私有变量
    private string _name = "";
    private string _username = "";
    private string _title = "";
    private string _note = "";
    private DateTime _begindate ;
    private DateTime _enddate ;

    //无参数的构造函数
	public TaskEntity()
	{
	}
    /// <summary>
    /// 有参数的构造函数，初始化日志内容
    /// </summary>
    /// <param name="name">员工姓名</param>
    /// <param name="username">客户名称</param>
    /// <param name="title">主题</param>
    /// <param name="note">备注</param>
    /// <param name="begindate">开始日期</param>
    /// <param name="enddate">开始日期</param>
    public TaskEntity(string name, string username,string title, string note, DateTime begindate, DateTime enddate)
    {
        //为私有变量赋值
        this._name = name;
        this._username = username;
        this._title = title;
        this._note = note;
        this._begindate = begindate;
        this._enddate = enddate;
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
    //任务主题
    public string Title
    {
        get { return _title; }
        set { _title = value; }
    }
    //联系备注
    public string Note
    {
        get { return _note; }
        set { _note = value; }
    }
    //开始日期
    public DateTime BeginDate
    {
        get { return _begindate; }
        set { _begindate = value; }
    }
    //结束日期
    public DateTime EndDate
    {
        get { return _enddate; }
        set { _enddate = value; }
    }
}
