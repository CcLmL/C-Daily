using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
public partial class Test : System.Web.UI.Page
{
    //自定义一个二维数组，用于月日的选择。
    string [,] ViewInfo=new string[13,32];
    protected void Page_Load(object sender, EventArgs e)
    {
        //初始化三个日期提示信息
        ViewInfo[7, 15] = "奶奶的生日";
        ViewInfo[7, 16] = "开学日期";
        ViewInfo[7, 14] = "发放考试成绩单日";


    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        //定义一个日期变量，用于用户选择的日子
        DateTime infoday = e.Day.Date;
        string info;
        //通过数组查看是否有内容
        info = ViewInfo[infoday.Month, infoday.Day];
        //判断是否已经自定义信息
        if (info != null)
        {
            Label lbl = new Label();
            lbl.Text = info;
            //在控件内加了一个Label，用于显示信息
            e.Cell.Controls.Add(lbl);
            //改变边框线
            e.Cell.BorderStyle = BorderStyle.Solid;
        }
    }
}
