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

public partial class Manger_Product : System.Web.UI.Page
{
    CommonClass ccObj = new CommonClass();
    DBClass dbObj = new DBClass();
    GoodsClass gcObj = new GoodsClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //判断是否已点击“搜索”按钮
            ViewState["search"] = null; 
           gvBind();//显示商品信息
       }
    }
    //通过商品类别号，获取商品名
    public string GetClassName(int IntClassID)
    {
        string strClassName = gcObj.GetClass(IntClassID);
        return strClassName;
    }
    public String GetVarStr(string strHotPrice)
    {
        return ccObj.VarStr(strHotPrice, 2);
    }
    /// <summary>
    /// 绑定所有商品的信息
    /// </summary>
    public void gvBind()
    {
        string strSql = "select * from tb_BookInfo";
        //调用公共类中的GetDataSetStr方法执行SQL语句，返回数据源的数据表
        DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbBI");
        this.gvGoodsInfo.DataSource = dsTable.DefaultView;
        this.gvGoodsInfo.DataKeyNames = new string[] { "BookID"};
        this.gvGoodsInfo.DataBind();
    }
    /// <summary>
    /// 在搜索中绑定商品信息
    /// </summary>
    public void gvSearchBind()
    {
        DataTable dsTable = gcObj.search(this.txtKey.Text.Trim());
        this.gvGoodsInfo.DataSource = dsTable.DefaultView;
        this.gvGoodsInfo.DataKeyNames = new string[] { "BookID" };
        this.gvGoodsInfo.DataBind();
    }

    protected void gvGoodsInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvGoodsInfo.PageIndex = e.NewPageIndex;
        if (ViewState["search"] != null)
        {
            gvSearchBind();//绑定查询后的商品信息
        }
        else
        {
            gvBind();//绑定所有商品信息
        }
    }

    protected void gvGoodsInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int IntBookID = Convert.ToInt32(gvGoodsInfo.DataKeys[e.RowIndex].Value); //获取商品代号
        string strSql = "select count(*) from tb_Detail where BookID=" + IntBookID;
        SqlCommand myCmd = dbObj.GetCommandStr(strSql);
        //判断商品是否能被删除（如：在明细订单中，包含该商品的ID代号）
        if (Convert.ToInt32(dbObj.ExecScalar(myCmd)) > 0)
        {
            Response.Write(ccObj.MessageBox("该商品正被使用，无法删除！"));
        }
        else
        {
            //删除指定的商品信息
            string strDelSql = "delete from tb_BookInfo where BookID=" + IntBookID;
            SqlCommand myDelCmd = dbObj.GetCommandStr(strDelSql);
            dbObj.ExecNonQuery(myDelCmd);
            //对商品进行重新绑定
            if (ViewState["search"] != null)
            {
                gvSearchBind();//绑定查询后的商品信息
            }
            else
            {
                gvBind();//绑定所有商品信息
            }

        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //将ViewState["search"]对象值1
        ViewState["search"] = 1;
        gvSearchBind();//绑定查询后的商品信息
    }
}
