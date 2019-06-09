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

public partial class seeVideo : System.Web.UI.Page
{
    public string VUrl;                     //存储视频路径    
    public string VideoTitle;               //存储视频名称   
    public string Content;                 //存储视频内容简介
    public string Name;                    //存储发布人
    public string FBDate;                  //存储发布时间
    public string ClickSum;                //存储点击率
    dataOperate mydo = new dataOperate();  //创建数据库操作类对象
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.Image1.ImageUrl = "ValidateCode.aspx";
            addClickSum();
            seekSpeak();
        }
        seeVi();
    }
    //添加点击率
    public void addClickSum()
    {
        try
        {
            string sql = "update tb_Video set [ClickSum]=[ClickSum]+1 where [VideoID]=" + Request.QueryString["VideoID"].ToString();
            mydo.updateData(sql);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
    }
    //观看视频
    protected void seeVi()
    {
        try
        {
            string sql = "select * from tb_Video where VideoID=" + Convert.ToInt32(Request.QueryString["VideoID"]);
            OleDbDataReader odr = mydo.row(sql);//调用数据库操作类中的row方法          
            odr.Read();          //前进一条记录
            VUrl = "Video" + "\\" + odr["VideoUrl"].ToString();   //存储视频教程的路径
            if (!File.Exists(Server.MapPath(".") + "\\" + VUrl))//判断此教程是否存在
            {
                string dlsql = "delete from tb_Video where VideoID=" + Convert.ToInt32(Request.QueryString["VideoID"]);
                mydo.adlData(dlsql);
                Page.RegisterStartupScript("true", "<script>alert('文件不存在！请返回！');location='index.aspx'</script>");
            }
            VideoTitle = odr["VideoName"].ToString();
            Content = odr["VideoContent"].ToString();
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
        int noncePage = Convert.ToInt32(this.labPage.Text);                      //存储当前页
        PagedDataSource ps = new PagedDataSource();                              //生成PagedDataSource的实例

        string selectSql = "select * from tb_Speak  where [TutorialID]=" + Request.QueryString["VideoID"] + " and [TutorialType]='Video' ORDER BY SpeakID DESC ";
        ps.DataSource = mydo.rows(selectSql, "tb_Speak").DefaultView;           //获取数据源
        ps.AllowPaging = true;                                                  //启用分页
        ps.PageSize = 15;                                                       //当前页显示15条记录                                    
        ps.CurrentPageIndex = noncePage - 1;                                    //设置当前页的索引
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
        this.labBackPage.Text = Convert.ToString(ps.PageCount);                 //显示总页数
        this.dlSpeak.DataSource = ps;
        dlSpeak.DataKeyField = "SpeakID";                                       //设置数据源的关键字段
        dlSpeak.DataBind();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {

        this.Image1.ImageUrl = "ValidateCode.aspx";

    }

  
    protected void lnkbtnFirst_Click(object sender, EventArgs e)//首页
    {
        this.labPage.Text = "1";        //设置当前页为１
        this.seekSpeak();
    }
    protected void lnkbtnFront_Click(object sender, EventArgs e)//上一页
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) - 1); //设置当前页减１
        this.seekSpeak();
    }
    protected void lnkbtnNext_Click(object sender, EventArgs e) //下一页
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) + 1);  //设置当前页加１
        this.seekSpeak();
    }
    protected void lnkbtnLast_Click(object sender, EventArgs e) //尾页
    {
        this.labPage.Text = this.labBackPage.Text;          //设置当前页为最后一页
        this.seekSpeak();
    }

    protected void btnDown_Click(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
            string path = Server.MapPath(".\\") + VUrl;
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
    protected void btnSpeak_Click(object sender, EventArgs e)
    {
        string spokesman;
        if (Session["UserName"] != null)                                              //判断用户是否登录如登录发言人存储登录名为登录存储为游客
        {
            spokesman = Session["UserName"].ToString();
        }
        else
        {
            spokesman = "游客";
        }
        string speakContent = this.txtContent.Text;                                   //存储用户发言内容           
        string tutorialType = "Video";                                                //教程类型
        string tutorialID = Request.QueryString["VideoID"];                           //视频编号
        string insertSql = "insert into tb_Speak([Spokesman],[TutorialType],[TutorialID],[SpeakContent]) values('" + spokesman + "','" + tutorialType + "'," + tutorialID + ",'" + speakContent + "')";
        if (Session["CheckCode"].ToString().Equals(this.txtYzm.Text.ToString()))     //判断验证码是否正确
        {
            bool bo = mydo.adlData(insertSql);
            if (bo)
            {
                seekSpeak();                                                        //从新绑定留言信息
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
  
}
