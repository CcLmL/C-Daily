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

public partial class MsgList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //导航到发帖页面
        HyperLink1.NavigateUrl = "SendMsg.aspx?categoryid=" + Request.QueryString["categoryid"];
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        ////如果选择的是行
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    e.Row.Attributes.Add("onclick", "<script language=javascript><</script>contentlist.aspx?filename='+e.Row.Cells[5].Text)");
        //}
    }
    ///// <summary>
    ///// 导航方法
    ///// </summary>
    ///// <param name="filename">传递内容文件名</param>
    //private void navigate(string filename)
    //{
    //     +filename);
    //}
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //获取当前选择的行
        GridViewRow row = GridView1.SelectedRow;
        //导航到发送信息的页面
        Response.Redirect("contentlist.aspx?filename=" + row.Cells[6].Text);

    }
}
