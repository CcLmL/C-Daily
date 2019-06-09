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
using System.Data.SqlClient;

public partial class LoadingControl : System.Web.UI.UserControl
{
    CommonClass ccObj = new CommonClass();
    UserClass ucObj = new UserClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        { 
            this.labValid.Text = ccObj.RandomNum(4);//产生随机验证码
            if (Session["UserID"] != null)
            {
                //判断用户是否登录
                this.tabLoad.Visible = true;  //显示显示用户欢迎面板
                this.tabLoading.Visible =false ; //隐藏用户登录面板
            }        
        }
    }
   
    protected void lnkbtnOut_Click(object sender, EventArgs e)
    {
        //清空Session对象
        Session["UserID"] = null;
        Session["UserName"] = null;
        this.tabLoad.Visible = false; //隐藏用户欢迎面板
        this.tabLoading.Visible = true; //显示显示用户登录面板
        Response.Write(ccObj.MessageBox("谢谢您的惠顾！","Default.aspx"));
    }
    protected void btnLoad_Click(object sender, ImageClickEventArgs e)
    {
        //清空Session对象
        Session["UserID"] = null;
        Session["Username"] = null;
        if (this.txtName.Text.Trim() == "" || this.txtPassword.Text.Trim() == "")
        {
            Response.Write(ccObj.MessageBoxPage("登录名和密码不能为空！"));
        }
        else
        {
            if (this.txtValid.Text.Trim() == this.labValid.Text.Trim())
            {
                //调用UserClass类的UserLogin方法判断用户是否为合法用户
                DataTable dsTable = ucObj.UserLogin(this.txtName.Text.Trim(), this.txtPassword.Text.Trim());
                if (dsTable!=null) //判断用户是否存在
                {
                    Session["UserID"] = Convert.ToInt32(dsTable.Rows[0][0].ToString()); //保存用户ID
                    Session["Username"] = dsTable.Rows[0][1].ToString(); //保存用户登录名
                    //Response.Redirect(Request.CurrentExecutionFilePath); //跳转到当前请求的虚拟路径
                    Response.Redirect("Default.aspx"); //跳转到当前请求的虚拟路径
                }
                else
                {
                    Response.Write(ccObj.MessageBoxPage("您的登录有误，请核对后再重新登录！"));
                }
            }
            else
            {
                Response.Write(ccObj.MessageBoxPage("请正确输入验证码！"));
            }
        }
    }
    protected void btnRegister_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
}
