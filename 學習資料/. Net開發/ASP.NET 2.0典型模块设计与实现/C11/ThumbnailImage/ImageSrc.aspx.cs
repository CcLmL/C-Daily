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

using System.Drawing;

public partial class ImageSrc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //提供一个回调方法，用于确定方法何时取消
        System.Drawing.Image.GetThumbnailImageAbort myCallback =
            new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback);

        //创建一个图像对象
        Bitmap myBitmap = new Bitmap(Session["FileName"].ToString());
        //将图像保存到页面输出流中,并制定输出图像的格式
        myBitmap.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
    }
    //必须创建此委托,在GDI+ 1.0版本中已不调用
    public bool ThumbnailCallback()
    {
        return false;
    }
}
