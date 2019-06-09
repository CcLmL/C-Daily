using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;

public partial class _Default : System.Web.UI.Page
{
    dataOperate mydo = new dataOperate();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserName"] != null)
        {
            PanelEntry.Visible = false;
            PanelHello.Visible = true;
            this.Label1.Text = Session["UserName"].ToString();
        }
        else
        {
            PanelHello.Visible = false;
            PanelEntry.Visible = true;
        }     
        cretVideo();
        creatSound();
    }

    

    //最新视频
    protected void cretVideo()
    {
        try
        {
            string sql = "SELECT top 10 * from tb_Video as a inner join tb_Type as b on a.VideoType=b.TypeID  ORDER BY VideoID DESC";
            gvNewVideo.DataSource = mydo.rows(sql, "tb_Video").DefaultView;
            gvNewVideo.DataBind();
        }
        catch (Exception error)
        {
            Response.Redirect(error.Message.ToString());

        }
    }
    //最新语音
    protected void creatSound()
    {
        try
        {
            string sql = "select top 10 * from tb_sound as a inner join tb_Type as b on a.SoundType=b.TypeID order by SoundID DESC";
            gvNewSound.DataSource = mydo.rows(sql, "tb_sound").DefaultView;
            gvNewSound.DataBind();

        }
        catch (Exception error)
        {
            Response.Write(error.ToString());
            Response.Write("<script language=javascript>alert('数据库失败！')</script>");
        }
    }
 
   

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["UserName"] = null;

        PanelHello.Visible = false;
        PanelEntry.Visible = true;
    }
}
