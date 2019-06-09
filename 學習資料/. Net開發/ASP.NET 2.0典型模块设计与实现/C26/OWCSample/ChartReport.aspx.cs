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
using Microsoft.Office.Interop.Owc11;
public partial class ChartReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //创建X坐标的值，表示月份
        int[] Month = { 1, 2, 3 };
        //创建Y坐标的值，表示销售额
        double[] Count = { 120, 240, 220 };

        //创建图表空间
        ChartSpace mychartSpace = new ChartSpace();
        //创建表容器
        SpreadsheetClass myexl = new SpreadsheetClass();
        //获取当前表
        Worksheet mysheet = myexl.ActiveSheet;
        //添加表标题
        mysheet.Cells[1, 1] = "销售额";
        mysheet.Cells[1, 2] = "季度";
        //添加数据
        for (int i = 0; i < 3; i++)
        {
            mysheet.Cells[i + 2, 1] = Count[i];
            mysheet.Cells[i + 2, 2] = Month[i];
        }
        //导出表格
        myexl.Export(@"e:\test1.xls",
            SheetExportActionEnum.ssExportActionNone, SheetExportFormat.ssExportXMLSpreadsheet);

    }

}
