using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// OrderClass 的摘要说明
/// </summary>
public class OrderClass
{
    DBClass dbObj = new DBClass();
    CommonClass ccObj = new CommonClass();
	public OrderClass()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 向订单信息表添加信息
    /// </summary>
    /// <param name="fltBooksFee">商品总费用</param>
    /// <param name="fltShipFee">运输总费用</param>
    /// <param name="strShipType">运输方式</param>
    /// <param name="strName">接收人姓名</param>
    /// <param name="strPhone">接收人电话</param>
    /// <param name="cPostCode">接收人邮编</param>
    /// <param name="strAddress">接收人详细地址</param>
    /// <param name="strEmail">接收人Email</param>
    /// <returns>返回订单号</returns>
    public int AddOrder(float fltBooksFee,float fltShipFee,string strShipType,string strName,string strPhone,string strPostCode,string strAddress,string strEmail)
    {
        SqlCommand myCmd = dbObj.GetCommandProc("proc_AddOI");
        //添加参数
        SqlParameter booksFee = new SqlParameter("@BooksFee", SqlDbType.Float ,8);
        booksFee.Value = fltBooksFee;
        myCmd.Parameters.Add(booksFee);
        //添加参数
        SqlParameter shipFee = new SqlParameter("@ShipFee", SqlDbType.Float, 8);
        shipFee.Value = fltShipFee;
        myCmd.Parameters.Add(shipFee);
        //添加参数
        SqlParameter shipType = new SqlParameter("@ShipType", SqlDbType.VarChar, 50);
        shipType.Value = strShipType;
        myCmd.Parameters.Add(shipType);
        //添加参数
        SqlParameter name = new SqlParameter("@Name", SqlDbType.VarChar, 50);
        name.Value = strName;
        myCmd.Parameters.Add(name);
        //添加参数
        SqlParameter phone = new SqlParameter("@Phone", SqlDbType.VarChar, 20);
        phone.Value = strPhone;
        myCmd.Parameters.Add(phone);
        //添加参数
        SqlParameter postCode = new SqlParameter("@PostCode", SqlDbType.Char, 10);
        postCode.Value = strPostCode;
        myCmd.Parameters.Add(postCode);
        //添加参数
        SqlParameter address = new SqlParameter("@Address", SqlDbType.VarChar, 200);
        address.Value = strAddress;
        myCmd.Parameters.Add(address);
        //添加参数
        SqlParameter email = new SqlParameter("@Email", SqlDbType.VarChar, 50);
        email.Value = strEmail;
        myCmd.Parameters.Add(email);
        //添加参数
        SqlParameter orderID = myCmd.Parameters.Add("@OrderID", SqlDbType.Int, 4);
        orderID.Direction = ParameterDirection.Output;
        dbObj.ExecNonQuery(myCmd);
        return Convert.ToInt32(orderID.Value.ToString());
    }
    /// <summary>
    /// 向订单的明细表中添加信息
    /// </summary>
    /// <param name="IntBookID">商品编号</param>
    /// <param name="IntNum">数量</param>
    /// <param name="IntOrderID">订单号</param>
    /// <param name="fltTotailPrice">总价</param>
    /// <param name="strRemark">备注</param>
    public void AddDetail(int IntBookID,int IntNum,int IntOrderID,float  fltTotailPrice,string strRemark)
    {
        SqlCommand myCmd = dbObj.GetCommandProc("proc_AddODetail");
        //添加参数
        SqlParameter bookID = new SqlParameter("@BookID", SqlDbType.Int, 4);
        bookID.Value = IntBookID;
        myCmd.Parameters.Add(bookID);
        //添加参数
        SqlParameter num = new SqlParameter("@Num", SqlDbType.Int, 4);
        num.Value = IntNum;
        myCmd.Parameters.Add(num);
        //添加参数
        SqlParameter orderID = new SqlParameter("@OrderID", SqlDbType.Int, 4);
        orderID.Value = IntOrderID;
        myCmd.Parameters.Add(orderID);
        //添加参数
        SqlParameter totailPrice = new SqlParameter("@TotailPrice", SqlDbType.Float, 8);
        totailPrice.Value = fltTotailPrice;
        myCmd.Parameters.Add(totailPrice);
        //添加参数
        SqlParameter remark = new SqlParameter("@Remark", SqlDbType.VarChar,200);
        remark.Value = strRemark;
        myCmd.Parameters.Add(remark);
        dbObj.ExecNonQuery(myCmd);
  
    }
    /// <summary>
    /// 详细查询订单信息
    /// </summary>
    /// <param name="IntOrderID">订单号</param>
    /// <param name="IntNF">标志是否填写收货人的姓名</param>
    /// <param name="strName">收货人的姓名</param>
    /// <param name="IntIsConfirm">是否确认</param>
    /// <param name="IntIsSend">是否发货</param>
    /// <param name="IntIsEnd">是否归档</param>
    /// <returns>返回数据源表DataTable</returns>
    public DataTable ExactOrderSearch(int IntOrderID,int IntNF,string strName,int IntIsConfirm,int IntIsSend,int IntIsEnd)
    {
        SqlCommand myCmd = dbObj.GetCommandProc("Proc_SearchOI");
        //添加参数
        SqlParameter orderId = new SqlParameter("@OrderID", SqlDbType.Int, 4);
        orderId.Value = IntOrderID;
        myCmd.Parameters.Add(orderId);
        //添加参数
        SqlParameter nf = new SqlParameter("@NF", SqlDbType.Int, 4);
        nf.Value = IntNF;
        myCmd.Parameters.Add(nf);
        //添加参数
        SqlParameter name = new SqlParameter("@Name", SqlDbType.VarChar, 50);
        name.Value = strName;
        myCmd.Parameters.Add(name);
        //添加参数
        SqlParameter confirm = new SqlParameter("@IsConfirm", SqlDbType.Int, 4);
        confirm.Value = IntIsConfirm;
        myCmd.Parameters.Add(confirm);
        //添加参数
        SqlParameter send = new SqlParameter("@IsSend", SqlDbType.Int, 4);
        send.Value = IntIsSend;
        myCmd.Parameters.Add(send);
        //添加参数
        SqlParameter end = new SqlParameter("@IsEnd", SqlDbType.Int, 4);
        end.Value = IntIsEnd;
        myCmd.Parameters.Add(end);
        dbObj.ExecNonQuery(myCmd);
        DataTable dsTable = dbObj.GetDataSet(myCmd, "tbOI");
        return dsTable;

    }
   
}
