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

public partial class CreateLink : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //调用生成链接的方法
        //参数1表示链接的文本提示
        //参数2表示连接到的地址
        //参数3表示目录文件的生成路径
        CreatePDFlink(TextBox1.Text, TextBox2.Text,TextBox3.Text);
    }
    /// <summary>
    /// 生成链接型PDF文档的方法
    /// </summary>
    /// <param name="txt">链接的文本提示</param>
    /// <param name="url">连接到的地址</param>
    ///<param name="filepath">目录文件的生成路径</param>
    private void CreatePDFlink(string txt,string url,string filepath)
    {
        //创建文档对象
        Document document = new Document();
        //实例化目标文件对象
        PdfWriter.GetInstance(document, new FileStream(filepath, FileMode.Create));

        // 打开文档对象
        document.Open();
        //文本提示信息
        Paragraph paragraph = new Paragraph(txt);
        //链接包含的文本
        Anchor anchor1 = new Anchor("please hit here", FontFactory.GetFont(FontFactory.HELVETICA, 12, Font.UNDERLINE, new Color(0, 0, 255)));
        anchor1.Reference = url;
        anchor1.Name = "top1";
        paragraph.Add(anchor1);
        paragraph.Add(new Chunk(".\n\n\n\n\nn\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"));
        document.Add(paragraph);
        //指定跳转信息
        Anchor anchor2 = new Anchor("please jump to a local destination", FontFactory.GetFont(FontFactory.HELVETICA, 12, Font.NORMAL, new Color(0, 0, 255)));
        anchor2.Reference = "#top1";
        document.Add(anchor2);
        //关闭文档
        document.Close();
    }
}
