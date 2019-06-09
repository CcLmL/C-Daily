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

public partial class Manage_manageBulletin : System.Web.UI.Page
{
    dataOperate mydo = new dataOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
            createBulletin();
       
    }

    protected void createBulletin()
    {
        string sql = "select * from tb_Bulletin order by ID DESC";
        grvBulletin.DataSource = mydo.rows(sql, "tb_Bulletin");
        grvBulletin.DataKeyNames = new string[] { "ID" };
        grvBulletin.DataBind();

    }
  
  
    protected void grvBulletin_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvBulletin.PageIndex = e.NewPageIndex;
        grvBulletin.DataBind();
    }
    protected void grvBulletin_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string sql = "delete from tb_Bulletin where ID=" + grvBulletin.DataKeys[e.RowIndex].Value.ToString();
        if (mydo.adlData(sql))
        {
            Page.RegisterStartupScript("true", "<script>alert('删除成功！')</script>");
        }
        else
        {
            Page.RegisterStartupScript("false", "<script>alert('删除失败！')</script>");
        }
        createBulletin();
    }
}
