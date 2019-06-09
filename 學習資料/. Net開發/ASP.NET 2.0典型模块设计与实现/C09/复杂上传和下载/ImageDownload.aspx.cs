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
using System.IO;

public partial class ImageDownload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        //判断选择的是否是数据行
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //定义选中的控件
            LinkButton btn = (LinkButton)e.Row.Cells[2].Controls[0];
            //为控件添加一个事件参数
            btn.CommandArgument = e.Row.RowIndex.ToString();
        }

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //判断是否是选择的“下载”按钮
        if (e.CommandName == "down")
        {
            //获取控件中的事件参数，并进行类型转换
            int index = Convert.ToInt32(e.CommandArgument);
            // 定义选中的行
            GridViewRow row = GridView1.Rows[index];
            Response.Redirect("Handler.ashx?PhotoID=" + row.Cells[0].Text);
        }

    }
}
