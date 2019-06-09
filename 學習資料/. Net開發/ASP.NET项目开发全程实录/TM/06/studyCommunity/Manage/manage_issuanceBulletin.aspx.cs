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

public partial class Manage_issuanceBulletin : System.Web.UI.Page
{
    dataOperate mydo = new dataOperate();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnFB_Click(object sender, EventArgs e)
    {
        string title = this.tebTitle.Text;
        string content=this.tebContent.Text;
        string name = this.tebName.Text;
        string sql = "insert into tb_Bulletin(Title,Content,Name) values('" + title + "','" + content + "','" + name + "')";
        bool bl = mydo.adlData(sql);
        if (bl)
        {
            Page.RegisterStartupScript("true", "<script>alert('发布成功！')</script>");
        tebContent.Text = "";
        tebTitle.Text = "";
        tebName.Text = "";
        }
        else
        {
            Page.RegisterStartupScript("false", "<script>alert('发布失败！')</script>");
        }

    }
}
