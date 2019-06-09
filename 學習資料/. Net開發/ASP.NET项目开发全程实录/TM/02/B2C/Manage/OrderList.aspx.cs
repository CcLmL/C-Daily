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

public partial class Manage_OrderList : System.Web.UI.Page
{
    CommonClass ccObj = new CommonClass();
    DBClass dbObj = new DBClass();
    OrderClass ocObj = new OrderClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            /*判断是否登录*/
            ST_check_Login();
            //判断是否已点击“搜索”按钮
            ViewState["search"] = null;
            pageBind(); //绑定订单信息
        }
    }
    public void ST_check_Login()
    {

        if ((Session["AName"] == null))
        {
            Response.Write("<script>alert('对不起！您不是管理员，无权限浏览此页！');location='../Default.aspx'</script>");
            Response.End();
        }
    }
    //绑定货品总额
    public string GetVarGF(string strGoodsFee)
    {
        return ccObj.VarStr(strGoodsFee, 2);
    }
    //绑定运费
    public string GetVarSF(string strShipFee)
    {
        return ccObj.VarStr(strShipFee,2);
    }
    //绑定总金额
    public string GetVarTP(string strTotalPrice)
    {
        return ccObj.VarStr(strTotalPrice,2);
    }
    public string GetStatus(int IntOrderID)
    {
        string strSql = "select (case IsConfirm when '0' then '未确认' when '1' then '已确认' end ) as IsConfirm";
        strSql +=",(case IsSend when '0' then '未发货' when '1' then '已发货' end ) as IsSend";
        strSql +=",(case IsEnd when '0' then '未归档' when '1' then '已归档' end ) as IsEnd ";
        strSql +="  from tb_OrderInfo where OrderID="+IntOrderID;
        DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbOI");
        return (dsTable.Rows[0][0].ToString() + "|" + dsTable.Rows[0][1].ToString() + "<Br>" + dsTable.Rows[0][2].ToString());
    }
    public string GetAdminName(int IntOrderID)
    {
        string strSql = "select AdminName from tb_Admin ";
        strSql += "where AdminID=(select AdminID from tb_OrderInfo";
        strSql += " where OrderID='"+IntOrderID+"')";
        SqlCommand myCmd=dbObj.GetCommandStr(strSql);
        string strAdminName=(dbObj.ExecScalar(myCmd).ToString());
        if(strAdminName =="")
        {
            return "无";
        }
        else 
        {
            return strAdminName;
        }
    }
    /// <summary>
    /// 获取指定订单的信息
    /// </summary>
    string strSql;
    public void pageBind()
    {
        strSql ="select * from tb_OrderInfo where ";
        //获取Request["OrderList"]对象的值，确定查询条件
        string strOL=Request["OrderList"].Trim();
        switch (strOL)
        {
            case "00"://表示未确定
                strSql +="IsConfirm=0";
                break;
            case "01"://表示已确定
                 strSql +="IsConfirm=1";
                break;
            case "10": //表示未发货
                 strSql +="IsSend=0";
                break;
            case "11"://表示已发货
                 strSql +="IsSend=1";
                break;
            case "20": //表示收货人未验收货物
                 strSql +="IsEnd=0";
                break;
            case "21": //表示收货人已验收货物
                 strSql +="IsEnd=1";
                break;
            default :
                break;
        }
        strSql +="  order by OrderDate Desc";
        //获取查询信息，并将其绑定到GridView控件中
        DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbOI");
        this.gvOrderList.DataSource = dsTable.DefaultView;
        this.gvOrderList.DataKeyNames = new string[] { "OrderID"};
        this.gvOrderList.DataBind();
    }
    /// <summary>
    /// 获取符合条件的订单信息
    /// </summary>
    public void gvSearchBind()
    {
        int IntOrderID = 0; //输入订单号
        int IntNF=0;        //判断是否输入收货人
        string strName="";  //输入收货人名
        int IntIsConfirm=0 ;//是否确认
        int IntIsSend=0 ;   //是否发货
        int IntIsEnd =0;    //是否归档
        if (this.txtKeyword.Text == "" && this.txtName.Text == "" && this.ddlConfirmed.SelectedIndex == 0 && this.ddlFinished.SelectedIndex == 0 && this.ddlShipped.SelectedIndex == 0)
        {
            pageBind();
        }
        else
        {  
            if (this.txtKeyword.Text != "")
            {
                IntOrderID = Convert.ToInt32(this.txtKeyword.Text.Trim());
            }
            if (this.txtName.Text != "")
            {
                IntNF = 1;
                strName = this.txtName.Text.Trim();
            }
            IntIsConfirm = this.ddlConfirmed.SelectedIndex;
            IntIsSend = this.ddlShipped.SelectedIndex;
            IntIsEnd =this.ddlFinished.SelectedIndex; 
            DataTable dsTable = ocObj.ExactOrderSearch(IntOrderID, IntNF, strName, IntIsConfirm, IntIsSend, IntIsEnd);
            this.gvOrderList.DataSource = dsTable.DefaultView;
            this.gvOrderList.DataKeyNames = new string[] { "OrderID"};
            this.gvOrderList.DataBind();
        }
    }

    protected void gvOrderList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvOrderList.PageIndex = e.NewPageIndex;
        if (ViewState["search"] == null)
        {
            pageBind();//绑定所有订单信息
        }
        else
        {
            gvSearchBind();//绑定查询后的订单信息
        
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //将ViewState["search"]对象值1
        ViewState["search"] = 1;
        gvSearchBind();//绑定查询后的订单信息
    }
    protected void gvOrderList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string strSql = "select * from tb_OrderInfo where ( IsConfirm=0 or IsEnd=1 ) and OrderID=" + Convert.ToInt32(gvOrderList.DataKeys[e.RowIndex].Value);
        //判断该订单是否已被确认或归档，如果已被确认但未归档，不能删除该订单
        if (dbObj.GetDataSetStr(strSql, "tbOrderInfo").Rows.Count > 0)
        {
            //删除订单表中的信息
            string strDelSql = "delete from tb_OrderInfo where OrderId=" + Convert.ToInt32(gvOrderList.DataKeys[e.RowIndex].Value);
            SqlCommand myCmd = dbObj.GetCommandStr(strDelSql);
            dbObj.ExecNonQuery(myCmd);
            //删除订单详细表中的信息
            string strDetailSql = "delete from tb_Detail where OrderId=" + Convert.ToInt32(gvOrderList.DataKeys[e.RowIndex].Value);
            SqlCommand myDCmd = dbObj.GetCommandStr(strDetailSql);
            dbObj.ExecNonQuery(myDCmd);
        }
        else
        {
            Response.Write(ccObj.MessageBox("该订单还未归档，无法删除！"));
            return;        
        }
        //重新绑定
        if (ViewState["search"] == null)
        {
            pageBind();
        }
        else
        {
            gvSearchBind();

        }
    }
}
