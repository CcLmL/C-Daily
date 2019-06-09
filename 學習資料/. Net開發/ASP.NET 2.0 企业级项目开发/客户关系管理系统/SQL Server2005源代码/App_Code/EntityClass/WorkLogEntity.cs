using System;

/// <summary>
/// 工作日志实体
/// </summary>
public class WorkLogEntity
{
    //定义私有变量
    private string _name = "";
    private string _title = "";
    private string _content = "";
    //设置日志日期默认为当日日期
    private DateTime _logdate = DateTime.Now.Date;

    //无参数的构造函数
	public WorkLogEntity()
	{
	}
    /// <summary>
    /// 有参数的构造函数，初始化日志内容
    /// </summary>
    /// <param name="name">员工姓名</param>
    /// <param name="title">日志主题</param>
    /// <param name="content">日志内容</param>
    /// <param name="logdate">日期</param>
    public WorkLogEntity(string name, string title, string content, DateTime logdate)
    {
        //为私有变量赋值
        this._name = name;
        this._title = title;
        this._content = content;
        this._logdate = logdate;
    }
    
    //员工姓名
    public string Name
    {
        get { return _name; }
        set { _name = value; }
    }
    //日志主题
    public string Title
    {
        get { return _title; }
        set { _title = value; }
    }
    //日志内容
    public string Content
    {
        get { return _content; }
        set { _content = value; }
    }
    //备注日期
    public DateTime LogDate
    {
        get { return _logdate; }
        set { _logdate = value; }
    }
}
