using System;

/// <summary>
/// 工厂类，处理姓名
/// </summary>
public class NameFactory
{
	public NameFactory()
	{
	}
    public static MyName GetName(string strtext)
    {
        //判断是否包含“，”
        if (strtext.IndexOf(",") > 0)
        { 
            return new LastFirst(strtext);
        }
        else
        {
            return new FirstFirst(strtext);
        }
    }
}
