using System;

/// <summary>
/// 付款信息实体类
/// </summary>
public class PayInfo
{
    //内部变量
    string _name;
    string _cardtype;
    string _cartnum;
    //默认的构造函数
	public PayInfo()
	{
	}
    //带参数的构造函数
    public PayInfo( string name,string cardtype,string cardnum)
    {
        this._name = name;
        this._cardtype = cardtype;
        this._cartnum = cardnum;
    }
    //公共属性
    public string Name
    {
        get { return _name; }
        set { _name = value; }
    }
    public string CardType
    {
        get { return _cardtype; }
        set { _cardtype = value; }
    }
    public string CardNum
    {
        get { return _cartnum; }
        set { _cartnum = value; }
    }
}
