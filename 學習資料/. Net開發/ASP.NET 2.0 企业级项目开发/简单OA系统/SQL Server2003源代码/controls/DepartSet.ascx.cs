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

public partial class controls_DepartSet : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化管理设置类
        ManagerSet myset = new ManagerSet();
        //调用添加部门的方法
        bool result=myset.InsertDepart(txtdepart.Text);
        if (result)
            Response.Write("<script language=javascript>alert('部门添加成功.')</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //初始化管理设置类
        ManagerSet myset = new ManagerSet();
        //调用删除部门的方法
        bool result=myset.DelDepart(DepartList1.SelectValue);
        if (result)
            Response.Write("<script language=javascript>alert('部门删除成功.')</script>");
    }
}
