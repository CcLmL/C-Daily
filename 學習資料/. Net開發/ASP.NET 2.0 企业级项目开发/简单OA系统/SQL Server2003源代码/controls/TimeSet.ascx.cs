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

public partial class controls_TimeSet : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //初次显示页面时，要先查看是否设置了工作时间
        //如果已设置，则两个文本框分别显示其值
        if (!Page.IsPostBack)
        {
            TimeSet myset=new TimeSet();
            //如果为空，则表示是第一次设置时间
            TextBox1.Text = myset.GetOnDutyTime();
            TextBox2.Text = myset.GetOffDutyTime();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化时间设置类
        TimeSet mytime = new TimeSet();
        //使用时间设置类的方法设置时间
        bool result=mytime.SetTime(TextBox1.Text, TextBox2.Text);
        //判断执行是否成功
        if (result)
            Response.Write("<script language=javascript>alert('时间设置成功')</script>");
    }
}
