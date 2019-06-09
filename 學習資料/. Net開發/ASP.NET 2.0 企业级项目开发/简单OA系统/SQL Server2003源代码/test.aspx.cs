using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if(HttpContext.Current.User.IsInRole("管理员"))
        //{
        //    lblWelcome.Text="您是系统的管理员，欢迎！";
        //}
        //else
        //{
        //    lblWelcome.Text="尊敬的客户，欢迎光临";
        //}
        //string city = "北京";
        //Response.Write(city);
        //byte[] citys = null;
        //citys = System.Text.Encoding.UTF8.GetBytes(city);
        //Response.Write(citys);
        //Response.Write("上海");
        string heart = "这是一个美丽的城市，是沿海最繁华的城市，位于china。";
        string heart1 = "这是一个美丽的城市，是沿海最发达的城市。";

        ////比较两个字符串是否相等
        ////返回数值，0表示相等
        //int equal = String.Compare(heart, heart1);
        ////获取"城市"在字符串中的索引
        //int index_city = heart.IndexOf("城市");
        ////复制字符串
        //string newstr = String.Copy(heart);
        ////替换字符串中的"城市"为"小镇"
        //string strcity = heart.Replace("城市", "小镇");
        ////将字符串中字母的小写替换成大写
        //string newheart = heart.ToUpper();

    }
}
