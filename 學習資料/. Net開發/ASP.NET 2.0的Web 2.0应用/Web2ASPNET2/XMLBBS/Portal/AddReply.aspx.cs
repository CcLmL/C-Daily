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
using System.Text;
using System.Data.SqlClient;

public partial class Portal_AddReply:System.Web.UI.Page
{
	int titleID = -1;
	protected void Page_Load(object sender,EventArgs e)
	{	///判断用户是否登录
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null)
		{   ///返回到上一个页面
			Response.Write("<script>history.back()</script>");
			///跳转到登录页面
			Server.Transfer("~/Portal/UserLogin.aspx");
			return;
		}
		///获取修回复帖子的ID
		if(Request.Params["TitleID"] != null)
		{
			titleID = DataTypeConvert.ConvertToInt(Request.Params["TitleID"].ToString());
		}
		if(!Page.IsPostBack)
		{   ///显示被修改的数据
			if(titleID > -1)
			{
				BindPageData(titleID);
			}
		}
		///设置按钮的可用性
		int[] idList = { titleID };
		ButtonEnable.ControlButtonEnable(btnUpdateAndReturn,idList);
	}
	private void BindPageData(int titleID)
	{
		BBS bbs = new BBS();
		DataTable dt = bbs.GetSingleTitle(titleID);
		if(dt == null) return;
		if(dt.Rows.Count <= 0) return;
		///显示被修改的数据
		tbName.Text = dt.Rows[0]["Name"].ToString();
		StringBuilder body = new StringBuilder();
		body.Append("\n\n________________________________\n");
		
		Web2ASPNET2.XmlBBS.User user = new Web2ASPNET2.XmlBBS.User();
		SqlDataReader dr = user.GetSingleUser(DataTypeConvert.ConvertToInt(dt.Rows[0]["UserID"].ToString()));
		if(dr == null)return;
		if(dr.Read())
		{
			body.Append("【" + dr["UserName"].ToString() + "在帖子("
				+ dt.Rows[0]["Name"].ToString() + ")中提到：】" + "\n");
		}
		dr.Close();
		body.Append(dt.Rows[0]["Body"].ToString().Length > 100
			? dt.Rows[0]["Body"].ToString().Substring(0,100) + " ... "
			: dt.Rows[0]["Body"].ToString());
		tbBody.Text = body.ToString();

		ViewState["ReplyNum"] = dt.Rows[0]["ReplyNum"];
	}
	protected void btnUpdateAndReturn_Click(object sender,EventArgs e)
	{   ///获取用户登录信息
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null) return;
		BBS bbs = new BBS();
		if(bbs.AddReply(tbBody.Text,
			info.UserID,
			titleID) > 0)
		{
			if(ViewState["ReplyNum"] != null)
			{
				int replyNum = DataTypeConvert.ConvertToInt(ViewState["ReplyNum"].ToString()) + 1;
				bbs.UpdateTitleReplyNum(titleID,replyNum);
			}

			Dialog.OpenDialog(Response,"恭喜您，回复帖子信息成功……");
			///返回管理页面
			Server.Transfer("~/Portal/ViewTitle.aspx?TitleID=" + titleID.ToString());
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   ///返回管理页面
		Server.Transfer("~/Portal/ViewTitle.aspx?TitleID=" + titleID.ToString());
	}
}
