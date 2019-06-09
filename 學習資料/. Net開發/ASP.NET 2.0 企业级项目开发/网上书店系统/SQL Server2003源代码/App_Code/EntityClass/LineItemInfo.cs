using System;

/// <summary>
/// 订单中某条记录的具体信息
/// </summary>
[Serializable]
public class LineItemInfo
{
    // 内部变量
    private int id;
    private string productName;
    private int line;
    private int quantity;
    private decimal price;

    /// <summary>
    /// 默认的构造函数
    /// </summary>
    public LineItemInfo() { }

    /// <summary>
    /// 带参数的构造函数
    /// </summary>
    /// <param name="id">购物篮中的项目ID</param>
    /// <param name="line">行号</param>
    /// <param name="qty">订单中的数量</param>
    /// <param name="price">订单中的价格</param>
    public LineItemInfo(int id, string name, int line, int qty, decimal price)
    {
        this.id = id;
        this.productName = name;
        this.line = line;
        this.price = price;
        this.quantity = qty;
    }

    // 公共属性
    public int ItemId
    {
        get { return id; }
        set { id = value; }
    }
    public string Name
    {
        get { return productName; }
        set { productName = value; }
    }
    public int Line
    {
        get { return line; }
        set { line = value; }
    }
    public int Quantity
    {
        get { return quantity; }
        set { quantity = value; }
    }
    public decimal Price
    {
        get { return price; }
        set { price = value; }
    }
    public decimal Subtotal
    {
        get { return price * quantity; }
    }
}
