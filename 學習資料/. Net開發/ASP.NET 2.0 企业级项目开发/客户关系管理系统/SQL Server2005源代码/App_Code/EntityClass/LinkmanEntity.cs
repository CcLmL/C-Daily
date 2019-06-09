using System;

/// <summary>
/// 联系人资料实体
/// </summary>
public class LinkmanEntity
{
    //定义私有变量
    private string _name = "";
    private string _sex = "";
    private string _phone = "";
    private string _mail = "";
    private string _qq = "";
    private DateTime _birthday;
    private string _like = "";
    private string _note = "";
    private string _companyname = "";

    //无参数的构造函数
	public LinkmanEntity()
	{
	}

    /// <summary>
    /// 有参数的构造函数，初始化联系资料
    /// </summary>
    /// <param name="name">联系人姓名</param>
    /// <param name="sex">性别</param>
    /// <param name="phone">电话</param>
    /// <param name="birthday">生日</param>
    /// <param name="mail">邮箱</param>
    /// <param name="qq">QQ号</param>
    /// <param name="like">个人爱好</param>
    /// <param name="note">备注</param>
    public LinkmanEntity(string name, string sex,string phone,DateTime birthday,string mail,string qq,string like,string note,string companyname)
    {
        //为私有变量赋值
        this._companyname = companyname;
        this._name = name;
        this._sex = sex;
        this._phone = phone;
        this._birthday = birthday;
        this._mail = mail;
        this._qq = qq;
        this._like = like;
        this._note = note;
    }
    
    //联系人名称属性
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
    //客户Mail属性
    public string Mail
    {
        get { return _mail; }
        set { _mail = value; }
    }
    //客户QQ属性
    public string QQ
    {
        get { return _qq; }
        set { _qq = value; }
    }
    //联系人的个人爱好属性
    public string Like
    {
        get { return _like; }
        set { _like = value; }
    }
    //联系人的备注属性
    public string Note
    {
        get { return _note; }
        set { _note = value; }
    }
    //联系人所在单位的名称
    public string CompanyName
    {
        get { return _companyname; }
        set { _companyname = value; }
    }
}
