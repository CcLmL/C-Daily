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

public partial class addUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string userName = txtUserName.Text;
        string pass = txtPass.Text;
        string sql = "insert into tb_user values('" + userName + "','" + pass + "')";
        if (dataOperate.execSQL(sql))
        {
            RegisterStartupScript("", "<script>alert('添加成功！');window.opener.location.href=window.opener.location='userManage.aspx';window.close();</script>");
        }
        else
        {
            RegisterStartupScript("", "<script>alert('设置失败！')</script>");
        }
        
    }
}
