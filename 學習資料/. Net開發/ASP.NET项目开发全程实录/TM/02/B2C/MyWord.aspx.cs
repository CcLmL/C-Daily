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

public partial class MyWord : System.Web.UI.Page
{
    CommonClass ccObj = new CommonClass();
    DBClass dbObj = new DBClass();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserName"] == null)
        {
            Response.Write("<script>alert('对不起！您不是会员，请先注册！');location='Default.aspx'</script>");
            Response.End();
        }
        this.dlBind();//显示留言信息
    }
    public void dlBind()
    {
        int curpage = Convert.ToInt32(labNowPage.Text); //当前页
        PagedDataSource ps = new PagedDataSource(); //定义一个PagedDataSource类对象
        //获取留言信息
        string strSql = "SELECT * FROM tb_LeaveWord WHERE Uid='" + Session["UserName"].ToString() + "'";
        SqlCommand myCmd = dbObj.GetCommandStr(strSql);
        DataTable dsTable = dbObj.GetDataSet(myCmd, "tbLeaveWord");
        ps.DataSource =dsTable.DefaultView;
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
        this.labCount.Text = Convert.ToString(ps.PageCount);//页的总数
        //绑定DataList控件，显示留言信息
        this.dlMyWord.DataSource = ps;
        this.dlMyWord.DataKeyField = "ID";
        this.dlMyWord.DataBind();
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
   
    protected void dlMyWord_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        string strSql = this.dlMyWord.DataKeys[e.Item.ItemIndex].ToString(); //获取当前DataList控件列
        string sqlDelSql = "Delete from tb_LeaveWord where ID='" + Convert.ToInt32(strSql) + "'";
        SqlCommand myCmd = dbObj.GetCommandStr(sqlDelSql);
        dbObj.ExecNonQuery(myCmd);
        Page.Response.Redirect("MyWord.aspx");

    }
}
