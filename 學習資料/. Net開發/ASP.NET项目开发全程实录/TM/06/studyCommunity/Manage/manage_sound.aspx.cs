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

public partial class Manage_manage_sound : System.Web.UI.Page
{
    dataOperate mydo = new dataOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        createSound();
    }

     protected void createSound()
    {
        
        string sql = "select * from tb_Sound order by SoundID DESC";
        grvSound.DataSource = mydo.rows(sql, "tb_Sound");
        grvSound.DataKeyNames = new string[] { "SoundID" };
        grvSound.DataBind();

    }

    protected void grvVideo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvSound.PageIndex = e.NewPageIndex;
        grvSound.DataBind();
    }

    protected void grvVideo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string sql = "delete from tb_Sound where SoundID=" + grvSound.DataKeys[e.RowIndex].Value.ToString();
        if (mydo.adlData(sql))
        {
	    string ssql = "delete from tb_Speak where TutorialType='Sound' and TutorialID=" + grvSound.DataKeys[e.RowIndex].Value.ToString();
            mydo.adlData(ssql);
            Page.RegisterStartupScript("true", "<script>alert('删除成功！')</script>");
        }
        else
        {
            Page.RegisterStartupScript("false", "<script>alert('删除失败！')</script>");
        }
        createSound();
    }
}
