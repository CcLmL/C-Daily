using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

public class UserInfo
{
	private int userID;
	private string username;
	private string email;
	private DateTime loginDate;

	public int UserID
	{
		get
		{
			return userID;
		}
		set
		{
			userID = value;
		}
	}

	public string Username
	{
		get
		{
			return username;
		}
		set
		{
			username = value;
		}
	}

	public string Email
	{
		get
		{
			return email;
		}
		set
		{
			email = value;
		}
	}

	public DateTime LoginDate
	{
		get
		{
			return loginDate;
		}
		set
		{
			loginDate = value;
		}
	}
}

public class Users
{
	/// <summary>
	/// 保存用户信息的列表
	/// </summary>
	private List<UserInfo> list;
	public Users()
	{   ///初始化列表，并添加10条数据
		list = new List<UserInfo>();
		for(int i = 0; i < 10; i++)
		{   ///构造用户信息
			UserInfo ui = new UserInfo();
			ui.UserID = i;
			ui.Username = "MyName #" + (i + 1).ToString();
			ui.Email = ui.Username + "@web.com";
			ui.LoginDate = DateTime.Now;
			list.Add(ui);
		}
	}

	/// <summary>
	/// 获取所有用户信息
	/// </summary>
	public List<UserInfo> GetUsers() { return list; }
	/// <summary>
	/// 增加一个用户新用户
	/// </summary>
	public void AddUser(UserInfo ui) { list.Add(ui); }
	/// <summary>
	/// 更新一个用户信息
	/// </summary>
	public void UpdateUser(int userID,UserInfo ui) { list[userID] = ui; }
	/// <summary>
	/// 删除一个用户信息
	/// </summary>
	public void DeleteUser(UserInfo ui) { list.Remove(ui); }
}
