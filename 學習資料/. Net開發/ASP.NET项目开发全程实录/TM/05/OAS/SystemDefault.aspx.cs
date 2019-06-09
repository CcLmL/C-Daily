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

public partial class _Default : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null)
        {
            Response.Write(bc.MessageBox("请登录后再进入系统！"));
            Response.Redirect("Default.aspx");
            return;
        }
        lblUser.Text = "在线职员：" + Session["loginName"].ToString();
        //为管理员和普通职员分配权限
        DataSet dsPower = bc.GetDataSet("select * from tb_sysUser where userName='" + Session["loginName"].ToString() + "'", "tb_sysUser");
        if (dsPower.Tables[0].Rows.Count > 0)
        {
            if (Convert.ToBoolean(dsPower.Tables[0].Rows[0]["system"]))
            {
                TreeView1.Visible = true;
                TreeView2.Visible = false;
            }
            else
            {
                TreeView1.Visible = false;
                TreeView2.Visible = true;
            }
        }
        else
        {
            Response.Redirect("/default.aspx");
        }

    }
    protected void imgBtnLogonOut_Click(object sender, ImageClickEventArgs e)
    {
        bc.ExecSQL("update tb_sysUser set sign=0 where userName='" + Session["loginName"].ToString() + "'");
        Session["loginName"] = null;
        Response.Redirect("Default.aspx");
    }
}
