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

namespace Web2ASPNET2.XmlBBS
{
	public class Tag
	{
		public Tag() { }

		public SqlDataReader GetCatalogs()
		{
			return DataCommon.GetDataByReader("Pr_GetCatalogs");
		}
		public DataSet GetTagsDS()
		{
			return DataCommon.GetDataByDataSet("Pr_GetTags");
		}
		public SqlDataReader GetTags()
		{
			return DataCommon.GetDataByReader("Pr_GetTags");
		}
		public SqlDataReader GetArticles()
		{
			return DataCommon.GetDataByReader("Pr_GetArticles");
		}
		public SqlDataReader GetUrls()
		{
			return DataCommon.GetDataByReader("Pr_GetUrls");
		}	

		public DataSet GetTagByCatalog(int catalogID)
		{	///定义保存数据的DataSet对象
			DataSet ds = new DataSet();
			///添加存储过程参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@CatalogID",SqlDbType.Int,4,catalogID)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetTagByCatalog",ref ds,parameters);
			///返回结果
			return ds;
		}
		public DataSet GetTagByCount(int tagID)
		{	///定义保存数据的DataSet对象
			DataSet ds = new DataSet();
			///添加存储过程参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@TagID",SqlDbType.Int,4,tagID)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetArticleByTag",ref ds,parameters);
			///返回结果
			return ds;
		}
		public DataSet GetArticleByTag(int tagID)
		{	///定义保存数据的DataSet对象
			DataSet ds = new DataSet();
			///添加存储过程参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@TagID",SqlDbType.Int,4,tagID)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetArticleByTag",ref ds,parameters);
			///返回结果
			return ds;
		}
		public DataSet GetUrlByTag(int tagID)
		{	///定义保存数据的DataSet对象
			DataSet ds = new DataSet();
			///添加存储过程参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@TagID",SqlDbType.Int,4,tagID)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetUrlByTag",ref ds,parameters);
			///返回结果
			return ds;
		}
		public DataSet GetArticleUrlByTag(int tagID)
		{	///定义保存数据的DataSet对象
			DataSet ds = new DataSet();
			///添加存储过程参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@TagID",SqlDbType.Int,4,tagID)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetArticleUrlByTag",ref ds,parameters);
			///返回结果
			return ds;
		}

		public SqlDataReader GetSingleCatalog(int catalogID)
		{
			return DataCommon.GetDataByReaderIDParam("Pr_GetSingleTagCatalog",catalogID);
		}
		public SqlDataReader GetSingleTag(int tagID)
		{
			return DataCommon.GetDataByReaderIDParam("Pr_GetSingleTag",tagID);
		}
		public SqlDataReader GetSingleArticle(int articleID)
		{
			return DataCommon.GetDataByReaderIDParam("Pr_GetSingleTagArticle",articleID);
		}	
		public SqlDataReader GetSingleUrl(int urlID)
		{
			return DataCommon.GetDataByReaderIDParam("Pr_GetSingleTagUrl",urlID);
		}

		public int AddCatalog(string name)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,50,name)
			};
			return (OperateDatabase.RunProc("Pr_AddTagCatalog",parameters));
		}
		public int AddTag(string name,int catalogID,int userID,byte flag,
			string remark)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,50,name),
				OperateDatabase.CreateInParam("@CatalogID",SqlDbType.Int,4,catalogID),
				OperateDatabase.CreateInParam("@UserID",SqlDbType.Int,4,userID),
				OperateDatabase.CreateInParam("@Flag",SqlDbType.TinyInt,1,flag),
				OperateDatabase.CreateInParam("@Remark",SqlDbType.NVarChar,1000,remark)
			};
			return (OperateDatabase.RunProc("Pr_AddTag",parameters));
		}
		public int AddArticle(string name,string body,int tagID)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,50,name),
				OperateDatabase.CreateInParam("@Body",SqlDbType.Text,XmlBBS.TextStringLength,body),
				OperateDatabase.CreateInParam("@TagID",SqlDbType.Int,4,tagID)				
			};
			return (OperateDatabase.RunProc("Pr_AddTagArticle",parameters));
		}
		public int AddUrl(string name,string url,int tagID)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,50,name),
				OperateDatabase.CreateInParam("@Url",SqlDbType.VarChar,255,url),
				OperateDatabase.CreateInParam("@TagID",SqlDbType.Int,4,tagID)				
			};
			return (OperateDatabase.RunProc("Pr_AddTagUrl",parameters));
		}

		public int UpdateCatalog(int catalogID,string name)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,catalogID),
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,50,name)
			};
			return (OperateDatabase.RunProc("Pr_UpdateTagCatalog",parameters));
		}
		public int UpdateTag(int tagID,string name,byte flag,
			string remark)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,tagID),
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,50,name),
				OperateDatabase.CreateInParam("@Flag",SqlDbType.TinyInt,1,flag),
				OperateDatabase.CreateInParam("@Remark",SqlDbType.NVarChar,1000,remark)
			};
			return (OperateDatabase.RunProc("Pr_UpdateTag",parameters));
		}
		public int UpdateTagViewCount(int tagID,int viewCount)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,tagID),
				OperateDatabase.CreateInParam("@ViewCount",SqlDbType.Int,4,viewCount)
			};
			return (OperateDatabase.RunProc("Pr_UpdateTagViewCount",parameters));
		}
		public int MoveTag(int tagID,int catalogID)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,tagID),
				OperateDatabase.CreateInParam("@CatalogID",SqlDbType.Int,4,catalogID)
			};
			return (OperateDatabase.RunProc("Pr_MoveTag",parameters));
		}
		public int UpdateArticle(int articleID,string name,string body)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,articleID),
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,50,name),
				OperateDatabase.CreateInParam("@Body",SqlDbType.Text,XmlBBS.TextStringLength,body)
			};
			return (OperateDatabase.RunProc("Pr_UpdateTagArticle",parameters));
		}
		public int UpdateUrl(int urlID,string name,string url)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,urlID),
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,50,name),
				OperateDatabase.CreateInParam("@Url",SqlDbType.VarChar,255,url)
			};
			return (OperateDatabase.RunProc("Pr_UpdateTagUrl",parameters));
		}


		public int DeleteCatalog(int catalogID)
		{
			return DataCommon.QueryDataIDParam("Pr_DeleteTagCatalog",catalogID);
		}
		public int DeleteTag(int catalogID)
		{
			return DataCommon.QueryDataIDParam("Pr_DeleteTag",catalogID);
		}	
		public int DeleteArticle(int articleID)
		{
			return DataCommon.QueryDataIDParam("Pr_DeleteTagArticle",articleID);
		}
		public int DeleteUrl(int urlID)
		{
			return DataCommon.QueryDataIDParam("Pr_DeleteTagUrl",urlID);
		}
	}
}
