using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Web2ASPNET2.XmlBBS;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;

public partial class _Default : System.Web.UI.Page 
{
	protected void Page_Load(object sender,EventArgs e)
	{
		if(!Page.IsPostBack)
		{
			UpdateUserStat();
		}
		Response.Redirect("~/Portal/UserLogin.aspx");
	}

	private void UpdateUserStat()
	{
		BBS bbs = new BBS();
		DataTable dt = bbs.GetUserStat(1);
		if(dt == null) return;
		if(dt.Rows.Count <= 0) return;
		int userStat = DataTypeConvert.ConvertToInt(dt.Rows[0]["Total"].ToString());

		bbs.UpdateUserStat(1,userStat + 1);
	}
}
