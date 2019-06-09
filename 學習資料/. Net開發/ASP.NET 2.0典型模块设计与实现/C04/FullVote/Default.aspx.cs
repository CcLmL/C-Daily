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
        ItemControl myitem = new ItemControl();
        //遍历网格控件中的每一行
        foreach (GridViewRow rowview in GridView1.Rows)
        {
            //主要搜索模板列中的CheckBox控件
            CheckBox check = (CheckBox)rowview.Cells[3].FindControl("CheckBox1");
            //如果被选中
            if (check.Checked)
            {
                //首先判断当前用户的投票是否有效
                bool result = myitem.IsEffect(Request.ServerVariables["REMOTE_ADDR"].ToString(), int.Parse(rowview.Cells[0].Text));
                if (result)
                {
                    //更新数据库中的被投次数
                    myitem.UpdateItem(int.Parse(rowview.Cells[0].Text));
                    //记录投票用户的IP
                    myitem.AddIP(Request.ServerVariables["REMOTE_ADDR"].ToString(), int.Parse(rowview.Cells[0].Text));
                    Label1.Text = "谢谢您的投票";
                }
                else
                {
                    Label1.Text = "对不起，您已经投过票";
                }

            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //传递过去当前主题ID
        string  titleid = DropDownList1.SelectedValue;
        Response.Redirect("ViewVote.aspx?titleid=" + titleid);
    }
}
