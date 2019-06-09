using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using Web2ASPNET2.OperateSqlServer;
using Web2ASPNET2.CommonOperation;

namespace Web2ASPNET2.ASPNET2AjaxMail
{
	public class Group
	{
		public Group()
		{

		}

		public DataSet GetGroupsDS()
		{
			return DataCommon.GetDataByDataSet("Pr_GetAjaxGroups");
		}
		public SqlDataReader GetGroups()
		{
			return DataCommon.GetDataByReader("Pr_GetAjaxGroups");
		}
		public SqlDataReader GetSingleGroup(int groupID)
		{
			return DataCommon.GetDataByReaderIDParam("Pr_GetSingleAjaxGroup",groupID);
		}

		public int AddGroup(string name)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,50,name)
			};
			return (OperateDatabase.RunProc("Pr_AddAjaxGroup",parameters));
		}

		public int UpdateGroup(int groupID,string name)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,groupID),
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,50,name)
			};
			return (OperateDatabase.RunProc("Pr_UpdateAjaxGroup",parameters));
		}

		public int DeleteGroup(int groupID)
		{
			return DataCommon.QueryDataIDParam("Pr_DeleteAjaxGroup",groupID);
		}
	}
	public class Linkman
	{
		public Linkman()
		{
			
		}

		public DataSet GetLinkmanDSByGroup(int groupID)
		{	///定义保存数据的DataSet对象
			DataSet ds = new DataSet();
			///添加存储过程参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@GroupID",SqlDbType.Int,4,groupID)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetAjaxLinkmanByGroup",ref ds,parameters);
			///返回结果
			return ds;
		}
		public SqlDataReader GetLinkmanByGroup(int groupID)
		{	///定义保存数据的DataSet对象
			SqlDataReader dr = null;
			///添加存储过程参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@GroupID",SqlDbType.Int,4,groupID)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetAjaxLinkmanByGroup",out dr,parameters);
			///返回结果
			return dr;
		}

		public DataSet GetLinkmanByKey(string key)
		{	///定义保存数据的DataSet对象
			DataSet ds = new DataSet();
			///添加存储过程参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@Key",SqlDbType.VarChar,255,key)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetAjaxLinkmanByKey",ref ds,parameters);
			///返回结果
			return ds;
		}

		public SqlDataReader GetSingleLinkman(int linkmanID)
		{
			return DataCommon.GetDataByReaderIDParam("Pr_GetSingleAjaxLinkman",linkmanID);
		}

		public int AddLinkman(string name,string email,int groupID)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,50,name),
				OperateDatabase.CreateInParam("@Email",SqlDbType.VarChar,255,email),
				OperateDatabase.CreateInParam("@GroupID",SqlDbType.Int,4,groupID)
			};
			return (OperateDatabase.RunProc("Pr_AddAjaxLinkman",parameters));
		}

		public int UpdateLinkman(int linkmanID,string name,string email)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,linkmanID),
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,50,name),
				OperateDatabase.CreateInParam("@Email",SqlDbType.VarChar,255,email)
			};
			return (OperateDatabase.RunProc("Pr_UpdateAjaxLinkman",parameters));
		}

		public int MoveLinkman(int linkmanID,int groupID)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,linkmanID),
				OperateDatabase.CreateInParam("@GroupID",SqlDbType.Int,4,groupID)
			};
			return (OperateDatabase.RunProc("Pr_MoveAjaxLinkman",parameters));
		}

		public int DeleteLinkman(int linkmanID)
		{
			return DataCommon.QueryDataIDParam("Pr_DeleteAjaxLinkman",linkmanID);
		}
	}
}
