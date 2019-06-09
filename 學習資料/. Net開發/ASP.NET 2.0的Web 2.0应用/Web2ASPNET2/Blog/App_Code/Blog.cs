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

namespace Web2ASPNET2.WebBlog
{
	public class Blog
	{
		public Blog()
		{			
		}

		public DataSet GetSkinByUser(int userID)
		{	///定义保存数据的DataSet对象
			DataSet ds = new DataSet();
			///添加存储过程参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@UserID",SqlDbType.Int,4,userID)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetBlogSkinByUser",ref ds,parameters);
			///返回结果
			return ds;
		}

		/// <summary>
		/// 获取所有记录
		/// </summary>
		/// <returns></returns>
		public SqlDataReader GetArticles()
		{
			return DataCommon.GetDataByReader("Pr_GetBlogArticles");
		}

		/// <summary>
		/// 获取所有记录
		/// </summary>
		/// <returns></returns>
		public SqlDataReader GetUrls()
		{
			return DataCommon.GetDataByReader("Pr_GetBlogUrls");
		}

		/// <summary>
		/// 获取给定所属ID的记录
		/// </summary>
		/// <param name="catalogID"></param>
		/// <returns></returns>
		public DataSet GetArticleByCatalog(int catalogID)
		{	///定义保存数据的DataSet对象
			DataSet ds = new DataSet();
			///添加存储过程参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@CatalogID",SqlDbType.Int,4,catalogID)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetBlogArticleByCatalog",ref ds,parameters);
			///返回结果
			return ds;
		}

		/// <summary>
		/// 获取给定时间的记录
		/// </summary>
		/// <param name="catalogID"></param>
		/// <returns></returns>
		public DataSet GetArticleByDate(DateTime date)
		{	///定义保存数据的DataSet对象
			DataSet ds = new DataSet();
			///添加存储过程参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@Date",SqlDbType.DateTime,8,date)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetBlogArticleByDate",ref ds,parameters);
			///返回结果
			return ds;
		}

		/// <summary>
		/// 获取给定所属ID的记录
		/// </summary>
		/// <param name="catalogID"></param>
		/// <returns></returns>
		public DataSet GetUrlByCatalog(int catalogID)
		{	///定义保存数据的DataSet对象
			DataSet ds = new DataSet();
			///添加存储过程参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@CatalogID",SqlDbType.Int,4,catalogID)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetBlogUrlByCatalog",ref ds,parameters);
			///返回结果
			return ds;
		}

		/// <summary>
		/// 获取给定所属ID的记录
		/// </summary>
		/// <param name="catalogID"></param>
		/// <returns></returns>
		public DataSet GetArticleUrlByCatalog(int catalogID)
		{	///定义保存数据的DataSet对象
			DataSet ds = new DataSet();
			///添加存储过程参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@CatalogID",SqlDbType.Int,4,catalogID)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetBlogArticleUrlByCatalog",ref ds,parameters);
			///返回结果
			return ds;
		}

		/// <summary>
		/// 获取给定所属ID的记录
		/// </summary>
		/// <param name="articleID"></param>
		/// <returns></returns>
		public DataSet GetSourceByArticle(int articleID)
		{	///定义保存数据的DataSet对象
			DataSet ds = new DataSet();
			///添加存储过程参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ArticleID",SqlDbType.Int,4,articleID)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetBlogSourceByArticle",ref ds,parameters);
			///返回结果
			return ds;
		}

		/// <summary>
		/// 获取所有访问来源
		/// </summary>
		/// <returns></returns>
		public DataSet GetSources()
		{
			return DataCommon.GetDataByDataSet("Pr_GetBlogArticleSources");
		}

		/// <summary>
		/// 获取给定所属ID的记录
		/// </summary>
		/// <param name="catalogID"></param>
		/// <returns></returns>
		public DataSet GetCommentByArticle(int articleID)
		{	///定义保存数据的DataSet对象
			DataSet ds = new DataSet();
			///添加存储过程参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ArticleID",SqlDbType.Int,4,articleID)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetBlogCommentByArticle",ref ds,parameters);
			///返回结果
			return ds;
		}
		
		/// <summary>
		/// 获取单个记录
		/// </summary>
		/// <param name="articleID"></param>
		/// <returns></returns>
		public SqlDataReader GetSingleArticle(int articleID)
		{
			return DataCommon.GetDataByReaderIDParam("Pr_GetSingleBlogArticle",articleID);
		}

		/// <summary>
		/// 获取单个记录
		/// </summary>
		/// <param name="urlID"></param>
		/// <returns></returns>
		public SqlDataReader GetSingleUrl(int urlID)
		{
			return DataCommon.GetDataByReaderIDParam("Pr_GetSingleBlogUrl",urlID);
		}

		/// <summary>
		/// 添加用户配置的界面
		/// </summary>
		/// <param name="userID"></param>
		/// <param name="skin"></param>
		/// <returns></returns>
		public int AddUserSkin(int userID,string skin)
		{   ///创建参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@Skin",SqlDbType.VarChar,200,skin),
				OperateDatabase.CreateInParam("@UserID",SqlDbType.Int,4,userID)				
			};
			///执行存储过程并返回结果
			return (OperateDatabase.RunProc("Pr_AddBlogSkin",parameters));
		}

		/// <summary>
		/// 添加一条记录
		/// </summary>
		/// <param name="name"></param>
		/// <param name="body"></param>
		/// <param name="flag"></param>
		/// <param name="catalogID"></param>
		/// <returns></returns>
		public int AddArticle(string name,string body,byte flag,int catalogID)
		{   ///创建参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,200,name),
				OperateDatabase.CreateInParam("@Body",SqlDbType.Text,WebBlog.TextStringLength,body),
				OperateDatabase.CreateInParam("@Flag",SqlDbType.TinyInt,1,flag),
				OperateDatabase.CreateInParam("@CatalogID",SqlDbType.Int,4,catalogID)				
			};
			///执行存储过程并返回结果
			return (OperateDatabase.RunProc("Pr_AddBlogArticle",parameters));
		}

		/// <summary>
		/// 添加一条记录
		/// </summary>
		/// <param name="name"></param>
		/// <param name="url"></param>
		/// <param name="catalogID"></param>
		/// <returns></returns>
		public int AddUrl(string name,string url,int catalogID)
		{   ///创建参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,200,name),
				OperateDatabase.CreateInParam("@Url",SqlDbType.VarChar,255,url),
				OperateDatabase.CreateInParam("@CatalogID",SqlDbType.Int,4,catalogID)				
			};
			///执行存储过程并返回结果
			return (OperateDatabase.RunProc("Pr_AddBlogUrl",parameters));
		}

		/// <summary>
		/// 添加一条记录
		/// </summary>
		/// <param name="url"></param>
		/// <param name="iPAddress"></param>
		/// <param name="articleID"></param>
		/// <returns></returns>
		public int AddArticleSource(string url,string iPAddress,int articleID)
		{   ///创建参数
			SqlParameter[] parameters = {				
				OperateDatabase.CreateInParam("@Url",SqlDbType.VarChar,255,url),
				OperateDatabase.CreateInParam("@IPAddress",SqlDbType.VarChar,20,iPAddress),
				OperateDatabase.CreateInParam("@ArticleID",SqlDbType.Int,4,articleID)				
			};
			///执行存储过程并返回结果
			return (OperateDatabase.RunProc("Pr_AddBlogArticleSourcee",parameters));
		}

		/// <summary>
		/// 更新给定的记录
		/// </summary>
		/// <param name="articleID"></param>
		/// <param name="name"></param>
		/// <param name="body"></param>
		/// <param name="flag"></param>
		/// <returns></returns>
		public int UpdateArticle(int articleID,string name,string body,byte flag)
		{   ///创建参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,articleID),
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,200,name),
				OperateDatabase.CreateInParam("@Body",SqlDbType.Text,WebBlog.TextStringLength,body),
				OperateDatabase.CreateInParam("@Flag",SqlDbType.TinyInt,1,flag)
			};
			///执行存储过程并返回结果
			return (OperateDatabase.RunProc("Pr_UpdateBlogArticle",parameters));
		}

		/// <summary>
		/// 更新给定的记录
		/// </summary>
		/// <param name="urlID"></param>
		/// <param name="name"></param>
		/// <param name="url"></param>
		/// <returns></returns>
		public int UpdateUrl(int urlID,string name,string url)
		{   ///创建参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,urlID),
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,50,name),
				OperateDatabase.CreateInParam("@Url",SqlDbType.VarChar,255,url)
			};
			///执行存储过程并返回结果
			return (OperateDatabase.RunProc("Pr_UpdateBlogUrl",parameters));
		}

		/// <summary>
		/// 删除给定的记录
		/// </summary>
		/// <param name="articleID"></param>
		/// <returns></returns>
		public int DeleteArticle(int articleID)
		{   ///执行删除操作
			return DataCommon.QueryDataIDParam("Pr_DeleteBlogArticle",articleID);
		}

		/// <summary>
		/// 删除给定的记录
		/// </summary>
		/// <param name="urlID"></param>
		/// <returns></returns>
		public int DeleteUrl(int urlID)
		{   ///执行删除操作
			return DataCommon.QueryDataIDParam("Pr_DeleteBlogUrl",urlID);
		}

		/// <summary>
		/// 删除给定的记录
		/// </summary>
		/// <param name="sourceID"></param>
		/// <returns></returns>
		public int DeleteArticleSource(int sourceID)
		{   ///执行删除操作
			return DataCommon.QueryDataIDParam("Pr_DeleteBlogArticleSourcee",sourceID);
		}

		/// <summary>
		/// 删除给定的记录
		/// </summary>
		/// <param name="commentID"></param>
		/// <returns></returns>
		public int DeleteArticleComment(int commentID)
		{   ///执行删除操作
			return DataCommon.QueryDataIDParam("Pr_DeleteBlogArticleComment",commentID);
		}
	}
}
