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

public partial class WaterMarkedImage : System.Web.UI.Page
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
           160, 160, myCallback, IntPtr.Zero);
        //图片的缩略图
        Bitmap bmp = new Bitmap(myThumbnail);
        //水印图片
        System.Drawing.Image waterImage = System.Drawing.Image.FromFile(@"D:\Documents and Settings\cgjcgj\My Documents\My Pictures\water.jpg");
        //定义绘图对象
        Graphics g = Graphics.FromImage(bmp);
        //在原始图片的右下角绘制水印图片
        g.DrawImage(waterImage, new Rectangle(bmp.Width - waterImage.Width, bmp.Height - waterImage.Height, waterImage.Width, waterImage.Height), 0, 0, waterImage.Width, waterImage.Height, GraphicsUnit.Pixel);
        //将绘制后的图片输出到页面
        bmp.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
        //释放资源
        g.Dispose();
        bmp.Dispose();
        


        ////原图
        //System.Drawing.Image image = System.Drawing.Image.FromFile(@"D:\Documents and Settings\All Users\Documents\My Pictures\示例图片\Sunset.jpg");        
        ////根据图片高度和宽度进行格式化，生成新图片对象
        //Bitmap bmp = new Bitmap(image.Width, image.Height,PixelFormat.Format24bppRgb);
        //Graphics g = Graphics.FromImage(bmp);
        //g.Clear(Color.White);
        ////高保真效果
        //g.SmoothingMode = SmoothingMode.HighQuality;
        //g.InterpolationMode = InterpolationMode.High;
        ////指定位置绘图
        //g.DrawImage(image, 0, 0, image.Width, image.Height);
        //Watermarked(g, Page.Server.MapPath(Watermarkimgpath), WatermarkPosition, image.Width, image.Height);
    }
    //必须创建此委托,在GDI+ 1.0版本中已不调用
    public bool ThumbnailCallback()
    {
        return false;
    }
    ///// <summary>
    ///// 给图片加水印信息
    ///// </summary>
    ///// <param name="picture">Image对象</param>
    ///// <param name="WaterMarkPicPath">水印图片的地址</param>
    ///// <param name="_watermarkPosition">水印位置</param>
    ///// <param name="_width">水印图片的宽</param>
    ///// <param name="_height">水印图片的高</param>
    //private void Watermarked(Graphics picture, string WaterMarkPicPath, string _watermarkPosition, int _width, int _height)
    //{
    //    Image watermark = new Bitmap(WaterMarkPicPath);
    //    ImageAttributes imageAttributes = new ImageAttributes();
    //    ColorMap colorMap = new ColorMap();
    //    colorMap.OldColor = Color.FromArgb(255, 0, 255, 0);
    //    colorMap.NewColor = Color.FromArgb(0, 0, 0, 0);
    //    ColorMap[] remapTable = {colorMap};
    //    imageAttributes.SetRemapTable(remapTable, ColorAdjustType.Bitmap);        
    //    float[][] colorMatrixElements = {
    //        new float[] {1.0f,  0.0f,  0.0f,  0.0f, 0.0f},
    //        new float[] {0.0f,  1.0f,  0.0f,  0.0f, 0.0f},
    //        new float[] {0.0f,  0.0f,  1.0f,  0.0f, 0.0f},
    //        new float[] {0.0f,  0.0f,  0.0f,  0.3f, 0.0f},
    //        new float[] {0.0f,  0.0f,  0.0f,  0.0f, 1.0f}
    //    };
    //    ColorMatrix colorMatrix = new ColorMatrix(colorMatrixElements);
    //    imageAttributes.SetColorMatrix(colorMatrix, ColorMatrixFlag.Default, ColorAdjustType.Bitmap);
    //    int xpos = 0;
    //    int ypos = 0;
    //    int WatermarkWidth=0;
    //    int WatermarkHeight=0;
    //    double bl=1d;
    //    //计算水印图片的比率
    //    //取背景的1/4宽度来比较
    //    if((_width>watermark.Width*4)&&(_height>watermark.Height*4))
    //    {
    //        bl=1;
    //    }
    //    else if((_width>watermark.Width*4)&&(_height<watermark.Height*4))
    //    {
    //        bl=Convert.ToDouble(_height/4)/Convert.ToDouble(watermark.Height);  
    //    }else if((_width<watermark.Width*4)&&(_height>watermark.Height*4))
    //    {
    //        bl=Convert.ToDouble(_width/4)/Convert.ToDouble(watermark.Width);
    //    }
    //    else
    //    {
    //        if((_width*watermark.Height)>(_height*watermark.Width))
    //        {
    //            bl=Convert.ToDouble(_height/4)/Convert.ToDouble(watermark.Height); 
    //        }
    //        else
    //        {
    //            bl=Convert.ToDouble(_width/4)/Convert.ToDouble(watermark.Width);
    //        }  
    //    }
    //    WatermarkWidth=Convert.ToInt32(watermark.Width*bl);
    //    WatermarkHeight=Convert.ToInt32(watermark.Height*bl); 
    //    switch(_watermarkPosition)
    //    {
    //        case "WM_TOP_LEFT":
    //            xpos = 10;
    //            ypos = 10;
    //            break;
    //        case "WM_TOP_RIGHT":
    //            xpos = _width - WatermarkWidth - 10;
    //            ypos = 10;
    //            break;
    //        case "WM_BOTTOM_RIGHT":
    //            xpos = _width - WatermarkWidth - 10;
    //            ypos = _height -WatermarkHeight - 10;
    //            break;
    //        case "WM_BOTTOM_LEFT":
    //            xpos = 10;
    //            ypos = _height - WatermarkHeight - 10;
    //            break;
    //    }
    //    picture.DrawImage(watermark, new Rectangle(xpos, ypos, WatermarkWidth, WatermarkHeight),
    //        0, 0, watermark.Width, watermark.Height, GraphicsUnit.Pixel, imageAttributes);
    //    watermark.Dispose(); 
    //    imageAttributes.Dispose();
    //}
}
