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

public partial class Manage_Main : System.Web.UI.Page
{
    CommonClass ccObj = new CommonClass();
    DBClass dbObj = new DBClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gvNewOBind();  
        }
    }
    public void gvNewOBind()
    {
        string strSql = "select OrderID,OrderDate,Round(TotalPrice,2)as TotalPrice from tb_OrderInfo where DATEDIFF(day, OrderDate, getdate()) < 1";
        DataTable dsTable=dbObj.GetDataSetStr(strSql, "tbOI");
        this.gvOrderList.DataSource = dsTable.DefaultView;
        this.gvOrderList.DataKeyNames = new string[] { "OrderID"};
        this.gvOrderList.DataBind(); 
    }
    protected void gvOrderList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvOrderList.PageIndex = e.NewPageIndex;
        gvNewOBind();

    }
}
