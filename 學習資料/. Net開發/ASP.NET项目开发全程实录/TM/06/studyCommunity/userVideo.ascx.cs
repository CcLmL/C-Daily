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

public partial class userVideo : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        videoP();
    }

    //视频排行榜
    public void videoP()
    {
        dataOperate mydo = new dataOperate();
        string sql = "SELECT top 10 * from (select *  from tb_Video as a inner join tb_Type as b on a.VideoType=b.TypeID  order by [ClickSum] desc )";
        gvVideoP.DataSource = mydo.rows(sql, "tb_Video").DefaultView;
        gvVideoP.DataBind();

    }
}
