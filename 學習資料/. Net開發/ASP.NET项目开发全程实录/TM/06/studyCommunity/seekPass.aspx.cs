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

public partial class seekPass : System.Web.UI.Page
{
    dataOperate mydo = new dataOperate();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {        
        string userName = txtName.Text;
        string question = txtPassQuestion.Text;
        string solution = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassSolution.Text, "MD5");
        string sql = "select * from tb_login where Name='" + userName + "' and PassQuestion ='" + question + "' and PassSolution='" + solution + "'";
       
        try
        {

            OleDbDataReader sdr = mydo.row(sql);
            sdr.Read();
            txtPass.Text =Operate.Decrypting(sdr["Pass"].ToString());
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
        
    }
   
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string userName = txtName.Text.Trim();
        string sql = "select * from tb_login where Name='" + userName + "'";
       
        try
        {

            OleDbDataReader sdr = mydo.row(sql);
            sdr.Read();
            txtPassQuestion.Text = sdr["PassQuestion"].ToString();
            
        }
        catch (Exception ex)
        {
            Page.RegisterStartupScript("error", "<script>alert('用户名错误！')</script>");
        }
       
      
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
}
