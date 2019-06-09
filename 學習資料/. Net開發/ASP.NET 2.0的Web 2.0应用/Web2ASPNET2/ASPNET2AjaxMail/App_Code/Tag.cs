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
	public class Tag
	{
		public Tag() { }

		public DataSet GetTagsDS()
		{
			return DataCommon.GetDataByDataSet("Pr_GetAjaxTags");
		}
		public SqlDataReader GetTags()
		{
			return DataCommon.GetDataByReader("Pr_GetAjaxTags");
		}
		public SqlDataReader GetSingleTag(int tagID)
		{
			return DataCommon.GetDataByReaderIDParam("Pr_GetSingleAjaxTag",tagID);
		}

		public int AddTag(string name)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,50,name)
			};
			return (OperateDatabase.RunProc("Pr_AddAjaxTag",parameters));
		}

		public int AddMailTag(int mailID,int tagID)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@MailID",SqlDbType.Int,4,tagID),
				OperateDatabase.CreateInParam("@TagID",SqlDbType.Int,4,tagID)
			};
			return (OperateDatabase.RunProc("Pr_AddAjaxMailTag",parameters));
		}

		public int UpdateTag(int tagID,string name)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,tagID),
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,50,name)
			};
			return (OperateDatabase.RunProc("Pr_UpdateAjaxTag",parameters));
		}

		public int DeleteTag(int tagID)
		{
			return DataCommon.QueryDataIDParam("Pr_DeleteAjaxTag",tagID);
		}
	}
}
