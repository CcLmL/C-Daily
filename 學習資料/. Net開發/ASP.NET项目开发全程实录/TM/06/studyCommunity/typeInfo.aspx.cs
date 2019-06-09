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

public partial class typeInfo : System.Web.UI.Page
{
    dataOperate mydo = new dataOperate();

    protected void Page_Load(object sender, EventArgs e)
    {
        
        videoP();
        soundP();
    }
    
 
    //视频排行榜
    public void videoP()
    {
        string sql = "SELECT top 5 * from (select *  from tb_Video as a inner join tb_Type as b on a.VideoType=b.TypeID  order by [ClickSum] desc )";
        gvVideoP.DataSource = mydo.rows(sql, "tb_Video").DefaultView;
        gvVideoP.DataBind();

    }
    //语音排行榜
    public void soundP()
    {
        string sql = "select top 5 * from(select * from tb_sound as a inner join tb_Type as b on a.SoundType=b.TypeID order by [ClickSum] desc)";
        gvSoundP.DataSource = mydo.rows(sql, "tb_Sound").DefaultView;
        gvSoundP.DataBind();
    }

    protected void lbtNET_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Type"].ToString() == "VideoList")
        {
            Response.Redirect("VideoList.aspx?TypeID=1");
        }
        {
            Response.Redirect("soundList.aspx?TypeID=1");
        }
    }
    protected void lbtASP_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Type"].ToString() == "VideoList")
        {
            Response.Redirect("VideoList.aspx?TypeID=2");
        }
        {
            Response.Redirect("soundList.aspx?TypeID=2");
        }
    }
    protected void lbtJSP_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Type"].ToString() == "VideoList")
        {
            Response.Redirect("VideoList.aspx?TypeID=3");
        }
        {
            Response.Redirect("soundList.aspx?TypeID=3");
        }
    }
    protected void lbtVB_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Type"].ToString() == "VideoList")
        {
            Response.Redirect("VideoList.aspx?TypeID=4");
        }
        {
            Response.Redirect("soundList.aspx?TypeID=4");
        }
    }
    protected void lbtVC_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Type"].ToString() == "VideoList")
        {
            Response.Redirect("VideoList.aspx?TypeID=5");
        }
        {
            Response.Redirect("soundList.aspx?TypeID=5");
        }
    }
    protected void lbtDELPHI_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Type"].ToString() == "VideoList")
        {
            Response.Redirect("VideoList.aspx?TypeID=6");
        }
        {
            Response.Redirect("soundList.aspx?TypeID=6");
        }
    }
}
