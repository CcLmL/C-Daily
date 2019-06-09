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

public partial class BackGround_LeaguerInfoDelete : System.Web.UI.Page
{
    Operation operation = new Operation();
    static string infoType = "";　　　　　 //供求信息类型
    static int CheckType = -1;　　　　　　 //3种类别：全部显示(-1代表全部显示)，显示过期信息（0），显示未过期信息(1)

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            this.GridViewBind();
    }
    private void GridViewBind()
    {
        GridView1.DataSource = operation.SelectLeaguerInfo();
        GridView1.DataKeyNames = new string[] {"id" };
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        //按过期类型绑定数据（３种类别：全部显示(-1)，显示过期(0)，显示未过期(1)）
        switch (CheckType)
        {
            case -1:
                GridViewBind();
                break;
            case 0:
                GridView1.DataSource = operation.SelectLeaguerInfo(false);
                GridView1.DataBind();
                break;
            case 1:
                GridView1.DataSource = operation.SelectLeaguerInfo(true);
                GridView1.DataBind();
                break;
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //高亮显示指定行
            e.Row.Attributes.Add("onMouseOver", "Color=this.style.backgroundColor;this.style.backgroundColor='#FFF000'");
            e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor=Color;");
            //进行时间格式化
            e.Row.Cells[5].Text = Convert.ToDateTime(e.Row.Cells[5].Text).ToShortDateString();
            //删除指定行数据时，弹出询问对话框
            ((LinkButton)(e.Row.Cells[8].Controls[0])).Attributes.Add("onclick", "return confirm('是否删除当前行数据！')");
            //多余字　使用...显示
            e.Row.Cells[1].Text = StringFormat.Out(e.Row.Cells[2].Text, 7);
            e.Row.Cells[2].Text = StringFormat.Out(e.Row.Cells[2].Text, 16);
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        operation.DeleteLeaguerInfo(GridView1.DataKeys[e.RowIndex].Value.ToString());
        this.GridViewBind();
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        string id = GridView1.DataKeys[e.NewSelectedIndex].Value.ToString();
        infoType = GridView1.DataKeys[e.NewSelectedIndex][0].ToString();
        Response.Write("<script> window.open('DetailLeaguerInfo.aspx?id=" + id + "','','scrollbars') </script>");
        Response.Write("<script>history.go(-1)</script>");
    }
    protected void rdoBtnAll_CheckedChanged(object sender, EventArgs e)
    {
        CheckType = -1;
        this.GridViewBind();
    }
    protected void rdoBtnTrue_CheckedChanged(object sender, EventArgs e)
    {
        CheckType = 1;
        GridView1.DataSource = operation.SelectLeaguerInfo(true);
        GridView1.DataBind();
    }
    protected void rdoBtnFalse_CheckedChanged(object sender, EventArgs e)
    {
        CheckType = 0;
        GridView1.DataSource = operation.SelectLeaguerInfo(false);
        GridView1.DataBind();
    }
}

