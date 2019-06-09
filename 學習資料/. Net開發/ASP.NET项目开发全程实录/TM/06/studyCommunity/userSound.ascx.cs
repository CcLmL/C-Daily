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

public partial class userSound : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        soundP();
    }

    //语音排行榜
    public void soundP()
    {
        dataOperate mydo = new dataOperate();
        string sql = "select top 10 * from(select * from tb_sound as a inner join tb_Type as b on a.SoundType=b.TypeID order by [ClickSum] desc)";
        gvSoundP.DataSource = mydo.rows(sql, "tb_Sound").DefaultView;
        gvSoundP.DataBind();
    }
}
