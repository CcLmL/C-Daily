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
using ASPJPEGLib;

public partial class Thumbnail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ASPJPEGLib.IASPJpeg objJpeg;
        objJpeg = new ASPJPEGLib.ASPJpeg();

        // 打开原文件
        objJpeg.Open(@"D:\Program Files\Persits Software\AspJpeg\Samples\Images\apple.jpg");
        // 设置图片的新宽度
        objJpeg.Width = int.Parse(TextBox1.Text);
        // 保持长宽比例
        objJpeg.Height = objJpeg.OriginalHeight * objJpeg.Width / objJpeg.OriginalWidth;
        // 将缩略图保存
        objJpeg.Save(Server.MapPath(".") + @"\1.jpg");
        //用Image控件显示缩略图
        Image1.ImageUrl = Server.MapPath(".") + @"\1.jpg";
    }
}
