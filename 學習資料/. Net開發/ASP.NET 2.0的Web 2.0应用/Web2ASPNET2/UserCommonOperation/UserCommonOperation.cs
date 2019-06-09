using System;
using System.Web.SessionState;

namespace Web2ASPNET2.UserCommonOperation
{
	public class UserInfo
	{
		#region 定义属性

		private int userID;
		private string username;
		private DateTime loginDate;

		public int UserID
		{
			get { return userID; }
			set { userID = value; }
		}

		public string UserName
		{
			get { return username; }
			set { username = value; }
		}

		public DateTime LoginDate
		{
			get { return loginDate; }
			set { loginDate = value; }
		}

		#endregion

		#region 构造函数

		public UserInfo() { }

		/// <summary>
		/// 只使用用户ID
		/// </summary>
		/// <param name="userID"></param>
		public UserInfo(int userID)
		{
			this.userID = userID;
			this.username = string.Empty;
			this.loginDate = DateTime.Now;
		}
		/// <summary>
		/// 使用用户ID和用户名称
		/// </summary>
		/// <param name="userID"></param>
		/// <param name="username"></param>
		public UserInfo(int userID,string username)
		{
			this.userID = userID;
			this.username = username;
			this.loginDate = DateTime.Now;
		}
		/// <summary>
		/// 使用用户ID、用户名称和登录时间
		/// </summary>
		/// <param name="userID"></param>
		/// <param name="username"></param>
		/// <param name="loginDate"></param>
		public UserInfo(int userID,string username,DateTime loginDate)
		{
			this.userID = userID;
			this.username = username;
			this.loginDate = loginDate;
		}

		#endregion
	}

	public class UserCommonOperation
	{
		private readonly static string UserIDKey = "USERIDKEY";

		#region 存储用户登录信息

		public UserCommonOperation() { }

		/// <summary>
		/// 存储用户ID
		/// </summary>
		/// <param name="session"></param>
		/// <param name="userID"></param>
		public static void StoreUserInfo(HttpSessionState session,int userID)
		{
			if(session == null) return;
			///存储用户信息
			session.Add(session.SessionID + UserIDKey,new UserInfo(userID));
		}

		/// <summary>
		/// 存储用户ID和名称
		/// </summary>
		/// <param name="session"></param>
		/// <param name="userID"></param>
		/// <param name="username"></param>
		public static void StoreUserInfo(HttpSessionState session,int userID,
			string username)
		{
			if(session == null) return;
			///存储用户信息
			session.Add(session.SessionID + UserIDKey,new UserInfo(userID,username));
		}

		/// <summary>
		/// 存储用户ID、用户名称和登录时间
		/// </summary>
		/// <param name="session"></param>
		/// <param name="userID"></param>
		/// <param name="username"></param>
		/// <param name="loginDate"></param>
		public static void StoreUserInfo(HttpSessionState session,int userID,
			string username,DateTime loginDate)
		{
			if(session == null) return;
			///存储用户信息
			session.Add(session.SessionID + UserIDKey,new UserInfo(userID,username,loginDate));
		}
		
		/// <summary>
		/// 存储保存用户ID、用户名称和登录时间的UserInfo对象
		/// </summary>
		/// <param name="session"></param>
		/// <param name="info"></param>
		public static void StoreUserInfo(HttpSessionState session,UserInfo info)
		{
			if(session == null) return;
			///存储用户信息
			session.Add(session.SessionID + UserIDKey,info);
		}

		/// <summary>
		/// 获取用户登录信息
		/// </summary>
		/// <param name="session"></param>
		/// <returns></returns>
		public static UserInfo GetUserInfo(HttpSessionState session)
		{
			return (UserInfo)session[session.SessionID + UserIDKey];
		}

		/// <summary>
		/// 清空用户登录信息
		/// </summary>
		/// <param name="session"></param>
		public static void ClearAndAbandon(HttpSessionState session)
		{   ///清空所有对象并取消会话
			session.Clear();
			session.Abandon();
		}

		#endregion
	}
}
