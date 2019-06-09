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

public partial class ServiceManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化一个操作类
        ServiceOperation myservice = new ServiceOperation();
        //调用类中的添加方法
        bool result= myservice.InsertService(TextBox1.Text);

        //提示完成信息
        if (result)
        {
            Literal1.Text = "操作成功";
            //更新列表
            ListBox1.DataBind();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //初始化一个操作类
        ServiceOperation myservice = new ServiceOperation();
        //调用类中的添加方法
        bool result = myservice.DeleteService(ListBox1.SelectedValue);

        //提示完成信息
        if (result)
        {
            Literal1.Text = "操作成功";
            //更新列表
            ListBox1.DataBind();
        }
    }
}
