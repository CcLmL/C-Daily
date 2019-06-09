using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// 购物篮中数据操作实体类
/// </summary>
[Serializable]
public class CartItemInfo
{
    // 内部变量
    private int quantity = 1;
    private int itemId;
    private string name;
    private decimal price;
    private int supplierId;
    private int productId;

    /// <summary>
    /// 默认构造函数
    /// </summary>
    public CartItemInfo() { }

    /// <summary>
    /// 带参数的构造函数
    /// </summary>
    /// <param name="itemId">商品的详细资料ID</param></param>
    /// <param name="name">商品名称</param>
    /// <param name="qty">商品数量</param>
    /// <param name="price">商品价格</param>
    /// <param name="categoryId">商品的目录ID</param>
    /// <param name="productId">商品基本资料ID</param>
    public CartItemInfo(int itemId, string name, int qty, decimal price, int suppId, int productId)
    {
        this.itemId = itemId;
        this.name = name;
        this.quantity = qty;
        this.price = price;
        this.supplierId = suppId;
        this.productId = productId;
    }

    // 公共属性
    public int Quantity
    {
        get { return quantity; }
        set { quantity = value; }
    }
    public decimal Subtotal
    {
        get { return (decimal)(this.quantity * this.price); }
    }
    public int ItemId
    {
        get { return itemId; }
        set { itemId = value; }
    }
    public string Name
    {
        get { return name; }
        set { name = value; }
    }
    public decimal Price
    {
        get { return price; }
        set { price = value; }
    }
    public int SupplierId
    {
        get { return supplierId;}
        set { supplierId = value; }
    }
    public int ProductId
    {
        get { return productId;}
        set { productId = value; }
    }
}