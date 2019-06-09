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

public partial class Manage_manage_video : System.Web.UI.Page
{
    dataOperate mydo = new dataOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        createVideo();
    }

    protected void createVideo()
    {
        
        string sql = "select * from tb_Video order by VideoID DESC";
        grvVideo.DataSource = mydo.rows(sql, "tb_Video");
        grvVideo.DataKeyNames = new string[] { "VideoID" };
        grvVideo.DataBind();

    }

    protected void grvVideo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvVideo.PageIndex = e.NewPageIndex;
        grvVideo.DataBind();
    }

    protected void grvVideo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string vsql = "delete from tb_Video where VideoID=" + grvVideo.DataKeys[e.RowIndex].Value.ToString();
        bool delVideo=mydo.adlData(vsql);
        
        if (delVideo)
        {  
	    string ssql = "delete from tb_Speak where TutorialType='Video' and TutorialID=" + grvVideo.DataKeys[e.RowIndex].Value.ToString();
            mydo.adlData(ssql);
            Page.RegisterStartupScript("true", "<script>alert('删除成功！')</script>");
        }
        else
        {
            Page.RegisterStartupScript("false", "<script>alert('删除失败！')</script>");
        }
        createVideo();
    }
}
