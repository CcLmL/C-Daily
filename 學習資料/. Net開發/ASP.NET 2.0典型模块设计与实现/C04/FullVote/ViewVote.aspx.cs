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

public partial class ViewVote : System.Web.UI.Page
{
    private int VoteCount;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //初始化投票项目操作类
            ItemControl item = new ItemControl();
            //获取总投票数
            VoteCount = item.GetVoteCount();
        }
    }
    public int FormatVoteCount(String itemCount)
    {
        //如果投票被投票
        if (itemCount.Length <= 0)
        { //返回0个百分比
            return (0);

        }
        if (VoteCount > 0)
        { //返回实际的百分比
            return ((Int32.Parse(itemCount) * 100 / VoteCount));
        }
        return (0);
    }

    public int FormatVoteImage(int itemCount)
    {
        //返回百分比的图像的长度
        return (itemCount * 3);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");

    }
}
