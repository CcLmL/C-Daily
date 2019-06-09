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
using System.Data.OleDb;
using System.IO;

public partial class seeSound : System.Web.UI.Page
{   
    public string SUrl;
    public string SoundTitle;
    public string Content;
    public string Name;
    public string FBDate;
    public string ClickSum;
    dataOperate mydo = new dataOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
         if (!IsPostBack)
                {
                    this.Image1.ImageUrl = "ValidateCode.aspx";
                    addClickSum();
                    seekSpeak();
                }
                PlaySound();
    }
   //添加点击率
    public void addClickSum()
    {
        try
        {
            string sql = "update tb_Sound set ClickSum=ClickSum+1 where SoundID=" + Request.QueryString["SoundID"];

            mydo.updateData(sql);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
    }
    //播放语音
    protected void PlaySound()
    {
        try
        {
            string sql = "select * from tb_Sound where SoundID=" + Convert.ToInt32(Request.QueryString["SoundID"]);
            OleDbDataReader odr = mydo.row(sql);
            odr.Read();
            SUrl = "Sound" + "\\" + odr["SoundUrl"].ToString(); 
            if (!File.Exists(Server.MapPath(".") + "\\" + SUrl))
            {
                Page.RegisterStartupScript("true", "<script>alert('文件不存在！请返回！');location='index.aspx'</script>");
            }
            SoundTitle = odr["SoundName"].ToString();
            Content = odr["SoundContent"].ToString();
            Name = odr["Name"].ToString();
            FBDate = odr["FBDate"].ToString();
            ClickSum = odr["ClickSum"].ToString();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
    }
    //查看留言
    protected void seekSpeak()
    {
        int noncePage =Convert.ToInt32(this.labPage.Text);
        PagedDataSource ps = new PagedDataSource();

        string selectSql = "select * from tb_Speak  where [TutorialID]=" + Request.QueryString["SoundID"] + " and [TutorialType]='Sound' ORDER BY SpeakID DESC ";
        ps.DataSource = mydo.rows(selectSql, "tb_Speak").DefaultView;
        ps.AllowPaging = true;
        ps.PageSize = 15;
        ps.CurrentPageIndex = noncePage - 1;
        this.lnkbtnFront.Enabled = true;
        this.lnkbtnNext.Enabled = true;
        this.lnkbtnLast.Enabled = true;
        this.lnkbtnFirst.Enabled = true;
        if (noncePage == 1) //等于第一页
        {
            this.lnkbtnFirst.Enabled = false;//不显示第一页按钮
            this.lnkbtnFront.Enabled = false;//不显示上一页按钮
        }
        if (noncePage == ps.PageCount) //等于最后一页
        {
            this.lnkbtnNext.Enabled = false;//不显示下一页
            this.lnkbtnLast.Enabled = false;//不显示最后一页
        }
        this.labBackPage.Text = Convert.ToString(ps.PageCount);
        this.dlSpeak.DataSource = ps;
        //设置数据源的关键字段
        this.dlSpeak.DataKeyField = "SpeakID";
        dlSpeak.DataBind();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {

        this.Image1.ImageUrl = "ValidateCode.aspx";

    }

    //发言
    protected void Button3_Click(object sender, EventArgs e)
    {
        string spokesman;
        if (Session["UserName"] != null)
        {
            spokesman = Session["UserName"].ToString();
        }
        else
        {
            spokesman = "游客";
        }
        string speakContent = this.txtCont.Text;
        string tutorialType = "Sound";
        string tutorialID = Request.QueryString["SoundID"];
        string insertSql = "insert into tb_Speak([Spokesman],[TutorialType],[TutorialID],[SpeakContent]) values('" + spokesman + "','" + tutorialType + "'," + tutorialID + ",'" + speakContent + "')";
        if (Session["CheckCode"].ToString().Equals(this.txtYzm.Text.ToString()))
        {
            bool bo = mydo.adlData(insertSql);
            if (bo)
            {
                seekSpeak();
                Page.RegisterStartupScript("true", "<script>alert('发言成功！');</script>");

            }
            else
            {
                Page.RegisterStartupScript("false", "<script>alert('发言失败！')</script>");
            }
        }
        else
        {
            Page.RegisterStartupScript("false", "<script>alert('验证码错误')</script>");
        }

    }
    protected void lnkbtnFirst_Click(object sender, EventArgs e)
    {
        this.labPage.Text = "1";
        this.seekSpeak();
    }
    protected void lnkbtnFront_Click(object sender, EventArgs e)
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(labPage.Text) - 1);
        this.seekSpeak();
    }
    protected void lnkbtnNext_Click(object sender, EventArgs e)
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(labPage.Text) - 1);
        this.seekSpeak();
    }
    protected void lnkbtnLast_Click(object sender, EventArgs e)
    {
        this.labPage.Text = this.labBackPage.Text;
        this.seekSpeak();
    }
    protected void btnDown_Click(object sender, EventArgs e)
    {
	if(Session["UserName"] != null)
	{
        string path = Server.MapPath(".\\") + SUrl;
        //初始化 FileInfo 类的实例，它作为文件路径的包装
        FileInfo fi = new FileInfo(path);
        Response.Write(path);
        //   判断文件是否存在
        if (fi.Exists)
        {
            // 将文件保存到本机上
            Response.Clear();
            Response.AddHeader("Content-Disposition", "attachment; filename=" + Server.UrlEncode(fi.Name));
            Response.AddHeader("Content-Length", fi.Length.ToString());
            Response.ContentType = "application/octet-stream";
            Response.Filter.Close();
            Response.WriteFile(fi.FullName);
            Response.End();
        }
	}
	else
	{
	  RegisterStartupScript("null", "<script>alert('您还未登录不能下载')</script>");
	}
    }
   
}
