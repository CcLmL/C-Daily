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

public partial class Manage_OrderPrint : System.Web.UI.Page
{
    CommonClass ccObj = new CommonClass();
    DBClass dbObj = new DBClass();
    public static OrderProperty order = new OrderProperty();
    protected void Page_Load(object sender, EventArgs e)
    {
        order = GetOrderInfo();
        if (!IsPostBack)
        {
            rpBind();
        }
    }
  
    public void rpBind()
    {
        string strSql = "select b.BookID,BookName,Num,HotPrice,TotailPrice,Remark ";
        strSql += "from tb_Detail d,tb_BookInfo b where d.BookID=b.BookID and OrderID=" + Convert.ToInt32(Request["OrderID"].Trim());
        DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbDI");
        this.rptOrderItems.DataSource = dsTable.DefaultView;
        this.rptOrderItems.DataBind();
    }
    public string GetStatus(int IntOrderID)
    {
        string strSql = "select (case IsConfirm when '0' then '未确认' when '1' then '已确认' end ) as IsConfirm";
        strSql += ",(case IsSend when '0' then '未发货' when '1' then '已发货' end ) as IsSend";
        strSql += ",(case IsEnd when '0' then '未归档' when '1' then '已归档' end ) as IsEnd ";
        strSql += "  from tb_OrderInfo where OrderID=" + IntOrderID;
        DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbOI");
        return (dsTable.Rows[0][0].ToString() + "|" + dsTable.Rows[0][1].ToString() + "<Br>" + dsTable.Rows[0][2].ToString());
    }
    //绑定商品热门价
    public string GetHotPrice(string strHotPrice)
    {
        return ccObj.VarStr(strHotPrice, 2);
    }
    //绑定商品总费用
    public string GetTotailPrice(string strTotailPrice)
    {
        return ccObj.VarStr(strTotailPrice, 2);
    }
    /// <summary>
    /// 获取指定订单信息
    /// </summary>
    /// <returns>返回OrderProperty类的实例对像</returns>
    public OrderProperty GetOrderInfo()
    {
        string strSql = "select * from tb_OrderInfo where OrderID=" + Convert.ToInt32(Request["OrderID"].Trim());
        DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbOI");
        order.OrderNo = Convert.ToInt32(Request["OrderID"].Trim());
        order.OrderTime = Convert.ToDateTime(dsTable.Rows[0]["OrderDate"].ToString());
        order.ProductPrice = float.Parse(dsTable.Rows[0]["BooksFee"].ToString());
        order.ShipPrice = float.Parse(dsTable.Rows[0]["ShipFee"].ToString());
        order.TotalPrice = float.Parse(dsTable.Rows[0]["TotalPrice"].ToString());
        order.ShipType = dsTable.Rows[0]["ShipType"].ToString();
        order.ReceiverAddress = dsTable.Rows[0]["ReceiverAddress"].ToString();
        order.ReceiverEmail = dsTable.Rows[0]["ReceiverEmail"].ToString();
        order.ReceiverName = dsTable.Rows[0]["ReceiverName"].ToString();
        order.ReceiverPhone = dsTable.Rows[0]["ReceiverPhone"].ToString();
        order.ReceiverPostcode = dsTable.Rows[0]["ReceiverPostcode"].ToString();
        order.ShipType = dsTable.Rows[0]["ShipType"].ToString();
        return (order);
    }
}
