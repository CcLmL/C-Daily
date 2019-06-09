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

public partial class ShareArea_FileDownload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField1.Value = Server.MapPath("~/FileManager/");
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
            //定义选中的文件的全名
            string SelectName = Server.MapPath("~/FileManager/") + row.Cells[0].Text;
            //获取文件的名字
            string saveFileName = row.Cells[0].Text;
            //创建一个文件实体，方便对文件操作
            FileInfo finfo = new FileInfo(SelectName);
            //清空输出流
            Response.Clear();
            Response.Charset = "utf-8";
            Response.Buffer = true;
            //关闭ViewState以提高速度
            this.EnableViewState = false;
            //定义输出文件编码及类型和文件名
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.AppendHeader("Content-Disposition", "attachment;filename=" + saveFileName);
            //因为保存的文件类型不限，此处类型选择“unknown”。
            Response.ContentType = "application/unknown"; ;
            Response.WriteFile(SelectName);
            //清空并关闭输出流
            Response.Flush();
            Response.Close();
            Response.End();
        }
    }
}
