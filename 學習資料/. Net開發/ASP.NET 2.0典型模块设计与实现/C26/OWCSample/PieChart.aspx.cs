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
public partial class PieChart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //创建X坐标的值，表示月份
        int[] Month ={ 1, 2, 3 };
        //创建Y坐标的值，表示销售额
        double[] Count ={ 120, 240, 220 };
        string strDataName = "";
        string strData = "";
        //创建图表空间
        ChartSpace mychartSpace = new ChartSpace();
        //在图表空间内添加一个图表对象
        ChChart mychart = mychartSpace.Charts.Add(0);
        //设置每块饼的数据
        for (int i = 0; i < Count.Length; i++)
        {
            strDataName += Month[i] + "\t";
            strData += Count[i].ToString() + "\t";
        }

        //设置图表类型，本例使用柱形
        mychart.Type = ChartChartTypeEnum.chChartTypePie;
        //设置图表的一些属性
        //是否需要图例
        mychart.HasLegend = true;
        //是否需要主题
        mychart.HasTitle = true;
        //主题内容
        mychart.Title.Caption = "一季度总结";
        //添加图表块
        mychart.SeriesCollection.Add(0);
        //设置图表块的属性

        //分类属性
        mychart.SeriesCollection[0].SetData(ChartDimensionsEnum.chDimCategories, (int)ChartSpecialDataSourcesEnum.chDataLiteral, strDataName);
        //值属性
        mychart.SeriesCollection[0].SetData(ChartDimensionsEnum.chDimValues, (int)ChartSpecialDataSourcesEnum.chDataLiteral, strData);
       //显示百分比
        ChDataLabels mytb= mychart.SeriesCollection[0].DataLabelsCollection.Add();
        mytb.HasPercentage = true;
        //生成图片
        mychartSpace.ExportPicture(Server.MapPath(".") + @"\test.gif", "gif", 500, 450);
        //加载图片
        Image1.ImageUrl = Server.MapPath(".") + @"\test.gif";
    }
}
