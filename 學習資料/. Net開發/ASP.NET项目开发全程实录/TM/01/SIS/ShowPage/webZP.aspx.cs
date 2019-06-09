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

public partial class webZP : System.Web.UI.Page
{
    Operation operation = new Operation();　//声明业务类对象
    static string infoType = "";            //声明供求信息类型对象
    static string infoKey = "";             //声明查询信息关键字
    static PagedDataSource pds = new PagedDataSource();  //声明

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            infoType = "招聘信息";
            //infoKey的意思用语用户快速检索，如果值为空，显示所有招聘供求信息，否则显示查询内容
            infoKey = Convert.ToString(Session["key"]); 
            this.DataListBind();
            //显示未过期收费信息
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
        //将分页结果设置结果赋值给新的页数据源对象
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
        lblCurrentPage.Text = "1";  //第一页
        DataListBind();
    }
    protected void lnkBtnPrevious_Click(object sender, EventArgs e)
    {
        lblCurrentPage.Text = (Convert.ToInt32(lblCurrentPage.Text) - 1).ToString();  //上一页
        DataListBind();
    }
    protected void lnkBtnNext_Click(object sender, EventArgs e)
    {
        lblCurrentPage.Text = (Convert.ToInt32(lblCurrentPage.Text) + 1).ToString(); //下一页
        DataListBind();
    }
    protected void lnkBtnLast_Click(object sender, EventArgs e)   //最后一页
    {
        lblCurrentPage.Text = lblSumPage.Text;
        DataListBind();
    }
}
