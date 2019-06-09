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

namespace Web2ASPNET2.ASPNET2AjaxMail
{
	public class Role
	{
		public Role()
		{
			///
		}

		public SqlDataReader GetRoles(int projectID)
		{
			///定义保存数据的SqlDataReader对象
			SqlDataReader dr = null;
			///添加存储过程参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ProjectID",SqlDbType.Int,4,projectID)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetRoles",out dr,parameters);
			///返回结果
			return dr;
		}

		public SqlDataReader GetSingleRole(int roleID)
		{
			return DataCommon.GetDataByReaderIDParam("Pr_GetSingleRole",roleID);
		}

		public int AddRole(string roleName,int projectID)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@RoleName",SqlDbType.VarChar,50,roleName),
				OperateDatabase.CreateInParam("@ProjectID",SqlDbType.Int,4,projectID)
			};
			return (OperateDatabase.RunProc("Pr_AddRole",parameters));
		}

		public int UpdateRole(int roleID,string roleName)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,roleID),
				OperateDatabase.CreateInParam("@RoleName",SqlDbType.VarChar,50,roleName)			
			};
			return (OperateDatabase.RunProc("Pr_UpdateRole",parameters));
		}

		public int DeleteRole(int roleID)
		{
			return DataCommon.QueryDataIDParam("Pr_DeleteRole",roleID);
		}
	}
}
