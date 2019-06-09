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
using Web2ASPNET2.XmlBBS;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;

public partial class Portal_Stat_ViewHotTitle:System.Web.UI.Page
{
	protected void Page_Load(object sender,EventArgs e)
	{
		if(!Page.IsPostBack)
		{
			BindPageData();
		}
	}

	private void BindPageData()
	{
		BBS bbs = new BBS();
		DataTable dtTitle = bbs.GetTitles();
		if(dtTitle == null)return;
		dtTitle.Columns.Add("VisitNumber",typeof(int));
		foreach(DataRow row in dtTitle.Rows)
		{
			row["VisitNumber"] = row["VisitNum"];
		}
		DataView dvTitle = dtTitle.DefaultView;
		dvTitle.Sort = "VisitNumber DESC";

		Web2ASPNET2.CommonOperation.DataBinder.BindGridViewData(
			gvTitle,dvTitle.ToTable());
	}
	protected string FormatState(byte state)
	{
		if(state == (byte)TitleState.NotReply)
		{
			return "禁止回复的帖子";
		}
		if(state == (byte)TitleState.NotReplyAttachment)
		{
			return "携带附件并禁止回复的帖子";
		}
		if(state == (byte)TitleState.Reply)
		{
			return "普通帖子";
		}
		if(state == (byte)TitleState.ReplyAttachment)
		{
			return "携带附件的帖子";
		}
		return string.Empty;
	}
}
