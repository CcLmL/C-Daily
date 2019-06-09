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

public partial class Manage_inssuanceTutorial : System.Web.UI.Page
{
    dataOperate mydo = new dataOperate();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string vsname = TextBoxVname.Text;
        string isVS;
        if (RadioButtonSound.Checked)
        {
            isVS = "tb_Sound";
        }
        else
        {
            isVS = "tb_Video";
        }
        string typ = this.DropDownListType.SelectedValue;
        string content = TextBoxContent.Text;
        string name = "校长";
        int clicksum = 0;

        string Path;
        try
        {
            string sql;
            if (isVS == "tb_Sound")
            {
                sql = "insert into tb_Sound(SoundType,SoundName,SoundUrl,ClickSum,SoundContent,Name) values('" + typ + "','" + vsname + "','" + this.FileUpload1.FileName + "','" + clicksum + "','" + content + "','" + name + "')";
                Path = Server.MapPath("~/") + "Sound" + "\\" + this.FileUpload1.FileName;

            }
            else
            {
                sql = "insert into tb_Video(VideoType,VideoName,VideoUrl,ClickSum,VideoContent,Name) values(" + typ + ",'" + vsname + "','" + this.FileUpload1.FileName + "'," + clicksum + ",'" + content + "','" + name + "')";
                Path = Server.MapPath("~/") + "Video" + "\\" + this.FileUpload1.FileName;
            }


            if (mydo.adlData(sql))
            {

                FileUpload1.PostedFile.SaveAs(Path);
                Page.RegisterStartupScript("true", "<script>alert('上传成功！')</script>");
                TextBoxVname.Text = "";
                TextBoxContent.Text = "";
            }
            else
            {

                Page.RegisterStartupScript("false", "<script>alert('上传是彼岸 ')</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
    }
}
