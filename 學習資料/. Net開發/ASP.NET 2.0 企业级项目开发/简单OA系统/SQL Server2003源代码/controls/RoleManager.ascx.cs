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

public partial class controls_RoleManager : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //必须是页面第一次加载时才进行设置
        if (!Page.IsPostBack)
        {
            //临时代码，设置默认View。
            //MultiView1.ActiveViewIndex = 2;
            //先屏蔽正确代码
            MultiView1.ActiveViewIndex = int.Parse(Request.QueryString["activeindex"].ToString());

            //角色的设置
            //获取所有角色信息
            string[] myroles = Roles.GetAllRoles();
            //将角色信息添加到下拉框
            ddlrole.DataSource = myroles;
            //绑定数据内容
            ddlrole.DataBind();

            //用户角色的设置
            //绑定角色下拉框和列表框
            ddlrole1.DataSource = myroles;
            ddlrole1.DataBind();
            ListBox1.DataSource = myroles;
            ListBox1.DataBind();


        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //创建角色，调用方法，方法不返回任何内容
        Roles.CreateRole(txtrolename.Text);
        //重新绑定数据
        ReDataBind();

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //删除角色，调用方法，返回是否成功
        bool result;
        result=Roles.DeleteRole(ddlrole.SelectedValue);
        //如果删除成功，重新绑定数据
        if (result)
            ReDataBind();
    }
    //添加或删除角色后，为ddlrole重新绑定数据源
    private void ReDataBind()
    {
        ddlrole.DataSource = Roles.GetAllRoles();
        ddlrole.DataBind();
    }
    protected void CreateUserWizard1_ContinueButtonClick(object sender, EventArgs e)
    {
        //更新内容
        GridView1.DataBind();
        //返回创建用户界面
        CreateUserWizard1.ActiveStepIndex = 0;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        //赋予用户角色
        //首先判断用户是否已经具备此角色
        if (Roles.IsUserInRole(txtusername.Text, ddlrole1.SelectedValue))
        {
            Response.Write("<script lanuage=javascript>alert('对不起，用户已经具备此角色')</script>");
        }
        else 
        {
            //添加用户到角色中
            Roles.AddUserToRole(txtusername.Text, ddlrole1.SelectedValue);
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        //移除角色中的用户
        //首先判断用户是否在此角色中
        if (!Roles.IsUserInRole(txtusername.Text, ddlrole1.SelectedValue))
            Response.Write("<script lanuage=javascript> alert('对不起，用户并不具备此角色')</script>");
        else
            //移除角色中的用户
            Roles.RemoveUserFromRole(txtusername.Text, ddlrole1.SelectedValue);
    }
    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //当选择角色名称的时候，通过方法获取角色中所有用户
        ListBox2.DataSource = Roles.GetUsersInRole(ListBox1.SelectedItem.Value);
        ListBox2.DataBind();
    }
}
