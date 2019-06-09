using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BT_Enter_Click(object sender, EventArgs e)
    {
        //导航到聊天室
        //需要传递参数“聊天频道”和“匿称”
        Response.Redirect("ChatWin.aspx?Channel=" + TB_Channel.Text + "&User=" + TB_Username.Text);
    }
}
