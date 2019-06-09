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

public partial class BaseInfo_BaseDepartmentAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null)
        {
            Response.Write("<script>this.parent.location.href='../Default.aspx'</script>");
        }
    }
    protected void imgBtnSave_Click(object sender, ImageClickEventArgs e)
    {
        BaseClass bc = new BaseClass();
        Boolean bl;
        bl = bc.ExecSQL("insert into tb_department values('" + txtName.Text + "','" + txtContent.Text + "')");
        if (bl)
        {
            Response.Write(bc.MessageBox("新建部门成功!"));
        }
        else
        {
            Response.Write(bc.MessageBox("新建部门失败!"));
        }
    }
    protected void imgBtnClear_Click(object sender, ImageClickEventArgs e)
    {
        txtName.Text = "";
        txtContent.Text = "";
    }
}
