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

public partial class Manager_TitleManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        //添加主题功能
        if (Page.IsValid)
        {
            //初始化主题操作类
            TitleControl title = new TitleControl();
            try
            {
                //调用主题操作类的添加方法
                title.AddTitle(TextBox1.Text);
                Label1.Text = "添加成功！";
                //重新绑定数据
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //初始化主题操作类
        TitleControl setTitle = new TitleControl();
        //调用设置当前主题的方法
        setTitle.SetCurrentTitle(int.Parse(DropDownList1.SelectedValue));
        //重新绑定数据
        GridView1.DataBind();
        Label2.Text = "设置成功！";

    }
}
