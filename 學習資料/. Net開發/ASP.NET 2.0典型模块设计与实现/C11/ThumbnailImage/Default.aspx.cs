using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Drawing;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //用控件显示选择的图片的缩略图
        Image2.ImageUrl = "Thumbnail.aspx";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //首先保存图片路径
        Session["FileName"] = FileUpload1.PostedFile.FileName;
        //用控件显示选择的图片
        Image1.ImageUrl = "ImageSrc.aspx";
    }
}
