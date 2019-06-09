using System;
using System.Data;

/// <summary>
/// 目录的实体类
/// </summary>
[Serializable]
public class CategoryInfo
{
    // 内部变量
    private int id;
    private string name;
    private string description;

    /// <summary>
    /// 默认构造函数
    /// </summary>
    public CategoryInfo() { }

    /// <summary>
    /// 带参数的构造函数
    /// </summary>
    /// <param name="id">目录Id</param>
    /// <param name="name">目录名称</param>
    /// <param name="description">目录的描述</param>
    public CategoryInfo(int id, string name, string description)
    {
        this.id = id;
        this.name = name;
        this.description = description;
    }

    // 实体的公共属性
    //Id
    public int Id
    {
        get { return id; }
        set { id = value; }
    }
    //名称
    public string Name
    {
        get { return name; }
        set { name = value; }
    }
    //描述
    public string Description
    {
        get { return description; }
        set { description = value; }
    }
}
