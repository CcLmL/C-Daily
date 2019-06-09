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

public partial class BackGround_CheckInfo : System.Web.UI.Page
{
    Operation operation = new Operation(); //业务类对象
    static string infoType = "";　　　　　 //供求信息类型
    //DataSet dsCheckInfo = null;
    static int CheckType = -1;　　　　　　　//3种类别：全部显示(-1代表全部显示)，显示未审核（0），显示审核(1)

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            infoType = Request.QueryString["id"].ToString();
            GridViewBind(infoType);
        }
    }
    /// <summary>
    /// 绑定供求信息到GridViev控件
    /// </summary>
    /// <param name="type">供求信息类别</param>
    private void GridViewBind(string type)
    {
        GridView1.DataSource = operation.SelectInfo(type);
        GridView1.DataKeyNames=new string[] {"id"};
        GridView1.DataBind();
        //显示当前页数
        lblPageSum.Text = "当前页为　" + (GridView1.PageIndex + 1) + " / " + GridView1.PageCount + "　页";
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //高亮显示指定行
            e.Row.Attributes.Add("onMouseOver", "Color=this.style.backgroundColor;this.style.backgroundColor='#FFF000'");
            e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor=Color;");
            //设置审核状态，并且设置相应的颜色。
            if (e.Row.Cells[5].Text == "False")
            {
                e.Row.Cells[5].Text =StringFormat.HighLight("未审核",true);
            }
            else
            {
                e.Row.Cells[5].Text = StringFormat.HighLight("已审核", false);
            }
            //多余字　使用...显示
            e.Row.Cells[2].Text = StringFormat.Out(e.Row.Cells[2].Text, 18);

        }
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        string id = GridView1.DataKeys[e.NewSelectedIndex].Value.ToString();
        operation.UpdateInfo(id, infoType);
        //按审核类型绑定数据（３种类别：全部显示(-1)，显示未审核(0)，显示审核(1)）
        switch (CheckType)
        {
            case -1:
                GridViewBind(infoType);
                break;
            case 0:
                GridView1.DataSource = operation.SelectInfo(infoType, false);
                GridView1.DataBind();
                break;
            case 1:
                GridView1.DataSource = operation.SelectInfo(infoType, true);
                GridView1.DataBind();
                break;
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
        Response.Write("<script> window.open('DetailInfo.aspx?id=" + id + "&&type=" + infoType + "','','height=258, width=679, top=200, left=200') </script>");
        Response.Write("<script>history.go(-1)</script>");
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //分页设置
        GridView1.PageIndex = e.NewPageIndex;
        //按审核类型绑定数据（３种类别：全部显示(-1)，显示未审核(0)，显示审核(1)）
        switch (CheckType)
        { 
            case -1:
                GridViewBind(infoType);
                break;
            case 0:
                GridView1.DataSource = operation.SelectInfo(infoType, false);
                GridView1.DataBind();
                break;
            case 1:
                GridView1.DataSource = operation.SelectInfo(infoType, true);
                GridView1.DataBind();
                break;
        }
        //显示当前页数
        lblPageSum.Text = "当前页为　" + (GridView1.PageIndex + 1) + " / " + GridView1.PageCount + "　页";
    }
    protected void rdoBtnCheckTrue_CheckedChanged(object sender, EventArgs e)
    {
        GridView1.PageIndex = 0;
        GridView1.DataSource = operation.SelectInfo(infoType, true);
        GridView1.DataBind();
        CheckType = 1;
        //显示当前页数
        lblPageSum.Text = "当前页为　" + (GridView1.PageIndex + 1) + " / " + GridView1.PageCount + "　页";
    }
    protected void rdoBtnCheckFalse_CheckedChanged(object sender, EventArgs e)
    {
        GridView1.PageIndex = 0;
        GridView1.DataSource = operation.SelectInfo(infoType, false);
        GridView1.DataBind();
        CheckType = 0;
        //显示当前页数
        lblPageSum.Text = "当前页为　" + (GridView1.PageIndex + 1) + " / " + GridView1.PageCount + "　页";
    }
    protected void rdoBtnCheckAll_CheckedChanged(object sender, EventArgs e)
    {
        GridView1.PageIndex = 0;
        GridViewBind(infoType);
        CheckType = -1;
        //显示当前页数
        lblPageSum.Text = "当前页为　" + (GridView1.PageIndex + 1) + " / " + GridView1.PageCount + "　页";
    }
}
