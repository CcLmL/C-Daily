using System;

/// <summary>
/// 顺序显示名字
/// </summary>
public class FirstFirst:MyName
{
	public FirstFirst(string strname)
	{
        //判断有没有空格
        int ispace = strname.Trim().IndexOf(" ");
        if (ispace > 0)
        {
            //从空格开始，取前面的为第一个名字，后面的为第二个名字
            fname = strname.Substring(0, ispace).Trim();
            lname = strname.Substring(ispace + 1).Trim();
        }
        else 
        {
            //否则当成一个名字处理
            fname = strname;
            lname = ""            ;
        }
	}
}
