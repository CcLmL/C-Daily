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

public partial class Manage_Member : System.Web.UI.Page
{
    CommonClass ccObj = new CommonClass();
    DBClass dbObj = new DBClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gvAdminBind();
        }
    }
    public void gvAdminBind()
    {
        string sqlStr = "select * from tb_Admin";
        DataTable dsTable = dbObj.GetDataSetStr(sqlStr, "tbAdmin");
        this.gvAdminList.DataSource = dsTable.DefaultView;
        this.gvAdminList.DataKeyNames =new string[]{"AdminID"};
        this.gvAdminList.DataBind();
    }
    protected void gvAdminList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvAdminList.PageIndex = e.NewPageIndex;
        gvAdminBind();
    }
    protected void gvAdminList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int IntID = Convert.ToInt32(gvAdminList.DataKeys[e.RowIndex].Value.ToString());
        string strSql = "select count(*) from tb_OrderInfo where AdminID=" + IntID;
        SqlCommand myCmd = dbObj.GetCommandStr(strSql);
        if (Convert.ToInt32(dbObj.ExecScalar(myCmd)) != 0)
        {
            Response.Write(ccObj.MessageBox("该用户名正被使用，无法删除！"));
            return;
        }
        else
        {
            string sqlDelStr = "delete from tb_Admin where AdminID=" +IntID;
            SqlCommand myDelCmd = dbObj.GetCommandStr(sqlDelStr);
            dbObj.ExecNonQuery(myDelCmd);
            gvAdminBind();

        }
       
    }
}
