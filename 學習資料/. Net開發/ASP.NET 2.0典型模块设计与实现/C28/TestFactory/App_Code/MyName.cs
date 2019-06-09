using System;

/// <summary>
/// 处理数据的类
/// </summary>
public class MyName
{
    //定义变量
    protected string fname;
    protected string lname;

	public MyName()
	{	}
    /// <summary>
    /// 获取第一个名字
    /// </summary>
    /// <returns>返回名字</returns>
    public string GetFname()
    {
        return fname;
    }
    /// <summary>
    /// 获取第二个名字
    /// </summary>
    /// <returns>返回名字</returns>
    public string GetLname()
    {
        return lname;
    }
}
