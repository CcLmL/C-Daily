using System;

/// <summary>
/// 员工资料实体
/// </summary>
public class EmployeeEntity
{
    //定义私有变量
    private string _name = "";
    private string _sex = "";
    private string _phone = "";
    private string _mail = "";
    private DateTime _birthday;
    private string _note = "";
    private string _depart = "";

    //无参数的构造函数
	public EmployeeEntity()
	{
	}

    /// <summary>
    /// 有参数的构造函数，初始化联系资料
    /// </summary>
    /// <param name="name">姓名</param>
    /// <param name="sex">性别</param>
    /// <param name="phone">电话</param>
    /// <param name="birthday">生日</param>
    /// <param name="mail">邮箱</param>
    /// <param name="note">备注</param>
    /// <param name="depart">部门</param>
    public EmployeeEntity(string name, string sex, string phone, DateTime birthday, string mail, string note, string depart)
    {
        //为私有变量赋值
        this._depart = depart;
        this._name = name;
        this._sex = sex;
        this._phone = phone;
        this._birthday = birthday;
        this._mail = mail;
        this._note = note;
    }
    
    //员工姓名属性
    public string Name
    {
        get { return _name; }
        set { _name = value; }
    }
    //性别
    public string Sex
    {
        get { return _sex; }
        set { _sex = value; }
    }
    //电话属性
    public string Phone
    {
        get { return _phone; }
        set { _phone = value; }
    }
    //生日
    public DateTime Birthday
    {
        get { return _birthday; }
        set { _birthday = value; }
    }
    //Mail属性
    public string Mail
    {
        get { return _mail; }
        set { _mail = value; }
    }
    //备注属性
    public string Note
    {
        get { return _note; }
        set { _note = value; }
    }
    //员工所在部门
    public string Depart
    {
        get { return _depart; }
        set { _depart = value; }
    }
}