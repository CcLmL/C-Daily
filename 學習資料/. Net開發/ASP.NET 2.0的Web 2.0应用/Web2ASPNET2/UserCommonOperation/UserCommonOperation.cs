using System;
using System.Web.SessionState;

namespace Web2ASPNET2.UserCommonOperation
{
	public class UserInfo
	{
		#region ��������

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

		#region ���캯��

		public UserInfo() { }

		/// <summary>
		/// ֻʹ���û�ID
		/// </summary>
		/// <param name="userID"></param>
		public UserInfo(int userID)
		{
			this.userID = userID;
			this.username = string.Empty;
			this.loginDate = DateTime.Now;
		}
		/// <summary>
		/// ʹ���û�ID���û�����
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
		/// ʹ���û�ID���û����ƺ͵�¼ʱ��
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

		#region �洢�û���¼��Ϣ

		public UserCommonOperation() { }

		/// <summary>
		/// �洢�û�ID
		/// </summary>
		/// <param name="session"></param>
		/// <param name="userID"></param>
		public static void StoreUserInfo(HttpSessionState session,int userID)
		{
			if(session == null) return;
			///�洢�û���Ϣ
			session.Add(session.SessionID + UserIDKey,new UserInfo(userID));
		}

		/// <summary>
		/// �洢�û�ID������
		/// </summary>
		/// <param name="session"></param>
		/// <param name="userID"></param>
		/// <param name="username"></param>
		public static void StoreUserInfo(HttpSessionState session,int userID,
			string username)
		{
			if(session == null) return;
			///�洢�û���Ϣ
			session.Add(session.SessionID + UserIDKey,new UserInfo(userID,username));
		}

		/// <summary>
		/// �洢�û�ID���û����ƺ͵�¼ʱ��
		/// </summary>
		/// <param name="session"></param>
		/// <param name="userID"></param>
		/// <param name="username"></param>
		/// <param name="loginDate"></param>
		public static void StoreUserInfo(HttpSessionState session,int userID,
			string username,DateTime loginDate)
		{
			if(session == null) return;
			///�洢�û���Ϣ
			session.Add(session.SessionID + UserIDKey,new UserInfo(userID,username,loginDate));
		}
		
		/// <summary>
		/// �洢�����û�ID���û����ƺ͵�¼ʱ���UserInfo����
		/// </summary>
		/// <param name="session"></param>
		/// <param name="info"></param>
		public static void StoreUserInfo(HttpSessionState session,UserInfo info)
		{
			if(session == null) return;
			///�洢�û���Ϣ
			session.Add(session.SessionID + UserIDKey,info);
		}

		/// <summary>
		/// ��ȡ�û���¼��Ϣ
		/// </summary>
		/// <param name="session"></param>
		/// <returns></returns>
		public static UserInfo GetUserInfo(HttpSessionState session)
		{
			return (UserInfo)session[session.SessionID + UserIDKey];
		}

		/// <summary>
		/// ����û���¼��Ϣ
		/// </summary>
		/// <param name="session"></param>
		public static void ClearAndAbandon(HttpSessionState session)
		{   ///������ж���ȡ���Ự
			session.Clear();
			session.Abandon();
		}

		#endregion
	}
}
