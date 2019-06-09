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

public partial class BaseInfo_BaseNoticeList : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null)
        {
            Response.Write("<script>this.parent.location.href='../Default.aspx'</script>");
            return;
        }
        if (!IsPostBack)
        {
            DataList1.DataSource = bc.GetDataSet("select * from tb_notice order by noticeid desc", "tb_notice");
            DataList1.DataKeyField = "noticeID";
            DataList1.DataBind();
        }
        if (Session["loginName"].ToString().ToLower() != "tsoft")
            ((ImageButton)DataList1.Items[0].FindControl("ImageButton1")).Visible=false;
    }
    protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        int str = (int)DataList1.DataKeys[e.Item.ItemIndex];
        bool bl;
        bl = bc.ExecSQL("delete from tb_notice where noticeid='" + str + "'");
        Response.Write(bc.MessageBox("删除成功！"));
        DataList1.DataSource = bc.GetDataSet("select * from tb_notice order by noticeid desc", "tb_notice");
        DataList1.DataKeyField = "noticeID";
        DataList1.DataBind();
    }
}
