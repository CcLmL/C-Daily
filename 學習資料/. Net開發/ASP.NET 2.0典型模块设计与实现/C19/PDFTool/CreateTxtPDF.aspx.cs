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

public partial class CreateTxtPDF : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    /// <summary>
    /// 生成文档的方法
    /// </summary>
    /// <param name="txt">文档内容</param>
    /// <param name="filepath">文档路径全名</param>
    private void CreateTxt(string txt,string filepath)
    { 
        //创建文档对象
        Document document = new Document();
        //实例化生成的文档
		PdfWriter.GetInstance(document, new FileStream(filepath, FileMode.Create));
    	//打开文档
        document.Open();
        //在文档中添加文本内容
		document.Add(new Paragraph(txt));
        //关闭文档对象
        document.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //调用生成文档的方法
        //第一个参数表示文档内容
        //第二个参数表示文档路径全名
        CreateTxt(TextBox1.Text, TextBox2.Text);
    }
}
