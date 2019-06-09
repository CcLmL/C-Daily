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

public partial class BaseInfo_BaseEmployeeUpdate : System.Web.UI.Page
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
            //将部门名称绑定到下拉列表框中
            dlDepartment.DataSource = bc.GetDataSet("select * from tb_department", "tb_department");
            dlDepartment.DataBind();
            DataSet ds = bc.GetDataSet("select * from tb_employee where ID='" + Request.QueryString["id"].ToString() + "'", "tb_employee");
            txtName.Text = ds.Tables[0].Rows[0]["name"].ToString();
            dlSex.Text = ds.Tables[0].Rows[0]["sex"].ToString();
            txtBirthday.Text = ds.Tables[0].Rows[0]["birthday"].ToString();
            txtAddress.Text = ds.Tables[0].Rows[0]["address"].ToString();
            txtLearn.Text = ds.Tables[0].Rows[0]["learn"].ToString();
            txtPost.Text = ds.Tables[0].Rows[0]["post"].ToString();
            txtTel.Text = ds.Tables[0].Rows[0]["tel"].ToString();
            txtEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
            dlDepartment.Text = ds.Tables[0].Rows[0]["dept"].ToString();
            dlJob.Text = ds.Tables[0].Rows[0]["job"].ToString();
            dlState.Text = ds.Tables[0].Rows[0]["state"].ToString();
        }

    }
    protected void imgBtnSave_Click(object sender, ImageClickEventArgs e)
    {
        Boolean bl = bc.ExecSQL("update tb_employee set name='" + txtName.Text + "',sex='" + dlSex.Text + "',birthday='" + txtBirthday.Text + "',learn='" + txtLearn.Text + "',post='" + txtPost.Text + "',dept='" + dlDepartment.Text + "',job='" + dlJob.Text + "',tel='" + txtTel.Text + "',address='" + txtAddress.Text + "',email='" + txtEmail.Text + "',state='" + dlState.Text + "' where ID='" + Request.QueryString["id"].ToString() + "'");
        if (bl)
        {
            Response.Write(bc.MessageBox("员工基本信息修改成功!"));
            Response.Write("<script language='javascript'>this.parent.MainFrame.location.href='BaseEmployeeManager.aspx'</script>");
        }
        else
        {
            Response.Write(bc.MessageBox("员工基本信息修改失败!"));
        }
    }
    protected void imgBtnReturn_Click(object sender, ImageClickEventArgs e)
    {
        Response.Write("<script language='javascript'>this.parent.MainFrame.location.href='BaseEmployeeManager.aspx'</script>");
    }
}
