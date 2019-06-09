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

public partial class TimerCtrl : System.Web.UI.Page
{
	static int index = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
	protected void tUser_Tick(object sender,EventArgs e)
	{
		ddlUser.SelectedIndex = index;
		index = ++index % ddlUser.Items.Count;

		ddlUser_SelectedIndexChanged(sender,e);
	}
	protected void ddlUser_SelectedIndexChanged(object sender,EventArgs e)
	{
		lbUsername.Text = ddlUser.SelectedItem.Text;
	}
}
