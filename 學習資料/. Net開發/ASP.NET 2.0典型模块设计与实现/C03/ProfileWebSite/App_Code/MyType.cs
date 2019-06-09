using System;

/// <summary>
/// MyType 的摘要说明
/// </summary>
public class MyType
{
    //自定义内部变量
    private string bankName;
    private string bankPassword;
    private int bankMoney;
	public MyType()
	{
	}
    //设置公共属性
    //个人银行的名称
    public string BankName
    {
        set { bankName = value; }
        get { return bankName; }
    }
    //个人银行的密码
    public string BankPassword
    {
        set { bankPassword = value; }
        get { return bankPassword; }
    }
    //个人银行的存款额
    public int BankMoney
    {
        set { bankMoney = value; }
        get { return bankMoney; }
    }
}
