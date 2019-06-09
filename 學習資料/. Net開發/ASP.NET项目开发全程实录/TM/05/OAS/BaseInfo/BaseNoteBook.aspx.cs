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

public partial class BaseInfo_BaseNoteBook : System.Web.UI.Page
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
            GridView1.DataSource = bc.GetDataSet("select * from tb_note where notePerson ='" + Session["loginName"].ToString() + "'order by noteTime desc", "tb_note");
            GridView1.DataKeyNames = new String[] { "ID" };
            GridView1.DataBind();
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        bool bl = bc.ExecSQL("delete from tb_note where ID='" + this.GridView1.DataKeys[e.RowIndex].Value.ToString() + "'");
        GridView1.DataSource = bc.GetDataSet("select * from tb_note where notePerson ='" + Session["loginName"].ToString() + "'order by noteTime desc", "tb_note");
        GridView1.DataBind();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[3].Text = Convert.ToDateTime(e.Row.Cells[2].Text).ToShortDateString();
        }
    }
    protected void imgBtnSave_Click(object sender, ImageClickEventArgs e)
    {
        if (bc.ExecSQL("INSERT INTO tb_note (title, content, noteTime, notePerson)VALUES('" + txtTitle.Text + "','" + txtContent.Text + "','" + DateTime.Today + "','" + Session["loginName"].ToString() + "')"))
        {
            Response.Write(bc.MessageBox("数据提交成功！"));
            GridView1.DataSource = bc.GetDataSet("select * from tb_note where notePerson ='" + Session["loginName"].ToString() + "'order by noteTime desc", "tb_note");
            GridView1.DataKeyNames = new String[] { "ID" };
            GridView1.DataBind();
        }
        else
        {
            Response.Write(bc.MessageBox("数据提交失败！"));
        }
    }
}
