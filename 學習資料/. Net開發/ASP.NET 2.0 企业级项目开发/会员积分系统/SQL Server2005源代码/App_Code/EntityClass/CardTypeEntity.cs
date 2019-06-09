using System;

/// <summary>
/// 会员卡类型实体信息
/// </summary>
[Serializable()]
public class CardTypeEntity
{
    //定义的变量与数据库中的会员卡类型表字段一一对应
    private string _CardTypeName = "";
    private int _CardRule = 0;
    /// <summary>
    /// 默认不带参数的构造函数
    /// </summary>
	public CardTypeEntity()
	{        
	}

    /// <summary>
    /// 带参数的构造函数
    /// </summary>
    /// <param name="cardtypename">卡类型名称</param>
    /// <param name="cardrule">卡积分规则</param>
    public CardTypeEntity(string cardtypename, int cardrule)
    {
        this._CardTypeName = cardtypename;
        this._CardRule = cardrule;
    }
    
    /// <summary>
    /// 卡类型名称属性
    /// </summary>
    public string CardTypeName
    {
        get { return _CardTypeName; }
        set { _CardTypeName = value; }
    }
    
    /// <summary>
    /// 卡积分规则属性
    /// </summary>
    public int CardRule
    {
        get { return _CardRule; }
        set { _CardRule = value; }
    }
}
