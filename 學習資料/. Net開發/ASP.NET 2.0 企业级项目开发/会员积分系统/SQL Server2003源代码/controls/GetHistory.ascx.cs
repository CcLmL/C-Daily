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

public partial class controls_GetHistory : System.Web.UI.UserControl
{
    //初始化汇总变量
    int mytotal = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        //首先判断是否有参数，且参数必须有值
        if (Request.QueryString["cardnum"] !=null)
            //将参数的值赋给本页的txtcardnum控件
            this.txtcardnum.Text = Request.QueryString["cardnum"];
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //初始化汇总变量
        //判断行类型
        switch ((int)(e.Row.RowType))
        {
            case (int)DataControlRowType.DataRow:
                //计算并汇总积分列的值
                mytotal += Convert.ToInt32(e.Row.Cells[3].Text);
                break;
            case (int)DataControlRowType.Footer:
                //如果此行是页脚
                e.Row.Cells[1].Text = "总积分为";
                //显示汇总值
                e.Row.Cells[3].Text = mytotal.ToString();
                break;
        }
    }
}
