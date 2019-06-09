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

public partial class PersonalArea_CanlendarSet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化一个日程操作类
        CalendarSet mycalendar = new CalendarSet();
        //获取当前登录的用户名
        string employeename=HttpContext.Current.User.Identity.Name;
        //调用操作类的方法添加日程
        mycalendar.SaveCalendar(employeename, txttitle.Text, txtcontent.Text, Calendar1.SelectedDate);
        Response.Write("<script language=javascript>alert('日程安排成功')</script>");
    }
}
