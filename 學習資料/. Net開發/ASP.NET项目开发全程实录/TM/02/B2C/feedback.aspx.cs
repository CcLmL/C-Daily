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

public partial class feedback : System.Web.UI.Page
{
    CommonClass ccObj = new CommonClass();
    DBClass dbObj = new DBClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserName"] == null)
            {
                Response.Write("<script>alert('对不起！您不是会员，请先注册！');location='Default.aspx'</script>");
                Response.End();

            }  
        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            string strSql = "INSERT INTO tb_LeaveWord(Uid,Subject,Content,DateTime,IP)";
            strSql += " VALUES('" + Session["UserName"].ToString() + "','" + this.txtTitle.Text + "'";
            strSql += ",'" + this.FreeTextBox1.Text + "','" + DateTime.Now + "'";
            strSql += ",'" + Request.UserHostAddress + "')";
            dbObj.ExecNonQuery(dbObj.GetCommandStr(strSql));
            Response.Write(ccObj.MessageBox("添加成功!", "Default.aspx")); 
        }
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.txtTitle.Text = "";
        this.FreeTextBox1.Text = "";
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}
