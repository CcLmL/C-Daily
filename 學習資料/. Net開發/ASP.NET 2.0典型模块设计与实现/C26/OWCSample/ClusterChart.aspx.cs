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

public partial class ClusterChart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //创建X坐标的值，表示月份
        int[] Month = new int[3] { 1, 2, 3 };
        //创建Y坐标的值，表示销售额
        double[] Count = new double[3] { 120,240,220};
        //创建图表空间
        ChartSpace mychartSpace = new ChartSpace();
        //在图表空间内添加一个图表对象
        ChChart mychart = mychartSpace.Charts.Add(0);
        //设置图表类型，本例使用柱形
        mychart.Type = ChartChartTypeEnum.chChartTypeColumnClustered;
        //设置图表的一些属性
        //是否需要图例
        mychart.HasLegend = true;
        //是否需要主题
        mychart.HasTitle = true;
        //主题内容
        mychart.Title.Caption = "一季度总结";
        //设置x,y坐标
        mychart.Axes[0].HasTitle = true;
        mychart.Axes[0].Title.Caption = "月份";
        mychart.Axes[1].HasTitle = true;
        mychart.Axes[1].Title.Caption = "销量";
        //添加三个图表块
        mychart.SeriesCollection.Add(0);
        mychart.SeriesCollection.Add(0);
        mychart.SeriesCollection.Add(0);
        //设置图表块的属性
        //标题
        mychart.SeriesCollection[0].Caption = "一月份";
        //X坐标的值属性
        mychart.SeriesCollection[0].SetData(ChartDimensionsEnum.chDimCategories, (int)ChartSpecialDataSourcesEnum.chDataLiteral, Month[0]);
        //y坐标的值属性
        mychart.SeriesCollection[0].SetData(ChartDimensionsEnum.chDimValues, (int)ChartSpecialDataSourcesEnum.chDataLiteral, Count[0]);

        //第二个块
        mychart.SeriesCollection[1].Caption = "二月份";
        //X坐标的值属性
        mychart.SeriesCollection[1].SetData(ChartDimensionsEnum.chDimCategories, (int)ChartSpecialDataSourcesEnum.chDataLiteral, Month[1]);
        //y坐标的值属性
        mychart.SeriesCollection[1].SetData(ChartDimensionsEnum.chDimValues, (int)ChartSpecialDataSourcesEnum.chDataLiteral, Count[1]);
     
        //第三个块
        mychart.SeriesCollection[2].Caption = "三月份";
        //X坐标的值属性
        mychart.SeriesCollection[2].SetData(ChartDimensionsEnum.chDimCategories, (int)ChartSpecialDataSourcesEnum.chDataLiteral, Month[2]);
        //y坐标的值属性
        mychart.SeriesCollection[2].SetData(ChartDimensionsEnum.chDimValues, (int)ChartSpecialDataSourcesEnum.chDataLiteral, Count[2]);

        //生成图片
        mychartSpace.ExportPicture(Server.MapPath(".") + @"\test.jpg", "jpg", 500, 450);
        //加载图片
        Image1.ImageUrl = Server.MapPath(".") + @"\test.jpg";
    }
}
