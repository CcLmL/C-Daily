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

public partial class PDFToHTML : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //设置浏览器的输出格式
        Response.ContentType = "Application/pdf";
        //获取要输出的文件地址
        //如果地址不固定，可通过页面传递参数过来
        string FilePath = Server.MapPath("Table.pdf");
        //string FilePath = Server.MapPath(Request.QueryString["filepath"]);
        //将文件写入页面的输出流。
        Response.WriteFile(FilePath);
        //关闭输出流
        Response.End();
    }
}
