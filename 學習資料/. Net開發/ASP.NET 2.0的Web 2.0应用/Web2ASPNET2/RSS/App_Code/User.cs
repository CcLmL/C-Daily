using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Web2ASPNET2.OperateSqlServer;
using System.Data.SqlClient;

namespace Web2ASPNET2.WebRSS
{
	public class User
	{
		public User()
		{
			///
		}

		public SqlDataReader GetUsers()
		{
			return DataCommon.GetDataByReader("Pr_GetUsers");
		}

		public DataSet GetUsersByDS()
		{
			return DataCommon.GetDataByDataSet("Pr_GetUsers");
		}

		public SqlDataReader GetSingleUser(int userID)
		{
			return DataCommon.GetDataByReaderIDParam("Pr_GetSingleUser",userID);
		}

		public int CheckUser(string userName)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@UserName",SqlDbType.VarChar,50,userName)
			};
			return (OperateDatabase.RunProcScalar("Pr_CheckUser",parameters));
		}

		public SqlDataReader GetUserLogin(string name,string password)
		{	///定义保存从数据库获取的结果的DataReader
			SqlDataReader dr = null;
			///添加存储过程的参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@UserName",SqlDbType.VarChar,50,name),
				OperateDatabase.CreateInParam("@Password",SqlDbType.VarChar,255,password)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetUserLogin",out dr,parameters);

			///返回从数据库获取的结果
			return dr;
		}

		public int AddUser(string userName,string password,int roleID,
			string email)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@UserName",SqlDbType.VarChar,50,userName),
				OperateDatabase.CreateInParam("@Password",SqlDbType.VarChar,255,password),
				OperateDatabase.CreateInParam("@RoleID",SqlDbType.Int,4,roleID),
				OperateDatabase.CreateInParam("@Email",SqlDbType.VarChar,255,email)
			};
			return (OperateDatabase.RunProc("Pr_AddUser",parameters));
		}

		public int UpdateUser(int userID,string email)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,userID),
				OperateDatabase.CreateInParam("@Email",SqlDbType.VarChar,255,email)				
			};
			return (OperateDatabase.RunProc("Pr_UpdateUser",parameters));
		}

		public int UpdateUserPassword(int userID,string password)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,userID),
				OperateDatabase.CreateInParam("@Password",SqlDbType.VarChar,255,password)
			};
			return (OperateDatabase.RunProc("Pr_UpdateUserPwd",parameters));
		}

		public int UpdateUserRole(int userID,int roleID)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,userID),
				OperateDatabase.CreateInParam("@RoleID",SqlDbType.Int,4,roleID)
			};
			return (OperateDatabase.RunProc("Pr_UpdateUserRole",parameters));
		}

		public int DeleteUser(int userID)
		{
			return DataCommon.QueryDataIDParam("Pr_DeleteUser",userID);
		}
	}
}
