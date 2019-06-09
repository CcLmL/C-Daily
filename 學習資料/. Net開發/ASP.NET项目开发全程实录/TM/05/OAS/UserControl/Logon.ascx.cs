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

public partial class UserControl_Logon : System.Web.UI.UserControl
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnCandel_Click(object sender, EventArgs e)
    {
        txtName.Text = "";
        txtPwd.Text = "";
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtPwd.Text == "" && txtName.Text == "")
        {
            Response.Write(bc.MessageBox("用户名称和密码不能为空!"));
            return;
        }
        if (rdoBtnAdmin.Checked)   //系统管理员登录
        {
            DataSet ds = bc.GetDataSet("select count(*) from tb_sysUser where userName='" + txtName.Text + "'and userPwd='" + txtPwd.Text + "'and system=1","tb_sysUser");
            if (ds.Tables[0].Rows.Count>0)
            {
                //登录成功后，设置登录时间和标识
                bc.ExecSQL("update tb_sysUser set logintime='" + DateTime.Now + "',sign=1 where userName='" + txtName.Text + "'");
                //存储登录用户名称
                Session["loginName"] = txtName.Text;
                //登录成功后，进入系统主页
                Response.Redirect("~/SystemDefault.aspx");
            }
            else
            {
                Response.Write(bc.MessageBox("用户名或密码错误!"));
            }
        }
        else　　//普通操作职员
        {
            DataSet ds = bc.GetDataSet("select count(*) from tb_sysUser where userName='" + txtName.Text + "'and userPwd='" + txtPwd.Text + "'and system=0", "tb_sysUser");
            if (ds.Tables[0].Rows.Count > 0)
            {
                //登录成功后，设置登录时间和标识
                bc.ExecSQL("update tb_sysUser set logintime='" + DateTime.Now + "',sign=1 where userName='" + txtName.Text + "'");
                Session["loginName"] = txtName.Text;
                Response.Redirect("~/SystemDefault.aspx");
            }
            else
            {
                Response.Write(bc.MessageBox("用户名或密码错误!"));
            }
        }
    }
}
