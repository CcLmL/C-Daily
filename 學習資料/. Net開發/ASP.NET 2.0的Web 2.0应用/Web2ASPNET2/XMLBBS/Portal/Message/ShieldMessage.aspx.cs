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

public partial class Portal_Message_ShieldMessage:System.Web.UI.Page
{
	int userID = -1;
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
		userID = info.UserID;

		if(!Page.IsPostBack)
		{
			if(userID > 0)
			{
				BindPageData(userID);
			}
		}
	}

	private void BindPageData(int userID)
	{   ///显示所有用户信息
		Web2ASPNET2.XmlBBS.User user = new Web2ASPNET2.XmlBBS.User();
		Web2ASPNET2.CommonOperation.DataBinder.BindListData(
			lbUser,user.GetUsers(),"UserName","ID");
		///显示已经被屏蔽的用户列表
		Message message = new Message();
		DataTable dtShieldUser = message.GetShieldUserBySender(userID);
		if(dtShieldUser == null) return;
		///添加用户名称列
		dtShieldUser.Columns.Add(new DataColumn("UserName",typeof(string)));
		///从数据库中获取用户数据
		DataSet dsUser = user.GetUsersByDS();
		if(dsUser == null) return;
		if(dsUser.Tables.Count <= 0) return;
		///构建"UserName"列的数据
		foreach(DataRow row in dtShieldUser.Rows)
		{
			foreach(DataColumn column in dtShieldUser.Columns)
			{
				if(column.ColumnName == "UserName")
				{
					row[column.ColumnName] = GetData(dsUser.Tables[0],
						"ID",
						column.ColumnName,
						row["Reciever"].ToString());
				}
			}
		}
		///绑定被屏蔽用户列表的数据
		Web2ASPNET2.CommonOperation.DataBinder.BindListData(
			lbShieldUser,dtShieldUser,"UserName","ID");
		///移除源列表中的相同数据
		foreach(ListItem item in lbShieldUser.Items)
		{
			for(int i = 0; i < lbUser.Items.Count; i++)
			{
				if(lbUser.Items[i].Value == item.Value)
				{
					lbUser.Items.RemoveAt(i);
					break;
				}
			}
		}
	}

	private object GetData(DataTable dt,string sColumnName,string dColumnName,string sValue)
	{
		DataRow[] rows = dt.Select(sColumnName + "='" + sValue + "'");
		if(rows.Length <= 0) return null;
		return rows[0][dColumnName];
	}

	/// <summary>
	/// 实现批量更新
	/// </summary>
	/// <param name="sender"></param>
	/// <param name="e"></param>
	protected void btnStroe_Click(object sender,EventArgs e)
	{	///删除现有被屏蔽的用户
		Message message = new Message();
		message.DeleteShieldUser(userID);
		///处理每一个用户
		foreach(ListItem item in lbShieldUser.Items)
		{   ///添加屏蔽的用户到数据库中
			message.AddShieldUser(userID,DataTypeConvert.ConvertToInt(item.Value));
		}

		Dialog.OpenDialog(Response,"保存数据成功……");
	}

	protected void ibtOperate_Command(object sender,CommandEventArgs e)
	{
		string cmdName = e.CommandName.ToLower();
		if(string.IsNullOrEmpty(cmdName) == true) return;
		switch(cmdName)
		{
			case "addone":
				{
					OperateOne(lbUser,lbShieldUser);
					break;
				}
			case "addall":
				{
					OperateAll(lbUser,lbShieldUser);
					break;
				}
			case "deleteone":
				{
					OperateOne(lbShieldUser,lbUser);
					break;
				}
			case "deleteall":
				{
					OperateAll(lbShieldUser,lbUser);
					break;
				}
			default: break;
		}
	}

	private void OperateOne(ListBox slist,ListBox dlist)
	{
		if(slist.SelectedIndex < 0)
		{
			Dialog.OpenDialog(Response,"请选择用户……");
			return;
		}
		dlist.SelectedIndex = -1;
		if(slist.SelectedItem == null) return;
		dlist.Items.Add(slist.SelectedItem);
		slist.Items.Remove(slist.SelectedItem);
	}

	private void OperateAll(ListBox slist,ListBox dlist)
	{
		dlist.SelectedIndex = -1;
		foreach(ListItem item in slist.Items)
		{
			dlist.Items.Add(item);
		}
		slist.Items.Clear();
	}
}
