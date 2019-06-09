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

        //------------------------------------------------------------
    }
    /// <summary>
    /// 将上传图片生成带水印和文字效果的缩略图
    /// </summary>
    /// <param name="postFile">上传的图片文件</param>
    /// <param name="saveImg">效果图的保存路径</param>
    /// <param name="Width">缩略图的宽度</param>
    /// <param name="Height">缩略图的高度</param>
    private void MakeThumbnailImg(System.Web.HttpPostedFile postFile,string saveImg,System.Double Width,System.Double Height)
    {
        
        //原始图片名称
        string originalFilename = postFile.FileName;
        //生成的高质量图片名称
        string strGoodFile = saveImg;
        //从文件取得图片对象
        System.Drawing.Image image = System.Drawing.Image.FromStream(postFile.InputStream,true);
        //判断指定的图片大小
        System.Double NewWidth,NewHeight;
        if(image.Width>image.Height)
        {
            NewWidth=Width;
            NewHeight=image.Height*(NewWidth/image.Width);
        }
        else
        {
            NewHeight=Height;
            NewWidth=(NewHeight/image.Height)*image.Width;
        }
        if (NewWidth>Width)
        {
            NewWidth=Width;
        }
        if (NewHeight>Height)
        {
            NewHeight=Height;
        }
        //取得图片大小
        System.Drawing.Size size = new Size((int)NewWidth,(int)NewHeight);
        //新建一个bmp图片
        System.Drawing.Image bitmap = new System.Drawing.Bitmap(size.Width,size.Height);
        //新建一个画板
        System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(bitmap);
        //设置高质量插值法
        g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;
        //设置高质量,低速度呈现平滑程度
        g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
        //清空一下画布-背景色设置为白色即可
        g.Clear(Color.White);
        //在指定位置画图
        g.DrawImage(image, new System.Drawing.Rectangle(0, 0, bitmap.Width, bitmap.Height), 
            new System.Drawing.Rectangle(0, 0, image.Width,image.Height),
            System.Drawing.GraphicsUnit.Pixel);

        //添加文字水印
        System.Drawing.Graphics G = System.Drawing.Graphics.FromImage(bitmap);
        System.Drawing.Font f = new Font("宋体", 10);
        System.Drawing.Brush b = new SolidBrush(Color.Black);
        //添加缩略图中的文字
        G.DrawString("CGJ", f, b, 10, 10);
        G.Dispose();

        //图片水印
        //获取水印文件
        System.Drawing.Image copyImage = System.Drawing.Image.FromFile(@"D:\Documents and Settings\cgjcgj\My Documents\My Pictures\water.jpg");
        //新绘图
        Graphics a = Graphics.FromImage(bitmap);
        a.DrawImage(copyImage, new Rectangle(bitmap.Width - copyImage.Width, bitmap.Height - copyImage.Height, 
            copyImage.Width, copyImage.Height), 0, 0, copyImage.Width, copyImage.Height, GraphicsUnit.Pixel);
        copyImage.Dispose();
        //释放资源
        a.Dispose();
        copyImage.Dispose();
        
        //保存高清晰度的缩略图
        bitmap.Save(strGoodFile, System.Drawing.Imaging.ImageFormat.Jpeg);
        
        g.Dispose();
        image.Dispose();
        bitmap.Dispose();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //缩略图的高度和宽度
        int width = int.Parse(txtwidth.Text);
        int height = int.Parse(txtheight.Text);
        //调用生成缩略图的方法
        //默认缩略图文件生成在当前服务器的路径下
        MakeThumbnailImg(FileUpload1.PostedFile, this.Server.MapPath("test.jpg"), width, height);
        //用Image控件显示效果
        Image1.ImageUrl = this.Server.MapPath("test.jpg");
    }
}
