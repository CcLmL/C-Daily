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
using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;

public partial class CreateImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    /// <summary>
    /// 在PDF文档内插入图片
    /// </summary>
    /// <param name="imagepath">图片地址</param>
    /// <param name="filepath">文件地址</param>
    private void CreatePDFImage(string imagepath,string filepath)
    {
        //创建文档对象
        Document document = new Document();
        //创建目标文件实例
        PdfWriter.GetInstance(document, new FileStream(filepath, FileMode.Create));

        // 打开文档对象
        document.Open();
        //Image wmf = Image.GetInstance("lishi.wmf");
        //Image gif = Image.GetInstance("donghua.gif");
        //初始化图像
        iTextSharp.text.Image jpeg = iTextSharp.text.Image.GetInstance(imagepath);
        //将图像插入到文档内
        document.Add(jpeg);
        //关闭文档
        document.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //获取图片路径
        string imagepath = FileUpload1.PostedFile.FileName;
        //调用插入图片的方法
        //第一个参数表示图片路径，第二个表示文件路径
        CreatePDFImage(imagepath, TextBox1.Text);
    }
}
