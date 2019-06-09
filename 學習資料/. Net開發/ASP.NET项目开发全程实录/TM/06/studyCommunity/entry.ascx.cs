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
using System.Collections;
using System.Security.Cryptography;

public partial class entry : System.Web.UI.UserControl
{
    dataOperate mydo = new dataOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.Image1.ImageUrl = "ValidateCode.aspx";
        }
    }
    //单击登陆先判断验证码正确后判断用户名和密码；


    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        this.Image1.ImageUrl = "ValidateCode.aspx";
    }
   
    protected void imgbtnLanding_Click(object sender, ImageClickEventArgs e)
    {
        string name = txtName.Text;
        string pass = Operate.Encrypting(txtPass.Text);
        string yzm = txtYzm.Text;
        if (Session["CheckCode"].ToString().Equals(yzm))
        {
            try
            {
                string sql = "select count(*) from tb_login where Name='" + name + "' and Pass ='" + pass + "'";
                int i = mydo.isData(sql);
                if (i > 0)
                {
                    sql = "select * from tb_login where Name='" + name + "'";
                    OleDbDataReader odr = mydo.row(sql);
                    odr.Read();

                    if (odr["lock"].ToString() == "0")
                    {

                        Session["UserName"] = name;
                        Response.Redirect("index.aspx");
                    }
                    else
                    {
                        Page.RegisterStartupScript("false", "<script>alert('此用户已被锁定！')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('密码或用户名错误！')</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
            }

        }
        else
        {
            Page.RegisterStartupScript("false", "<script>alert('验证码错误！')</script>");
        }
    }
}
