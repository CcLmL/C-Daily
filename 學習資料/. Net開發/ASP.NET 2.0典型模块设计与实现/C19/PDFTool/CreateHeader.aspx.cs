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
public partial class CreateHeader : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    /// <summary>
    /// 生成带页眉页脚的PDF
    /// </summary>
    /// <param name="filepath">文件路径</param>
    /// <param name="headertxt">页眉</param>
    /// <param name="footertxt">页脚</param>
    private void CreatePDFheader(string filepath,string headertxt,string footertxt)
    {
        //创建文档对象
        Document document = new Document();
        // 创建文档写入实例
        PdfWriter.GetInstance(document, new FileStream(filepath, FileMode.Create));

        // 添加页脚
        HeaderFooter footer = new HeaderFooter(new Phrase(footertxt), true);
        footer.Border = Rectangle.NO_BORDER;
        document.Footer = footer;

        //打开文档内容对象
        document.Open();

        // 添加页眉
        HeaderFooter header = new HeaderFooter(new Phrase(headertxt), false);
        document.Header = header;
        //设计各页的内容
        document.Add(new Paragraph("This is First Page"));
        //新添加一个页
        document.NewPage();
        //第2页中添加文本
        document.Add(new Paragraph("This is Second Page"));
        // 重置页面数量
        document.ResetPageCount();
        //关闭文档对象
        document.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //调用创建文档的方法
        //第一参数表示文件路径
        //第二个参数表示页眉内容
        //第三个参数表示页脚内容
        CreatePDFheader(TextBox3.Text, TextBox1.Text, TextBox2.Text);
    }
}
