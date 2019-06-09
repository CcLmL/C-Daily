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
using System.Data.SqlClient;

public partial class Manage_ShowWord : System.Web.UI.Page
{
    CommonClass ccObj = new CommonClass();
    DBClass dbObj = new DBClass();
    public string ShowSubject, ShowTime, ShowContent, ShowName;
    protected void Page_Load(object sender, EventArgs e)
    {
        string strSql = "SELECT * FROM tb_LeaveWord WHERE ID='" + Request["ID"].ToString() + "'";
        DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbLeaveWord");
        if (dsTable != null)
        {
            ShowSubject =dsTable.Rows[0]["Subject"].ToString();
            ShowTime =dsTable.Rows[0]["DateTime"].ToString();
            ShowContent =dsTable.Rows[0]["Content"].ToString();
            ShowName =dsTable.Rows[0]["Uid"].ToString();
        }
        this.dlBind(); 
    }

    public void dlBind()
    {
        int curpage = Convert.ToInt32(labNowPage.Text);
        PagedDataSource ps = new PagedDataSource();
        string strSql = "SELECT * FROM tb_Reply WHERE ReplyID=" + Request["ID"].ToString() + " order by DateTime Desc";
        DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbReply");
        ps.DataSource = dsTable.DefaultView;
        ps.AllowPaging = true; //是否可以分页
        ps.PageSize = 3; //显示的数量
        ps.CurrentPageIndex = curpage - 1; //取得当前页的页码
        lnkbtnPrve.Enabled = true;
        lnkbtnTop.Enabled = true;
        lnkbtnNext.Enabled = true;
        lnkbtnLast.Enabled = true;
        if (curpage == 1)
        {
            lnkbtnTop.Enabled = false;//不显示第一页按钮
            lnkbtnPrve.Enabled = false;//不显示上一页按钮
        }
        if (curpage == ps.PageCount)
        {
            lnkbtnNext.Enabled = false;//不显示下一页
            lnkbtnLast.Enabled = false;//不显示最后一页

        }
        this.labCount.Text = Convert.ToString(ps.PageCount);
        this.dlReplyWord.DataSource = ps;
        this.dlReplyWord.DataKeyField = "ID";
        this.dlReplyWord.DataBind();
    }
   protected void lnkbtnTop_Click(object sender, EventArgs e)
    {
        this.labNowPage.Text = "1";
        this.dlBind();
    }
    protected void lnkbtnPrve_Click(object sender, EventArgs e)
    {
        this.labNowPage.Text = Convert.ToString(Convert.ToInt32(this.labNowPage.Text) - 1);
        this.dlBind();
    }
    protected void lnkbtnNext_Click(object sender, EventArgs e)
    {
        this.labNowPage.Text = Convert.ToString(Convert.ToInt32(this.labNowPage.Text) + 1);
        this.dlBind();
    }
    protected void lnkbtnLast_Click(object sender, EventArgs e)
    {
        this.labNowPage.Text = this.labCount.Text;
        this.dlBind();
    }
    protected void lnkbtnViewBack_Click(object sender, EventArgs e)
    {
        if (this.lnkbtnViewBack.Text == "查看回复")
        {
            this.lnkbtnViewBack.Text = "隐藏回复";
            this.Panel1.Visible = true;
        }
        else
        {
            this.lnkbtnViewBack.Text = "查看回复";
            this.Panel1.Visible = false;
        }
    }
    protected void lnkbtnFeedBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("LeaveWordBack.aspx?ID=" + Request["ID"].ToString() + "");
    }
}
