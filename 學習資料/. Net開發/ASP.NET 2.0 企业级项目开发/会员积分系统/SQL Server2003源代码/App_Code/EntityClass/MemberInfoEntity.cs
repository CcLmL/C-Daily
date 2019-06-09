using System;

/// <summary>
/// 会员信息实体-描述会员的详细资料
/// </summary>
public class MemberInfoEntity
{
    private string _CardNum = "";
    private int _CardID = 0;
    private string _CustName = "";
    private string _custIdentity = "";
    private string _CustPhone = "";
    private string _CustAdress = "";
    private DateTime _CardDate = System.DateTime.Now;

    //无参数的构造函数
	public MemberInfoEntity()
	{
	}

    /// <summary>
    /// 有参数的构造函数，初始化会员资料信息
    /// </summary>
    /// <param name="cardNum">会员卡号</param>
    /// <param name="custName">会员姓名</param>
    /// <param name="custIdentity">会员身份证号</param>
    /// <param name="custPhone">会员电话</param>
    /// <param name="custAddress">会员的地址</param>
    /// <param name="cardDate">办卡日期</param>
    /// <param name="cardid">会员卡类型ID</param>
    public MemberInfoEntity(string cardNum,string custName,string custIdentity,string custPhone,string custAddress,DateTime cardDate,int cardid)
    {
        this._CardNum = cardNum;
        this._CustName = custName;
        this._custIdentity = custIdentity;
        this._CustPhone = custPhone;
        this._CustAdress = custAddress;
        this._CardDate = cardDate;
        this._CardID = cardid;
    }
    
    //会员卡号属性
    public string CardNum
    {
        get { return _CardNum; }
        set { _CardNum = value; }
    }
    //会员卡类型ID，对应相关联表中的会员卡类型
    public int CardID
    {
        get { return _CardID; }
        set { _CardID = value; }
    }
    //会员姓名属性
    public string CustName
    {
        get { return _CustName; }
        set { _CustName = value; }
    }
    //会员身份证属性
    public string CustIdentity
    {
        get { return _custIdentity; }
        set { _custIdentity = value; }
    }
    //会员的电话属性
    public string CustPhone
    {
        get { return _CustPhone; }
        set { _CustPhone = value; }
    }
    //会员的地址属性
    public string CustAdress
    {
        get { return _CustAdress; }
        set { _CustAdress = value; }
    }
    //会员办卡的日期
    public DateTime CardDate
    {
        get { return _CardDate; }
        set { _CardDate = value; }
    }
}
