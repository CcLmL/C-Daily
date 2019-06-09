using System;

/// <summary>
/// 客户资料实体信息
/// </summary>
public class UserInfoEntity
{
    //定义私有变量
    private string _username = "";
    private string _softversion = "";
    private string _usertype = "";
    private string _usergrade = "";
    private string _userstate = "";
    private string _city = "";
    private string _address = "";
    private string _linkman = "";
    private string _phone = "";
    private string _fax = "";
    private string _mail = "";
    private string _qq = "";
    private int _peopleamount = 0;

    //无参数的构造函数
	public UserInfoEntity()
	{
	}

    /// <summary>
    /// 有参数的构造函数，初始化客户资料
    /// </summary>
    /// <param name="username">客户全称</param>
    /// <param name="softversion">所用软件的版本</param>
    /// <param name="usertype">客户的业务类型</param>
    /// <param name="userstate">客户状态</param>
    /// <param name="usergrade">客户等级</param>
    /// <param name="city">客户所在城市</param>
    /// <param name="address">客户的具体地址</param>
    /// <param name="linkman">客户单位的主要联系人</param>
    /// <param name="phone">联系电话</param>
    /// <param name="fax">传真</param>
    /// <param name="mail">客户的E-Mail</param>
    /// <param name="qq">主要联系QQ号</param>
    /// <param name="peopleamount">客户单位的人数</param>
    public UserInfoEntity(string username, string softversion, string usertype,
        string userstate, string usergrade, string city,string address,
        string linkman,string phone,string fax,string mail,string qq,string peopleamount)
    {
        //为私有变量赋值
        this._username = username;
        this._softversion = softversion;
        this._usertype = usertype;
        this._userstate = userstate;
        this._usergrade = usergrade;
        this._address = address;
        this._linkman = linkman;
        this._phone = phone;
        this._fax = fax;
        this._mail = mail;
        this._qq = qq;
        //注意类型的匹配
        this._peopleamount = int.Parse(peopleamount);

    }
    
    //客户名称属性
    public string UserName
    {
        get { return _username; }
        set { _username = value; }
    }
    //软件版本属性
    public string SoftVersion
    {
        get { return _softversion; }
        set { _softversion = value; }
    }
    //业务类型属性
    public string UserType
    {
        get { return _usertype; }
        set { _usertype = value; }
    }
    //客户等级属性
    public string UserGrade
    {
        get { return _usergrade; }
        set { _usergrade = value; }
    }
    //客户状态属性
    public string UserState
    {
        get { return _userstate; }
        set { _userstate = value; }
    }
    //客户所在城市属性
    public string City
    {
        get { return _city; }
        set { _city = value; }
    }
    //客户地址属性
    public string Address
    {
        get { return _address; }
        set { _address = value; }
    }
    //客户联系人属性
    public string LinkMan
    {
        get { return _linkman; }
        set { _linkman = value; }
    }
    //客户电话属性
    public string Phone
    {
        get { return _phone; }
        set { _phone = value; }
    }
    //客户传真属性
    public string Fax
    {
        get { return _fax; }
        set { _fax = value; }
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
    //客户单位软员数量属性
    public int PeopleAmount
    {
        get { return _peopleamount; }
        set { _peopleamount = value; }
    }
}
