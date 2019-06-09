using System;

/// <summary>
/// 按反顺序输入名字组合
/// </summary>
public class LastFirst:MyName
{
	public LastFirst(string strname)
	{
        int ispace = strname.Trim().IndexOf(",");
        if (ispace > 0)
        {
            //从,开始，调转名字的顺序
            lname = strname.Substring(0, ispace).Trim();
            fname = strname.Substring(ispace + 1).Trim();
        }
        else
        {
            //否则当成一个名字处理
            lname = strname;
            fname = "";
        }
	}
}
