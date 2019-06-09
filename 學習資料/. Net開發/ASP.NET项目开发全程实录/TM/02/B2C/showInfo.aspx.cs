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

public partial class showInfo : System.Web.UI.Page
{
    DBClass dbObj = new DBClass();
    CommonClass ccObj = new CommonClass();
    GoodsClass gcObj = new GoodsClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetGoodsInfo();
        }
    }
    /// <summary>
    /// 获取指定商品的信息，并将其显示在界面上
    /// </summary>
    public void GetGoodsInfo()
    {
        string strSql = "select * from tb_BookInfo where BookID=" + Convert.ToInt32(Request["id"].Trim());
        SqlCommand myCmd = dbObj.GetCommandStr(strSql);
        DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbBI");
        this.txtCategory.Text = gcObj.GetClass(Convert.ToInt32(dsTable.Rows[0]["ClassID"].ToString()));
        this.txtName.Text = dsTable.Rows[0]["BookName"].ToString();
        this.txtAuthor.Text = dsTable.Rows[0]["Author"].ToString();
        this.txtCompany.Text = dsTable.Rows[0]["Company"].ToString();
        this.txtMarketPrice.Text = dsTable.Rows[0]["MarketPrice"].ToString();
        this.txtHotPrice.Text = dsTable.Rows[0]["HotPrice"].ToString();
        this.ImageMapPhoto.ImageUrl = dsTable.Rows[0]["BookUrl"].ToString();
        this.cbxCommend.Checked = bool.Parse(dsTable.Rows[0]["Isrefinement"].ToString());
        this.cbxHot.Checked = bool.Parse(dsTable.Rows[0]["IsHot"].ToString());
        this.cbxDiscount.Checked = bool.Parse(dsTable.Rows[0]["IsDiscount"].ToString());
        this.txtShortDesc.Text = dsTable.Rows[0]["BookIntroduce"].ToString();
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        string strUrl = Session["address"].ToString();
        Response.Redirect(strUrl);
    }
}
