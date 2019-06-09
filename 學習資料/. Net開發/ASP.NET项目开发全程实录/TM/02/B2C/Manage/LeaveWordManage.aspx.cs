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

public partial class Manage_LeaveWordManage : System.Web.UI.Page
{
    CommonClass ccObj = new CommonClass();
    DBClass dbObj = new DBClass();
    public string ShowSubject, ShowTime, ShowContent;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["AName"] == null)
        {
            Response.Redirect("Main.aspx");
        }
        this.dlBind();
    }
    public void dlBind()
    {
        int curpage = Convert.ToInt32(labNowPage.Text);
        PagedDataSource ps = new PagedDataSource();
        string strSql = "SELECT * FROM tb_LeaveWord order by DateTime Desc";
        SqlCommand myCmd = dbObj.GetCommandStr(strSql);
        DataTable dsTable = dbObj.GetDataSet(myCmd, "tbLeaveWord");
        ps.DataSource = dsTable.DefaultView;
        ps.AllowPaging = true; //是否可以分页
        ps.PageSize = 10; //显示的数量
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
        this.dlManage.DataSource = ps;
        this.dlManage.DataKeyField = "ID";
        this.dlManage.DataBind();
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
    protected void dlManage_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            string sqlDelSql = "Delete from tb_LeaveWord where ID='" + e.CommandArgument + "'";
            SqlCommand myCmd = dbObj.GetCommandStr(sqlDelSql);
            dbObj.ExecNonQuery(myCmd);
            Page.Response.Redirect("LeaveWordManage.aspx");
        
        }
       

    }
}
