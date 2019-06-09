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

public partial class Manager_ItemManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化项目操作类
        ItemControl myitem = new ItemControl();
        //调用操作类中的添加项目的方法
        myitem.AddItem(TextBox1.Text, int.Parse(DropDownList1.SelectedValue));
        //重新绑定数据源
        GridView1.DataBind();
    }
}
