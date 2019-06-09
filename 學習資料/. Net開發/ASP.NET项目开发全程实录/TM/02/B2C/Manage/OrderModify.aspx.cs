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

public partial class Manger_OrderModify : System.Web.UI.Page
{
    CommonClass ccObj = new CommonClass();
    DBClass dbObj = new DBClass();
    public static OrderProperty  order = new OrderProperty();
    protected void Page_Load(object sender, EventArgs e)
    {
        order = GetOrderInfo();//为OrderProperty类对象赋值
        if (!IsPostBack)
        {
            ModifyBind();//显示订单状态
            rpBind();//显示订单中商品的详细信息
        } 
    }
    /// <summary>
    /// 绑定定订状态
    /// </summary>
    public void ModifyBind()
    {
        string strSql = "select IsConfirm,IsSend,IsEnd from tb_OrderInfo where OrderID=" + Convert.ToInt32(Request["OrderID"].Trim());
        DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbOI");
        this.chkConfirm.Checked = Convert.ToBoolean(dsTable.Rows[0][0].ToString());    //是否被确认
        this.chkConsignment.Checked = Convert.ToBoolean(dsTable.Rows[0][1].ToString());//是否已发货
        this.chkPigeonhole.Checked = Convert.ToBoolean(dsTable.Rows[0][2].ToString()); //是否已归档
        //对复选框按钮的隐藏，订单状态的顺序为（确认，发货，归档）
        if (this.chkConfirm.Checked == false)
        {
            this.chkConsignment.Visible = false;//发货复选框按钮隐藏
            this.chkPigeonhole.Visible = false;//归档复选框按钮隐藏
        }
        else
        {
            if (this.chkConsignment.Checked == false)
            {
                this.chkConfirm.Enabled = false;  //确认复选框按钮不可用
                this.chkPigeonhole.Visible = false;//归档复选框按钮隐藏
            }
            else
            {
                if (this.chkPigeonhole.Checked == false)
                {
                    this.chkConfirm.Enabled = false;//确认复选框按钮不可用
                    this.chkConsignment.Enabled = false;//归档复选框按钮不可用
                }
                else
                {
                    this.btnSave.Visible = false;//修改按钮不可见
                
                }
            }
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
    public string GetStatus(int IntOrderID)
    {  
        string strSql = "select (case IsConfirm when '0' then '未确认' when '1' then '已确认' end ) as IsConfirm";
        strSql += ",(case IsSend when '0' then '未发货' when '1' then '已发货' end ) as IsSend";
        strSql += ",(case IsEnd when '0' then '未归档' when '1' then '已归档' end ) as IsEnd ";
        strSql += " from tb_OrderInfo where OrderID=" + IntOrderID;
        DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbOI");
        return (dsTable.Rows[0][0].ToString() + "|" + dsTable.Rows[0][1].ToString() + "|" + dsTable.Rows[0][2].ToString());
    }

    /// <summary>
    /// 为OrderProperty类中的订单信息赋值
    /// </summary>
    /// <returns>返回OrderProperty类的实例对像</returns>
    public OrderProperty GetOrderInfo()
    {
        string strSql = "select * from tb_OrderInfo where OrderID="+Convert.ToInt32(Request["OrderID"].Trim());
        DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbOI");
        order.OrderNo = Convert.ToInt32(Request["OrderID"].Trim());                   //订单编号
        order.OrderTime = Convert.ToDateTime(dsTable.Rows[0]["OrderDate"].ToString());//下单时间
        order.ProductPrice = float.Parse(dsTable.Rows[0]["BooksFee"].ToString());     //商品总金额
        order.ShipPrice = float.Parse(dsTable.Rows[0]["ShipFee"].ToString());         //商品运费
        order.TotalPrice = float.Parse(dsTable.Rows[0]["TotalPrice"].ToString());     //订单总金额
        order.ShipType = dsTable.Rows[0]["ShipType"].ToString();                      //运输类型
        order.ReceiverAddress = dsTable.Rows[0]["ReceiverAddress"].ToString();        //购货人地址
        order.ReceiverEmail = dsTable.Rows[0]["ReceiverEmail"].ToString();            //Email地址
        order.ReceiverName = dsTable.Rows[0]["ReceiverName"].ToString();              //收货人姓名
        order.ReceiverPhone = dsTable.Rows[0]["ReceiverPhone"].ToString();            //联系人电话
        order.ReceiverPostcode = dsTable.Rows[0]["ReceiverPostcode"].ToString();      //邮政编码
        order.ShipType = dsTable.Rows[0]["ShipType"].ToString();
        return (order);
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool blConfirm = Convert.ToBoolean(this.chkConfirm.Checked); //是否被确认
        bool blSend = Convert.ToBoolean(this.chkConsignment.Checked);//是否已发货
        bool blEnd = Convert.ToBoolean(this.chkPigeonhole.Checked);  //是否已归档
        int IntAdminID = Convert.ToInt32(Session["AID"].ToString()); //根单员ID代号
        //修改订单表中订单状态
        string strSql = "update tb_OrderInfo ";
        strSql += "  set IsConfirm='" + blConfirm + "',IsSend='" + blSend + "',IsEnd='" + blEnd + "',AdminID='" + IntAdminID + "',ConfirmTime='" + DateTime.Now + "'";
        strSql += "where OrderID=" + Convert.ToInt32(Request["OrderID"].Trim());
        SqlCommand myCmd = dbObj.GetCommandStr(strSql);
        dbObj.ExecNonQuery(myCmd);
        Response.Write(ccObj.MessageBox("修改成功！", "main.aspx"));
    }
    
}
