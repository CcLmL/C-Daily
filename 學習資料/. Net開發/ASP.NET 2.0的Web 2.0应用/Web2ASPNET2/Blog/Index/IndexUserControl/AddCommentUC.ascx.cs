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
using System.Data.SqlClient;
using Web2ASPNET2.WebBlog;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;

public partial class Index_IndexUserControl_AddCommentUC:Web2ASPNET2.WebBlog.UserControlBase
{
	int articleID = -1;
	int userID = -1;
	protected void Page_Load(object sender,EventArgs e)
	{	///判断用户是否登录
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null)return;
		///获取用户数据
		userID = info.UserID;

		if(Request.Params["ArticleID"] != null)
		{
			articleID = DataTypeConvert.ConvertToInt(Request.Params["ArticleID"].ToString());
		}

		tbUserName.Text = info.UserName;
		///设置按钮的可用性
		int[] idList = { userID };
		ButtonEnable.ControlButtonEnable(btnAdd,idList);		
	}
	protected void btnAdd_Click(object sender,EventArgs e)
	{   ///评论文章
		Comment comment = new Comment();
		comment.AddComment(tbName.Text,
			tbBody.Text,
			userID,
			articleID);
	}
}
