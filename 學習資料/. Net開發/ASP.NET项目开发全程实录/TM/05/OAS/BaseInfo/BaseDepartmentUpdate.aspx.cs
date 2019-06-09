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

public partial class BaseInfo_BaseDepartmentUpdate : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null)
        {
            Response.Write("<script>this.parent.location.href='../Default.aspx'</script>");
            return;
        }
        if (!IsPostBack)
        {
            DataSet ds = bc.GetDataSet("select * from tb_department where ID='" + Request.QueryString["id"].ToString() + "'", "tb_department");
            txtName.Text = ds.Tables[0].Rows[0][1].ToString();
            txtContent.Text = ds.Tables[0].Rows[0][2].ToString();
        }

    }

    protected void imgBtnSave_Click(object sender, ImageClickEventArgs e)
    {
        Boolean bl = bc.ExecSQL("update tb_department set Name='" + txtName.Text + "',memo='" + txtContent.Text + "' where ID='" + Request.QueryString["id"] + "'");
        if (bl)
        {
            Response.Write(bc.MessageBox("部门基本信息修改成功!"));
            Response.Write("<script language='javascript'>this.parent.MainFrame.location.href='BaseDepartmentManager.aspx'</script>");
        }
        else
        {
            Response.Write(bc.MessageBox("部门基本信息修改失败!"));
        } 
    }
    protected void imgBtnReturn_Click(object sender, ImageClickEventArgs e)
    {
        Response.Write("<script language='javascript'>this.parent.MainFrame.location.href='BaseDepartmentManager.aspx'</script>");
    }
}
