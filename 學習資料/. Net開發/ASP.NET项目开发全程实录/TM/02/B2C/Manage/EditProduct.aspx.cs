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

public partial class Manger_EditProduct : System.Web.UI.Page
{
    DBClass dbObj = new DBClass();
    CommonClass ccObj = new CommonClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlClassBind();//绑定商品类别
            ImageBind();   //绑定供选商品图像
            GetGoodsInfo();//商品指定商品信息
        }
    }
    public void ddlClassBind()
    {
        string strSql = "select * from tb_Class";
        DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbClass");
        this.ddlCategory.DataSource = dsTable.DefaultView;
        this.ddlCategory.DataTextField = dsTable.Columns[1].ToString();
        this.ddlCategory.DataValueField = dsTable.Columns[0].ToString();
        this.ddlCategory.DataBind();
    }
    public void ImageBind()
    {
        string strSql = "select * from tb_Image";
        DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbImage");
        this.ddlUrl.DataSource = dsTable.DefaultView;
        this.ddlUrl.DataTextField = dsTable.Columns[1].ToString();
        this.ddlUrl.DataValueField = dsTable.Columns[2].ToString();
        this.ddlUrl.DataBind();
        ddlUrl.SelectedIndex = 0;
    }
    /// <summary>
    /// 获取指定商品的信息，并将其显示在界面上
    /// </summary>
    public void GetGoodsInfo()
    {
        string strSql = "select * from tb_BookInfo where BookID="+Convert.ToInt32(Request["BookID"].Trim());
        SqlCommand myCmd = dbObj.GetCommandStr(strSql);
        DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbBI");
        this.ddlCategory.SelectedValue = dsTable.Rows[0]["ClassID"].ToString();//商品类别
        this.txtName.Text = dsTable.Rows[0]["BookName"].ToString();            //商品名
        this.txtAuthor.Text = dsTable.Rows[0]["Author"].ToString();            //商品作者
        this.txtCompany.Text = dsTable.Rows[0]["Company"].ToString();          //商品商城
        this.txtMarketPrice.Text = dsTable.Rows[0]["MarketPrice"].ToString();  //商品市场价
        this.txtHotPrice.Text = dsTable.Rows[0]["HotPrice"].ToString();        //商品热门价
        this.ddlUrl.SelectedValue = dsTable.Rows[0]["BookUrl"].ToString();     //商品图像路径
        this.ImageMapPhoto.ImageUrl = ddlUrl.SelectedItem.Value;               //显示商品图像
        this.cbxCommend.Checked = bool.Parse(dsTable.Rows[0]["Isrefinement"].ToString()); //是否推价
        this.cbxHot.Checked = bool.Parse(dsTable.Rows[0]["IsHot"].ToString());            //是否热门
        this.cbxDiscount.Checked = bool.Parse(dsTable.Rows[0]["IsDiscount"].ToString());  //是否最新
        this.txtShortDesc.Text = dsTable.Rows[0]["BookIntroduce"].ToString();             //商品简短描述
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int IntClassID = Convert.ToInt32(this.ddlCategory.SelectedValue.ToString());//商品类别号
        string strBookName = this.txtName.Text.Trim();                              //商品类别名
        string strBookDesc = this.txtShortDesc.Text.Trim();                         //商品简短描述
        string strAuthor = this.txtAuthor.Text.Trim();                              //商品作者
        string strCompany = this.txtCompany.Text.Trim();                            //商品商城
        string strBookUrl = this.ddlUrl.SelectedValue.ToString();                   //商品图像路径
        float fltMarketPrice = float.Parse(this.txtMarketPrice.Text.Trim());        //商品市场价
        float fltHotPrice = float.Parse(this.txtHotPrice.Text.Trim());              //商品热门价
        bool blCommend = Convert.ToBoolean(this.cbxCommend.Checked);                //是否推价
        bool blHot = Convert.ToBoolean(this.cbxHot.Checked);                        //是否热门
        bool blDiscount = Convert.ToBoolean(this.cbxDiscount.Checked);              //是否最新
        //修改数据表中的商品信息
        string strSql = "update tb_BookInfo ";
        strSql += "set ClassID='" + IntClassID + "',BookName='" + strBookName + "',BookIntroduce='" + strBookDesc + "'";
        strSql += ",Author='" + strAuthor + "',Company='" + strCompany + "',BookUrl='" + strBookUrl + "'";
        strSql += ",MarketPrice='" + fltMarketPrice + "',HotPrice='" + fltHotPrice + "'";
        strSql += ",Isrefinement='" + blCommend + "',IsHot='" +blHot+ "',IsDiscount='" +blDiscount+ "',LoadDate='"+DateTime.Now+"'";
        strSql += "where BookID=" + Convert.ToInt32(Request["BookID"].Trim());
        SqlCommand myCmd = dbObj.GetCommandStr(strSql);
        dbObj.ExecNonQuery(myCmd);
        Response.Write(ccObj.MessageBox("修改成功！", "Product.aspx"));
    }
    protected void ddlUrl_SelectedIndexChanged(object sender, EventArgs e)
    {
        ImageMapPhoto.ImageUrl = ddlUrl.SelectedItem.Value;
    }
}
