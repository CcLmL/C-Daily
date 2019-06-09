using System;

/// <summary>
/// 帐户地址实体类信息
/// </summary>
[Serializable]
public class AddressInfo
{

    // 内部变量
    private string userName;
    private string address;
    private string code;
    private string country;
    private string phone;
    private string email;

    /// <summary>
    /// 默认的构造函数
    /// </summary>
    public AddressInfo() { }

    /// <summary>
    /// 带参数的构造函数
    /// </summary>
    /// <param name="userName">用户名</param>
    /// <param name="address">用户地址</param>
    /// <param name="code">邮编</param>
    /// <param name="country">国家</param>
    /// <param name="phone">电话</param>
    /// <param name="email">Email</param>
    public AddressInfo(string userName,  string address, string code, string country, string phone, string email)
    {
        this.userName = userName;
        this.address = address;
        this.code = code;
        this.country = country;
        this.phone = phone;
        this.email = email;
    }

    // 公共属性
    public string UserName
    {
        get { return userName; }
        set { userName = value; }
    }
    public string Address
    {
        get { return address; }
        set { address = value; }
    }
    public string ZipCode
    {
        get { return code; }
        set { code = value; }
    }
    public string Country
    {
        get { return country; }
        set { country = value; }
    }
    public string Phone
    {
        get { return phone; }
        set { phone = value; }
    }
    public string Email
    {
        get { return email; }
        set { email = value; }
    }
}
