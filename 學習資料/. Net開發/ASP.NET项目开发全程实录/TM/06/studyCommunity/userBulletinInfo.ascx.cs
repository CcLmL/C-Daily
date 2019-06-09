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

public partial class userBulletinInfo : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        createBulletin();
    }
    //公告信息
    protected void createBulletin()
    {
        dataOperate mydo = new dataOperate();
        try
        {
            string sql = "select * from tb_Bulletin order by Date DESC";

            this.gvBulletin.DataSource = mydo.rows(sql, "tb_Bullentin").DefaultView;
            this.gvBulletin.DataBind();

        }
        catch (Exception error)
        {
            Response.Redirect(error.Message.ToString());
        }

    }
}
