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

public partial class controls_EmployeeManage : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //判断页面是否通过验证
        if (Page.IsValid)
        {
            //初始化一个员工实体，并赋值
            EmployeeEntity el = new EmployeeEntity();
            el.Name=txtname.Text;
            el.Phone = txtphone.Text;
            el.Sex = ddlsex.SelectedValue;
            el.Mail = txtmail.Text;
            el.Depart = ddldepart.SelectedValue;
            el.Note = txtnode.Text;
            el.Birthday = Calendar1.SelectedDate;
            //调用实体添加方法
            EmployeeDA da = new EmployeeDA();
            bool result = da.InsertEmployee(el);
            //如果添加成功，提示信息并重新绑定数据
            if (result)
            {
                Label1.Text = "添加成功";
                GridView1.DataBind();
            }
        }
    }
}
