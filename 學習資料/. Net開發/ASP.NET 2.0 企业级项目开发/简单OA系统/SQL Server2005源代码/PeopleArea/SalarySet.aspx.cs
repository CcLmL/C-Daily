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

public partial class PeopleArea_SalarySet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //初始化工资类
            Salary mysa = new Salary();
            //调用获取公式的方法
            txtset.Text = mysa.GetFormula();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //向公式中添加项目
        txtset.Text = txtset.Text + "[" + ListBox1.SelectedValue + "]";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //向公式中添加计算表达式
        txtset.Text = txtset.Text + ListBox2.SelectedValue;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        //保存公式的设置
        //初始化一个工资类
        Salary mysalary = new Salary();
        //调用保存公式的方法
        bool result=mysalary.SetSalary(txtset.Text);
        //返回信息
        if (result)
            Response.Write("<script language='javascript'>alert('公式设置成功')</script>");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        //清空设置
        txtset.Text = "";
    }
}
