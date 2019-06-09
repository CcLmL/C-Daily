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
	public class Url
	{
		public Url()
		{
			///
		}

		public DataSet GetUrls()
		{
			return DataCommon.GetDataByDataSet("Pr_GetRssUrls");
		}

		public SqlDataReader GetSingleUrl(int urlID)
		{
			return DataCommon.GetDataByReaderIDParam("Pr_GetSingleRssUrl",urlID);
		}

		public int AddUrl(string name,string url)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,200,name),
				OperateDatabase.CreateInParam("@Url",SqlDbType.VarChar,255,url)
			};
			return (OperateDatabase.RunProc("Pr_AddRSSUrl",parameters));
		}

		public int UpdateUrl(int urlID,string name,string url)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,urlID),
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,200,name),
				OperateDatabase.CreateInParam("@Url",SqlDbType.VarChar,255,url)
			};
			return (OperateDatabase.RunProc("Pr_UpdateRSSUrl",parameters));
		}

		public int DeleteUrl(int urlID)
		{
			return DataCommon.QueryDataIDParam("Pr_DeleteRSSUrl",urlID);
		}
	}
}
