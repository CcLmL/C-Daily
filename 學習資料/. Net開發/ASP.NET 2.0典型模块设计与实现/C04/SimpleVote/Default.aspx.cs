using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化投票项目操作类
        ItemOperation io = new ItemOperation();
        //遍历网格控件中的每一行
        foreach (GridViewRow rowview in GridView1.Rows) 
        {
            //主要搜索模板列中的CheckBox控件
            CheckBox check = (CheckBox)rowview.Cells[2].FindControl("CheckBox1");
            //如果被选中
            if (check.Checked)
            {
                //更新数据库中的被投次数
                io.UpdateVote(int.Parse(rowview.Cells[0].Text));
                Label1.Text = "谢谢您的投票";
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewVote.aspx");
    }
}
