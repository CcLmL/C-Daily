using System;
/// <summary>
/// 图书的详细信息
/// </summary>
[Serializable]
public class ItemInfo
{

    // 内部变量
    private int id;
    private string name;
    private int quantity;
    private decimal price;
    private string productName;
    private string image;
    private int supplierId;
    private int productId;

    public ItemInfo() { }
    /// <summary>
    /// 带参数的构造函数
    /// </summary>
    /// <param name="id">产品详细信息ID</param>
    /// <param name="name">书名</param>
    /// <param name="quantity">库存量</param>
    /// <param name="price">价格</param>
    /// <param name="image">封面地址</param>
    /// <param name="categoryId">目录ID</param>
    /// <param name="productId">图书Id</param>
    public ItemInfo(int id, string name, int quantity, decimal price, string image, int supplierId, int productId)
    {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
        this.supplierId = supplierId;
        this.productId = productId;
    }

    //公共属性
    public int  Id
    {
        get { return id; }
        set { id = value; }
    }
    public string Name
    {
        get { return name; }
        set { name = value; }
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
    public string Image
    {
        get { return image; }
        set { image = value; }
    }
    public int  SupplierId
    {
        get { return supplierId; }
        set { supplierId = value; }
    }
    public int ProductId
    {
        get { return productId; }
        set { productId = value; }
    }
}
