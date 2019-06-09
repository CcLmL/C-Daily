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
using System.Drawing;

public partial class controls_Bargain : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化客户服务类
        UserService service = new UserService();
        //调用存档方法
       bool result= service.InsertBargain(txtusername.Text,txtname.Text,txtnote.Text,Calendar1.SelectedDate,Calendar2.SelectedDate);
       if (result)
       {
           Label1.Text = "合同存档成功";
           GridView1.DataBind();
       }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //首先设置一个日期坐标，因为是提前一个月提醒,所以日期中月份加1
        DateTime enddate=DateTime.Now.Date.AddMonths(1);
        string end=enddate.ToShortDateString();
        //判断日期是否小于日期坐标,使用两个字符型比较
        if ( end.CompareTo(e.Row.Cells[3].Text)>0)
            //如果是，设置此行的样式，红色提示
            e.Row.BackColor = Color.Red;
    }
}
