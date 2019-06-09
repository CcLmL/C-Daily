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

public partial class Category_DelCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化目录操作类
        Category cat = new Category();
        //调用删除方法
        bool result=cat.DelCategory(int.Parse(DropDownList1.SelectedValue));
        if (result)
            Label1.Text = "删除目录成功";
        else
            Label1.Text = "抱歉，目录中可能存在文件";
    }
}
