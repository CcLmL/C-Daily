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

public partial class PeopleArea_Check : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化考核操作类
        Check mycheck = new Check();
        //调用登记方法
        mycheck.SaveCheck(txtname.Text,txtdata.Text,Calendar1.SelectedDate);
        //提示信息
        Response.Write("<script language='javascript'>alert('登记成功')</script>");
    }
}
