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

public partial class ShowPage_webQDCD : System.Web.UI.Page
{
    Operation operation = new Operation();
    static string infoType = "";
    static string infoKey = "";
    static PagedDataSource pds = new PagedDataSource();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            infoType = "求兑出兑";
            infoKey = Convert.ToString(Session["key"]);
            this.DataListBind();

            dlCharge.DataSource = operation.SelectLeaguerInfo(true, infoType);
            dlCharge.DataBind();
            Session["key"] = null;
        }
    }
    /// <summary>
    /// 将数据绑定到DataList控件
    /// </summary>
    public void DataListBind()
    {
        pds = operation.PageDataListBind(infoType, infoKey, Convert.ToInt32(lblCurrentPage.Text), 10);
        lnkBtnFirst.Enabled = true;　　　　　　//控件翻页控件都设置为可用
        lnkBtnLast.Enabled = true;
        lnkBtnNext.Enabled = true;
        lnkBtnPrevious.Enabled = true;
        if (lblCurrentPage.Text == "1")　　　//如果当前显示第一页，“第一页”和“上一页”按钮不可用。
        {
            lnkBtnPrevious.Enabled = false;
            lnkBtnFirst.Enabled = false;
        }
        if (lblCurrentPage.Text == pds.PageCount.ToString())　　//如果显示最后一页，“末一页”和“下一页”按钮不可用。
        {
            lnkBtnNext.Enabled = false;
            lnkBtnLast.Enabled = false;
        }
        lblSumPage.Text = pds.PageCount.ToString();　　//实现总页数
        dlFree.DataSource = pds;　　　　　　　　　　　 //绑定数据源
        dlFree.DataKeyField = "id";
        dlFree.DataBind();
    }
    protected void lnkBtnFirst_Click(object sender, EventArgs e)
    {
        lblCurrentPage.Text = "1";
        DataListBind();
    }
    protected void lnkBtnPrevious_Click(object sender, EventArgs e)
    {
        lblCurrentPage.Text = (Convert.ToInt32(lblCurrentPage.Text) - 1).ToString();
        DataListBind();
    }
    protected void lnkBtnNext_Click(object sender, EventArgs e)
    {
        lblCurrentPage.Text = (Convert.ToInt32(lblCurrentPage.Text) + 1).ToString();
        DataListBind();
    }
    protected void lnkBtnLast_Click(object sender, EventArgs e)
    {
        lblCurrentPage.Text = lblSumPage.Text;
        DataListBind();
    }
}
