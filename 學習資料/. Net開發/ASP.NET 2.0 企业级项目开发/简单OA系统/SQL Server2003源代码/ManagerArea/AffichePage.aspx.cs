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

public partial class ManagerArea_AffichePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化管理设置类
        ManagerSet myset = new ManagerSet();
        //执行发布公告的方法
        bool result = myset.InsertAffiche(TextBox1.Text);
        if (result)
            Response.Write("<script language=javascript>alert('发布完成.')</script>");
        //因为母版页面设置了公告区，所以必须将公告显示在母版页中。
        //母版页中滚动显示的内容来自DataList控件，所以先定义一个控件
        DataList mylist = new DataList();
        //设置控件的引用，来自母版页中ID为DataList1的控件
        mylist = (DataList)Master.FindControl("DataList1");
        //重新绑定数据
        mylist.DataBind();
    }
}
