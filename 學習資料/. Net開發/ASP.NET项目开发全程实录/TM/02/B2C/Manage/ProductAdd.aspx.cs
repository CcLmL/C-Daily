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

public partial class Manger_ProductAdd : System.Web.UI.Page
{
    DBClass dbObj = new DBClass();
    CommonClass ccObj = new CommonClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlClassBind(); //绑定商品类别
            ddlUrlBind();   //绑定商品供选图像
        }
    }
    public void ddlClassBind()
    {
        string strSql = "select * from tb_Class";
        DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbClass");
        //将商品类别信息绑定到DropDownList控件中
        this.ddlCategory.DataSource = dsTable.DefaultView; 
        //绑定商品类别名
        this.ddlCategory.DataTextField = dsTable.Columns[1].ToString();
        //绑定商品类别号
        this.ddlCategory.DataValueField = dsTable.Columns[0].ToString();
        this.ddlCategory.DataBind();
    }
    public void ddlUrlBind()
    {
        string strSql = "select * from tb_Image";
        DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbImage");
        //将供选图像绑定到DropDownList控件中
        this.ddlUrl.DataSource = dsTable.DefaultView;
        //绑定图像名
        this.ddlUrl.DataTextField = dsTable.Columns[1].ToString();
        //绑定图像路径
        this.ddlUrl.DataValueField = dsTable.Columns[2].ToString();
        this.ddlUrl.DataBind();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        int IntClassID=Convert.ToInt32(this.ddlCategory.SelectedValue.ToString());//商品类别号
        string strBookName=this.txtName.Text.Trim();                      //商品类别名
        string strBookDesc=this.txtShortDesc.Text.Trim();                 //商品简短描述
        string strAuthor=this.txtAuthor.Text.Trim();                      //商品作者
        string strCompany=this.txtCompany.Text.Trim();                    //商品商城
        string strBookUrl=this.ddlUrl.SelectedValue.ToString();           //商品图片存放路径
        float fltMarketPrice=float.Parse(this.txtMarketPrice.Text.Trim());//商品市场价
        float fltHotPrice=float.Parse(this.txtHotPrice.Text.Trim());      //商品热门价
        bool blrefine =Convert.ToBoolean(this.cbxCommend.Checked);        //是否推价
        bool blHot = Convert.ToBoolean(this.cbxHot.Checked);              //是否热门
        bool blDiscount = Convert.ToBoolean(this.cbxDiscount.Checked);//是否最新
        string strSql="select * from tb_BookInfo where BookName='"+strBookName+"'and Author='"+strAuthor+"'and Company='"+strCompany+"'";
        DataTable dsTable=dbObj.GetDataSetStr(strSql,"tbBI");
        if(dsTable.Rows.Count>0)
        {
              Response.Write(ccObj.MessageBox("该商品已存在！"));  
        }
        else 
        {//将商品信息插入数据库中
            string strAddSql = "Insert into tb_BookInfo(ClassID,BookName,BookIntroduce,Author,Company,BookUrl,MarketPrice,HotPrice,Isrefinement,IsHot,IsDiscount)";
            strAddSql += "values ('" + IntClassID + "','" + strBookName + "','" + strBookDesc + "','" + strAuthor + "','" + strCompany + "','" + strBookUrl + "','" + fltMarketPrice + "','" + fltHotPrice + "','" + blrefine + "','" + blHot + "','" + blDiscount + "')";
            SqlCommand myCmd = dbObj.GetCommandStr(strAddSql);
            dbObj.ExecNonQuery(myCmd);
            Response.Write(ccObj.MessageBox("添加成功！"));
        
        }
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        this.txtName.Text = "";
        this.txtAuthor.Text = "";
        this.txtCompany.Text = "";
        this.txtMarketPrice.Text = "";
        this.txtHotPrice.Text = "";
        this.txtShortDesc.Text = "";

    }

    protected void ddlUrl_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.ImageMapPhoto.ImageUrl = ddlUrl.SelectedItem.Value;
    }
}
