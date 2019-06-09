using System;
using System.Data;
using System.Configuration;
using System.Web;
using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;

/// <summary>
/// 将DataTable转化为PDF文件的方法
/// </summary>
public class TableToPDF
{
	public TableToPDF()
	{
	}
    /// <summary>
    /// 转换数据表为PDF文档
    /// </summary>
    /// <param name="Data">数据表数据</param>
    /// <param name="PDFFile">目标PDF文件全路径</param>
    /// <param name="FontPath">字体所在路径</param>
    /// <param name="FontSize">字体大小</param>
    /// <returns>返回调用是否成功</returns>
    public static bool ConvertDataTableToPDF(DataTable datatable, string PDFFilePath, string FontPath, float FontSize)
    {
        //初始化一个目标文档类
        Document document = new Document();
        //调用PDF的写入方法流
        //注意FileMode-Create表示如果目标文件不存在，则创建，如果已存在，则覆盖。
        PdfWriter writer = PdfWriter.GetInstance(document, new FileStream(PDFFilePath, FileMode.Create));
        //打开目标文档对象
        document.Open();
        //创建PDF文档中的字体
        BaseFont baseFont =BaseFont.CreateFont(
            FontPath,
            BaseFont.IDENTITY_H,
            BaseFont.NOT_EMBEDDED);
        //根据字体路径和字体大小属性创建字体
        Font font = new Font(baseFont, FontSize);
        //根据数据表内容创建一个PDF格式的表
        PdfPTable table = new PdfPTable(datatable.Columns.Count);
        //遍历原table的内容
        for (int i = 0; i < datatable.Rows.Count; i++)
        {
            for (int j = 0; j < datatable.Columns.Count; j++)
            {
                table.AddCell(new Phrase(datatable.Rows[i][j].ToString(), font));
            }
        }
        //在目标文档中添加转化后的表数据
        document.Add(table);
        //关闭目标文件
        document.Close();
        //关闭写入流
        writer.Close();
        return true;
    }
}
