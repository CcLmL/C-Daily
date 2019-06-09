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

public partial class issuance : System.Web.UI.Page
{
    dataOperate mydo = new dataOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PanelFB.Visible = false;
            PanelYvideo.Visible = false;
            if (Session["UserName"] == null)
            {
                RegisterStartupScript("null", "<script>alert('请先登录！');location='index.aspx'</script>");
            }
            else
            {                              
                PanelFB.Visible = true;
                Ysound();           //通过自定义方法绑定已发布的语音
        Yvidoe();           //通过自定义方法绑定已发布的视频
            }
            PanelYsound.Visible = false;
        } 
        
        bindLanguage();     //通过自定义方法绑定语言类型
    }


    
  
  



    //已发布视频
    protected void Yvidoe()
    {
        string sql = "select * from tb_Video as a inner join tb_Type as b on a.VideoType=b.TypeID where a.Name='" + Session["UserName"].ToString() + "' order by VideoID desc";
        this.gvFBVideo.DataSource = mydo.rows(sql, "tb_Video");
        this.gvFBVideo.DataKeyNames = new string[] { "VideoID" };
        this.gvFBVideo.DataBind();

    }
    //已发布语音
    protected void Ysound()
    {
        string sql = "select * from tb_Sound as a inner join tb_Type as b on a.SoundType=b.TypeID where a.Name='" + Session["UserName"].ToString() + "'";
        this.gvFBSound.DataSource = mydo.rows(sql, "tb_Sound");
        this.gvFBSound.DataKeyNames = new string[] { "SoundID" };
        this.gvFBSound.DataBind();
    }

   
  

 
 
    //给已发布的视频添加自动编号
    protected void gvFBVideo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int id = e.Row.RowIndex + 1;
            e.Row.Cells[0].Text = id.ToString();
        }
    }
    //给已发布的语音 添加自动编号

    protected void gvFBSound_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int id = e.Row.RowIndex + 1;
            e.Row.Cells[0].Text = id.ToString();
        }
    }
    //删除已发布的视频教程
    protected void gvFBVideo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = gvFBVideo.DataKeys[e.RowIndex].Value.ToString();
        string vsql = "delete from tb_Video where VideoID= " + id;
        bool delVideo = mydo.adlData(vsql);
        if (delVideo)
        {
            string ssql = "delete from tb_Speak where TutorialType='Video' and TutorialID=" + id;
            mydo.adlData(ssql);
        }
        else
        {
            Page.RegisterStartupScript("false", "<script>alert('删除失败！')</script>");
        }
        Yvidoe();
        
    }
    //删除已发布语音教程
    protected void gvFBSound_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = gvFBSound.DataKeys[e.RowIndex].Value.ToString();
        string vsql = "delete from tb_Sound where SoundID= " + id;
        bool delSound = mydo.adlData(vsql);
        if (delSound)
        {
            string ssql = "delete from tb_Speak where TutorialType='Sound' and TutorialID=" + id;
            mydo.adlData(ssql);
        }
        else
        {
            Page.RegisterStartupScript("false", "<script>alert('删除失败！')</script>");
        }
        Ysound();
    }

    //绑定语言类型
    protected void bindLanguage()
    {
        string sql = "select * from tb_Type  ";
        this.ddlLanguage.DataSource = mydo.rows(sql, "tb_Type").DefaultView;
        this.ddlLanguage.DataBind();
    }
        
   
       
  
       
   
       
  
    //发布教程！！
    protected void btnFB_Click(object sender, EventArgs e)
    {
        string vsname = txtName.Text;                       //获取教程名称
        string isVS;
        if (rdibtnSound.Checked)                           //获取教程类型
        {
            isVS = "tb_Sound";
        }
        else
        {
            isVS = "tb_Video";
        }
        string typ = this.ddlLanguage.SelectedValue;        //获取语言类型
        string content = txtContent.Text;                   //获取内容简介
        string name = Session["UserName"].ToString();       //获取用户登录名
        int clicksum = 0;                                   //初始化点击率   
        string Path = "";
        try
        {
            string sql = "";
            if (isVS == "tb_Sound")                        //判断教程是否是语音类型
            {
                //判断用户上传的文件类型
                if (FileUpload1.FileName.Substring(FileUpload1.FileName.LastIndexOf(".") + 1) == "mp3")
                {
                    //判断用户上传的语音教程是否存在
                    if (!File.Exists(Server.MapPath(".") + "\\Sound\\" + this.FileUpload1.FileName))
                    {
                        sql = "insert into tb_Sound(SoundType,SoundName,SoundUrl,ClickSum,SoundContent,Name) values('" + typ + "','" + vsname + "','" + this.FileUpload1.FileName + "','" + clicksum + "','" + content + "','" + name + "')";
                        //设置路径用于保存上传的语音
                        Path = Server.MapPath("./") + "Sound" + "\\" + this.FileUpload1.FileName;
                        if (mydo.adlData(sql))
                        {
                            //将文件保存到指定位置
                            FileUpload1.PostedFile.SaveAs(Path);
                            Page.RegisterStartupScript("true", "<script>alert('上传成功！')</script>");
				txtName.Text="";
				txtContent.Text="";
                        }
                        else
                        {
                            Page.RegisterStartupScript("true", "<script>alert('上传失败！')</script>");
                        }
                    }
                    else
                        Page.RegisterStartupScript("false", "<script>alert('教程名称已经存在！')</script>");
                }
                else
                    RegisterStartupScript("false", "<script>alert('只能上传mp3类型！')</script>");
            }
            else
            {
                //判断用户上传的文件类型
                if (FileUpload1.FileName.Substring(FileUpload1.FileName.LastIndexOf(".") + 1) == "wmv")
                {
                    //判断用户上传的视频教程是否存在
                    if (!File.Exists(Server.MapPath(".") + "\\Video\\" + this.FileUpload1.FileName))
                    {
                        sql = "insert into tb_Video(VideoType,VideoName,VideoUrl,ClickSum,VideoContent,Name) values(" + typ + ",'" + vsname + "','" + this.FileUpload1.FileName + "'," + clicksum + ",'" + content + "','" + name + "')";
                        //设置路径用于保存上传的视频
                        Path = Server.MapPath("./") + "Video" + "\\" + this.FileUpload1.FileName;
                        if (mydo.adlData(sql))
                        {
                            FileUpload1.PostedFile.SaveAs(Path);
                            Page.RegisterStartupScript("true", "<script>alert('上传成功！')</script>");
				txtName.Text="";
				txtContent.Text="";
                        }
                        else
                        {
                            Page.RegisterStartupScript("true", "<script>alert('上传失败！')</script>");
                        }
                    }
                    else
                    {
                        Page.RegisterStartupScript("false", "<script>alert('教程名称已经存在！')</script>");
                    }
                }
                else
                    RegisterStartupScript("false", "<script>alert('只能上传wmv类型！')</script>");
            }
        }
        catch (Exception ex)
        {
            Page.RegisterStartupScript("false", "<script>alert('上传教程不能为空！')</script>");
        }
    }
    //发布教程按钮
    protected void imgbtnIssuance_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["UserName"] != null)
        {
            PanelFB.Visible = true;
            PanelYvideo.Visible = false;
            PanelYsound.Visible = false;
        }
    }
    //已发布视频按钮
    protected void imgbtnYFVideo_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["UserName"] != null)
        {
            Yvidoe();
            PanelFB.Visible = false;
            PanelYvideo.Visible = true;

            PanelYsound.Visible = false;
        }
    }
    //  已发布语音按钮
    protected void imgbtnYFSound_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["UserName"] != null)
        {
            Ysound();
            PanelFB.Visible = false;
            PanelYvideo.Visible = false;

            PanelYsound.Visible = true;
        }
    }
    //  退出按钮
    protected void imgbtnExit_Click(object sender, ImageClickEventArgs e)
    {
        Session["UserName"] = null;
        Response.Redirect("index.aspx");
    }
}
