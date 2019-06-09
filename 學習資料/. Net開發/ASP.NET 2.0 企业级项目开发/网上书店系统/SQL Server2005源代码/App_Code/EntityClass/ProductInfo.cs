using System;

/// <summary>
/// 图书的基本信息
/// </summary>
[Serializable]
public class ProductInfo
{
    // 内部变量
    private int id;
    private string name;
    private string description;
    private string image;
    private int categoryId;

    /// <summary>
    /// 默认构造函数
    /// </summary>
    public ProductInfo() { }

    /// <summary>
    /// 带参数的构造函数
    /// </summary>
    /// <param name="id">图书ID</param>
    /// <param name="name">书名</param>
    /// <param name="description">图书简介</param>
    /// <param name="image">封面地址</param>
    /// <param name="categoryId">所属目录ID</param>
    public ProductInfo(int id, string name, string description, string image, int  categoryId)
    {
        this.id = id;
        this.name = name;
        this.description = description;
        this.image = image;
        this.categoryId = categoryId;
    }

    // 公共属性
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
    public string Description
    {
        get { return description; }
        set { description = value; }
    }
    public string Image
    {
        get { return image; }
        set { image = value; }
    }

    public int  CategoryId
    {
        get { return categoryId; }
        set { categoryId = value; }
    }
}
