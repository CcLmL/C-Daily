using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// CommonClass 的摘要说明
/// </summary>
public class CommonClass
{
	public CommonClass()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 说明：MessageBox用来在客户端弹出对话框，关闭对话框返回指定页。
    /// 参数：TxtMessage 对话框中显示的内容。
    /// Url 对话框关闭后，跳转的页
    /// </summary>
    public string MessageBox(string TxtMessage,string Url)
    {
        string str;
        str = "<script language=javascript>alert('" + TxtMessage + "');location='" + Url + "';</script>";
        return str;
    }
    /// <summary>
    /// 说明：MessageBox用来在客户端弹出对话框。
    /// 参数：TxtMessage 对话框中显示的内容。
    /// </summary>
    public string MessageBox(string TxtMessage)
    {
        string str;
        str = "<script language=javascript>alert('" + TxtMessage + "')</script>";
        return str;
    }
    /// <summary>
    /// 说明：MessageBoxPag用来在客户端弹出对话框，关闭对话框返回原页。
    /// 参数：TxtMessage 对话框中显示的内容。
    /// </summary>
    public string MessageBoxPage(string TxtMessage)
    {
        string str;
        str = "<script language=javascript>alert('" + TxtMessage + "');location='javascript:history.go(-1)';</script>";
        return str;
    }
    /// <summary>
    /// 实现随机验证码
    /// </summary>
    /// <param name="n">显示验证码的个数</param>
    /// <returns>返回生成的随机数</returns>
    public string RandomNum(int n) //
    {
        //定义一个包括数字、大写英文字母和小写英文字母的字符串
        string strchar = "0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z";
        //将strchar字符串转化为数组
        //String.Split 方法返回包含此实例中的子字符串（由指定Char数组的元素分隔）的 String 数组。
        string[] VcArray = strchar.Split(',');
        string VNum = "";
        //记录上次随机数值，尽量避免产生几个一样的随机数           
        int temp = -1;                       
        //采用一个简单的算法以保证生成随机数的不同
        Random rand = new Random();
        for (int i = 1; i < n + 1; i++)
        {
            if (temp != -1)
            {
                //unchecked 关键字用于取消整型算术运算和转换的溢出检查。
                //DateTime.Ticks 属性获取表示此实例的日期和时间的刻度数。
                rand = new Random(i * temp * unchecked((int)DateTime.Now.Ticks));
            }
            //Random.Next 方法返回一个小于所指定最大值的非负随机数。
            int t = rand.Next(61);
            if (temp != -1 && temp == t)
            { 
                return RandomNum(n);
            }
            temp = t;
            VNum += VcArray[t];
        }
        return VNum;//返回生成的随机数
    }
    /// <summary>
    /// 用来截取小数点后nleng位
    /// </summary>
    /// <param name="sString">sString原字符串。</param>
    /// <param name="nLeng">nLeng长度。</param>
    /// <returns>处理后的字符串。</returns>
    public string VarStr(string sString, int nLeng)
    {
        int index = sString.IndexOf(".");
        if (index == -1 || index + nLeng >= sString.Length)
            return sString;
        else
            return sString.Substring(0, (index + nLeng + 1));
    }
  

}
