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
using System.Data.OleDb;
using System.Text;


public partial class login : System.Web.UI.Page
{
    dataOperate mydo = new dataOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    //查询用户名是否存在事件
    protected void Button3_Click(object sender, EventArgs e)
    {
       
    }
   

//自定义方法用来判断用户名是否存在
     public int isName()
        {
            int i;      
            string sql = "select count(*) from tb_login where Name='" + this.txtName.Text.Trim() + "'";
            return i = mydo.isData(sql);                  
        }
    
    //添加用户
  
   //自定义方法
    protected bool  add()
    {      
        string name = txtName.Text;
        string pass =Operate.Encrypting(txtPass.Text);      
        string sex;
        //获取性别
        if (RadioButtonMan.Checked)
        {
            sex = "男";
        }
        else
        {
            sex = "女";
        }
        string trueName = txtTrueName.Text;//获取真实姓名       
        string idCard = this.txtIDCard.Text;　　//获取电话
        string passQuestion = this.txtPassQuestion.Text;
        string passSolution = FormsAuthentication.HashPasswordForStoringInConfigFile(this.txtPassSolution.Text, "MD5");
        string email = txtEmail.Text;　　//获取电子邮件   
        string sql = "insert into tb_login(Name,Pass,ZName,Sex,Email,IDCard,PassQuestion,PassSolution) values('" + name + "','" + pass + "','" + trueName + "','" + sex + "','" + email + "','" + idCard + "','" + passQuestion + "','" + passSolution + "')";

        return mydo.adlData(sql);
          
    }


    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (isName() <= 0)
        {
            if (add())
            {
                Page.RegisterStartupScript("true", "<script>alert('成功！')</script>");
            }
            else
            {
                Page.RegisterStartupScript("false", "<script>alert('失败！')</script>");
            }
        }
        else
        {
            Page.RegisterStartupScript("false", "<script>alert('用户名已存在！')</script>");
        }
    }
    protected void btnisName_Click(object sender, EventArgs e)
    {
        if (txtName.Text.Trim() != "")
        {
            if (isName() > 0)
            {
                RegisterStartupScript("yes", "<script>alert('用户名已经存在！')</script>");
            }
            else
            {
                RegisterStartupScript("no", "<script>alert('可以注册')</script>");
            }
        }
        else
        {

            RegisterStartupScript("yes", "<script>alert('用户名不能为空！')</script>");
        }
    }
    protected void buttonCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
}
