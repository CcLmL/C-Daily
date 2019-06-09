using System;

/// <summary>
/// 订单实体
/// </summary>
[Serializable]
public class OrderInfo
{
    // 内部变量
    private int orderId;
    private DateTime date;
    private string userId;
    private PayInfo creditCard;
    private AddressInfo billingAddress;
    private AddressInfo shippingAddress;
    private decimal orderTotal;
    private LineItemInfo[] lineItems;

    /// <summary>
    /// 默认的构造函数
    /// </summary>
    public OrderInfo() { }

    /// <summary>
    /// 带参数的构造函数
    /// </summary>
    /// <param name="orderId">订单ID</param>
    /// <param name="date">订单提交日期</param>
    /// <param name="userId">用户ID</param>
    /// <param name="creditCard">付款信息</param>
    /// <param name="billing">帐户地址</param>
    /// <param name="shipping">送货地址</param>
    /// <param name="total">订单总额</param>
    /// <param name="line">订单内容</param>
    public OrderInfo(int orderId, DateTime date, string userId, PayInfo creditCard, AddressInfo billing, AddressInfo shipping, decimal total, LineItemInfo[] line)
    {
        this.orderId = orderId;
        this.date = date;
        this.userId = userId;
        this.creditCard = creditCard;
        this.billingAddress = billing;
        this.shippingAddress = shipping;
        this.orderTotal = total;
        this.lineItems = line;
    }

    // 公共属性
    public int OrderId
    {
        get { return orderId; }
        set { orderId = value; }
    }
    public DateTime Date
    {
        get { return date; }
        set { date = value; }
    }
    public string UserId
    {
        get { return userId; }
        set { userId = value; }
    }
    public PayInfo CreditCard
    {
        get { return creditCard; }
        set { creditCard = value; }
    }
    public AddressInfo BillingAddress
    {
        get { return billingAddress; }
        set { billingAddress = value; }
    }
    public AddressInfo ShippingAddress
    {
        get { return shippingAddress; }
        set { shippingAddress = value; }
    }
    public decimal OrderTotal
    {
        get { return orderTotal; }
        set { orderTotal = value; }
    }
    public LineItemInfo[] LineItems
    {
        get { return lineItems; }
        set { lineItems = value; }
    }
}
