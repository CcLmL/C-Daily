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
	/// <summary>
	/// Filter 的摘要说明
	/// </summary>
	public class Filter
	{
		public Filter()
		{
			//
			// TODO: 在此处添加构造函数逻辑
			//
		}

		public DataSet GetFilters()
		{
			return DataCommon.GetDataByDataSet("Pr_GetAjaxFilters");
		}

		public SqlDataReader GetSingleFilter(int filterID)
		{
			return DataCommon.GetDataByReaderIDParam("Pr_GetSingleAjaxFilter",filterID);
		}

		public int AddFilter(string key,byte flag)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@Key",SqlDbType.VarChar,255,key),
				OperateDatabase.CreateInParam("@Flag",SqlDbType.TinyInt,1,flag)
			};
			return (OperateDatabase.RunProc("Pr_AddAjaxFilter",parameters));
		}

		public int UpdateFilter(int filterID,string key)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,filterID),
				OperateDatabase.CreateInParam("@Key",SqlDbType.VarChar,255,key)
			};
			return (OperateDatabase.RunProc("Pr_UpdateAjaxFilter",parameters));
		}

		public int DeleteFilter(int filterID)
		{
			return DataCommon.QueryDataIDParam("Pr_DeleteAjaxFilter",filterID);
		}
	}
}
