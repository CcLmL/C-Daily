using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Collections.Generic;

/// <summary>
/// 订单的操作类
/// </summary>
public class Order
{
    //自定义常量
    private const string SQL_INSERT_ORDER = "Declare @ID int; Declare @ERR int; INSERT INTO Orders VALUES( @Date,@UserId, @ShipAddress, @ShipZip, @ShipCountry, @BillAddress, @BillZip, @BillCountry,  @BillFirstName,@ShipFirstName,@Total); SELECT @ID=@@IDENTITY;  SELECT @ERR=@@ERROR;";
    private const string SQL_INSERT_ITEM = "INSERT INTO OrderItem VALUES( ";
    private const string SQL_SELECT_ORDER = "SELECT o.OrderDate, o.UserId, o.CardType, o.CreditCard, o.ExprDate, o.BillToName,  o.BillAddr, o.BillCode, o.BillCountry, o.ShipToName, o.ShipAddr,o.ShipCode, o.ShipCountry, o.TotalPrice, l.ItemId, l.LineNum, l.Quantity, l.UnitPrice FROM Orders as o, lineitem as l WHERE o.OrderId = @OrderId AND o.orderid = l.orderid";
    private const string PARM_USER_ID = "@UserId";
    private const string PARM_DATE = "@Date";
    private const string PARM_SHIP_ADDRESS = "@ShipAddress";
    private const string PARM_SHIP_ZIP = "@ShipZip";
    private const string PARM_SHIP_COUNTRY = "@ShipCountry";
    private const string PARM_BILL_ADDRESS = "@BillAddress";
    private const string PARM_BILL_ZIP = "@BillZip";
    private const string PARM_BILL_COUNTRY = "@BillCountry";
    private const string PARM_TOTAL = "@Total";
    private const string PARM_BILL_USER_NAME = "@BillFirstName";
    private const string PARM_SHIP_USER_NAME = "@ShipFirstName";
    private const string PARM_ORDER_ID = "@OrderId";
    private const string PARM_LINE_NUMBER = "@LineNumber";
    private const string PARM_ITEM_ID = "@ItemId";
    private const string PARM_QUANTITY = "@Quantity";
    private const string PARM_PRICE = "@Price";

    /// <summary>
    /// 保存订单到数据库
    /// </summary>
    /// <param name="order">订单信息实体</param>
    public void Insert(OrderInfo order)
    {
        StringBuilder strSQL = new StringBuilder();

        // 获取订单参数列表
        SqlParameter[] orderParms = GetOrderParameters();
        SqlCommand cmd = new SqlCommand();
        // 设置这些参数的值
        orderParms[0].Value = order.UserId;
        orderParms[1].Value = order.Date;
        orderParms[2].Value = order.ShippingAddress.Address;
        orderParms[3].Value = order.ShippingAddress.ZipCode;
        orderParms[4].Value = order.ShippingAddress.Country;
        orderParms[5].Value = order.BillingAddress.Address;
        orderParms[6].Value = order.BillingAddress.ZipCode;
        orderParms[7].Value = order.BillingAddress.Country;
        orderParms[8].Value = order.OrderTotal;
        orderParms[9].Value = order.BillingAddress.UserName;
        orderParms[10].Value = order.ShippingAddress.UserName;
        //将所有的参数添加到SqlCommand命令中
        foreach (SqlParameter parm in orderParms)
            cmd.Parameters.Add(parm);

        // 创建数据库连接
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            strSQL.Append(SQL_INSERT_ORDER);
            SqlParameter[] itemParms;
            // 遍历订单中的每一项，并实现添加
            int i = 0;
            foreach (LineItemInfo item in order.LineItems)
            {
                strSQL.Append(SQL_INSERT_ITEM).Append(" @ID").Append(", @ItemId").Append(i).Append(", @LineNumber").Append(i).Append(", @Quantity").Append(i).Append(", @Price").Append(i).Append("); SELECT @ERR=@ERR+@@ERROR;");

                //获取项目的参数
                itemParms = GetItemParameters(i);

                itemParms[0].Value = item.Line;
                itemParms[1].Value = item.ItemId;
                itemParms[2].Value = item.Quantity;
                itemParms[3].Value = item.Price;
                //绑定参数到Command命令
                foreach (SqlParameter parm in itemParms)
                    cmd.Parameters.Add(parm);
                i++;
            }
            conn.Open();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.Append("SELECT @ID, @ERR").ToString();
            using (SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
            {
                // 读取返回的错误值
                rdr.Read();
                //如果返回不是0，抛出异常
                if (rdr.GetInt32(1) != 0)
                    throw new ApplicationException("DATA INTEGRITY ERROR ON ORDER INSERT - ROLLBACK ISSUED");
            }
            //清空参数列表
            cmd.Parameters.Clear();
        }
    }

    /// <summary>
    /// 通过订单号获取数据库中的订单
    /// </summary>
    /// <param name="orderId">订单ID</param>
    /// <returns>一个订单实体信息</returns>
    public OrderInfo GetOrder(int orderId)
    {
        OrderInfo order = new OrderInfo();

        //创建一个参数并赋值
        SqlParameter parm = new SqlParameter(PARM_ORDER_ID, SqlDbType.Int);
        parm.Value = orderId;
        //执行查询语句
        using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_ORDER, parm))
        {
            if (rdr.Read())
            {
                //依次为订单中的各个信息赋值
                AddressInfo billingAddress = new AddressInfo(rdr.GetString(5), rdr.GetString(6), rdr.GetString(7), rdr.GetString(8),  null, "email");
                AddressInfo shippingAddress = new AddressInfo(rdr.GetString(9), rdr.GetString(10), rdr.GetString(11), rdr.GetString(12), null, "email");
                order = new OrderInfo(orderId, rdr.GetDateTime(0), rdr.GetString(1), null, billingAddress, shippingAddress, rdr.GetDecimal(21),  null);
                IList<LineItemInfo> lineItems = new List<LineItemInfo>();
                LineItemInfo item = null;
                do
                {
                    item = new LineItemInfo(rdr.GetInt32(13), string.Empty, rdr.GetInt32(14), rdr.GetInt32(15), rdr.GetDecimal(16));
                    lineItems.Add(item);
                } while (rdr.Read());
                order.LineItems = new LineItemInfo[lineItems.Count];
                lineItems.CopyTo(order.LineItems, 0);
            }
        }
        return order;
    }

    /// <summary>
    /// 获取订单参数
    /// </summary>
    /// <returns></returns>
    private static SqlParameter[] GetOrderParameters()
    {
        SqlParameter[] parms = SqlHelper.GetCachedParameters(SQL_INSERT_ORDER);
        if (parms == null)
        {
            parms = new SqlParameter[] {
					new SqlParameter(PARM_USER_ID, SqlDbType.NVarChar,50),
					new SqlParameter(PARM_DATE, SqlDbType.DateTime),
					new SqlParameter(PARM_SHIP_ADDRESS, SqlDbType.VarChar, 100),
					new SqlParameter(PARM_SHIP_ZIP, SqlDbType.VarChar, 20),
					new SqlParameter(PARM_SHIP_COUNTRY, SqlDbType.VarChar, 20),
					new SqlParameter(PARM_BILL_ADDRESS, SqlDbType.VarChar, 100),
					new SqlParameter(PARM_BILL_ZIP, SqlDbType.VarChar, 20),
					new SqlParameter(PARM_BILL_COUNTRY, SqlDbType.VarChar, 20),
					new SqlParameter(PARM_TOTAL, SqlDbType.Decimal, 8),
					new SqlParameter(PARM_BILL_USER_NAME, SqlDbType.VarChar, 50),
					new SqlParameter(PARM_SHIP_USER_NAME, SqlDbType.VarChar, 50)};
            SqlHelper.CacheParameters(SQL_INSERT_ORDER, parms);
        }

        return parms;
    }

    /// <summary>
    /// 获取订单中单条记录的参数
    /// </summary>
    /// <param name="i">第几行</param>
    /// <returns>参数列表</returns>
    private static SqlParameter[] GetItemParameters(int i)
    {
        SqlParameter[] parms = SqlHelper.GetCachedParameters(SQL_INSERT_ITEM + i);
        if (parms == null)
        {
            parms = new SqlParameter[] {
					new SqlParameter(PARM_LINE_NUMBER + i, SqlDbType.Int),
					new SqlParameter(PARM_ITEM_ID+i, SqlDbType.Int),
					new SqlParameter(PARM_QUANTITY+i, SqlDbType.Int),
					new SqlParameter(PARM_PRICE+i, SqlDbType.Decimal, 8)};
            SqlHelper.CacheParameters(SQL_INSERT_ITEM + i, parms);
        }
        return parms;
    }
}