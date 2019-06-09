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

public partial class CopyrightImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //提供一个回调方法，用于确定方法何时取消
        System.Drawing.Image.GetThumbnailImageAbort myCallback =
            new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback);

        //创建一个图像对象
        Bitmap myBitmap = new Bitmap(@"D:\Documents and Settings\cgjcgj\My Documents\My Pictures\wpakey.jpg");
        //使用“GetThumbnailImage”方法生成图像的缩略图
        //前两个参数分别是图像的高度和宽度
        System.Drawing.Image myThumbnail = myBitmap.GetThumbnailImage(
            80, 80, myCallback, IntPtr.Zero);
        //将图像保存到页面输出流中,并制定输出图像的格式
        myThumbnail.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
        //版权信息显示的内容
        string copyrightString = " CGJ";
        //输出前清空页面流
        Response.Clear();
        //创建缩略图的输出对象
        Bitmap output = new Bitmap(myThumbnail);
        Graphics g = Graphics.FromImage(output);
        //将文字信息绘制在缩略图上
        g.DrawString(copyrightString, new Font("Courier New", 14), new SolidBrush(Color.Red), 0, 0);
        //将修改后的缩略图输出到页面流
        output.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
        //释放资源
        g.Dispose();
        output.Dispose();

    }
    //必须创建此委托,在GDI+ 1.0版本中已不调用
    public bool ThumbnailCallback()
    {
        return false;
    }
}
