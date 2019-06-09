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
using System.Data.SqlClient;

public partial class newPass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)            　//判断管理员是否登录
        {
             txtUserName.Text = Session["userName"].ToString();
        }
        else
        {
            Response.Redirect("entry.aspx");            //返回到登录页面
        }     
       
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string sql="select * from tb_user where userName='"+Session["userName"].ToString()+"'";
        SqlDataReader sdr=dataOperate.getRow(sql);
        sdr.Read();
        if (txtOldPass.Text == sdr["userPwd"].ToString())
        {
            string upSql = "update tb_user set userPwd='" + txtNewPass.Text + "' where userName='"+Session["userName"].ToString()+"'";
            if (dataOperate.execSQL(upSql))
            {
                RegisterStartupScript("", "<script>alert('更新成功！')</script>");
            }
            else
                RegisterStartupScript("", "<script>alert('更新失败！')</script>");
        }
        else
            RegisterStartupScript("", "<script>alert('原始密码输入错误')</script>");
    }
}
