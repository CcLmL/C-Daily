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

public partial class ItemManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化投票项目操作类
        ItemOperation io = new ItemOperation();
        //调用操作类中的添加方法
        io.AddVote(TextBox1.Text);
        //重新绑定下拉列表中的投票项目
        DropDownList1.DataBind();
        Label1.Text = "项目添加成功";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //初始化投票项目操作类
        ItemOperation io = new ItemOperation();
        //调用操作类中的删除方法
        io.DelVote(int.Parse(DropDownList1.SelectedValue));
        //重新绑定下拉列表中的投票项目
        DropDownList1.DataBind();
        Label1.Text = "项目删除功能";
    }
}
