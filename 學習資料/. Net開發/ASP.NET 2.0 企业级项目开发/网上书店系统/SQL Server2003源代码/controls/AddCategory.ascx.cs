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

public partial class controls_AddCategory : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化目录实体并赋值
        CategoryInfo cate = new CategoryInfo();
        cate.Description = txtdescription.Text;
        cate.Name = txtname.Text;
        //初始化目录操作类
        Category mycr = new Category();
        //调用添加目录的方法
        mycr.AddCategory(cate);
        Label1.Text = "目录" + txtname.Text + "添加成功.";
    }
}
