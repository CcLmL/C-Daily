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
	public class Comment
	{
		public Comment()
		{
			
		}

		/// <summary>
		/// 获取给定所属ID的记录
		/// </summary>
		/// <param name="articleID"></param>
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
		/// <param name="commentID"></param>
		/// <returns></returns>
		public SqlDataReader GetSingleComment(int commentID)
		{   ///获取单个记录
			return DataCommon.GetDataByReaderIDParam("Pr_GetSingleBlogComment",commentID);
		}

		/// <summary>
		/// 添加一条记录
		/// </summary>
		/// <param name="name"></param>
		/// <param name="parentID"></param>
		/// <param name="userID"></param>
		/// <param name="flag"></param>
		/// <returns></returns>
		public int AddComment(string name,string body,int userID,int articleID)
		{   ///创建参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,200,name),
				OperateDatabase.CreateInParam("@Body",SqlDbType.Text,WebBlog.TextStringLength,body),
				OperateDatabase.CreateInParam("@UserID",SqlDbType.Int,4,userID),
				OperateDatabase.CreateInParam("@ArticleID",SqlDbType.Int,4,articleID)
			};
			///执行存储过程并返回结果
			return (OperateDatabase.RunProc("Pr_AddBlogComment",parameters));
		}			

		/// <summary>
		/// 删除给定的记录
		/// </summary>
		/// <param name="commentID"></param>
		/// <returns></returns>
		public int DeleteComment(int commentID)
		{	///执行删除操作
			return DataCommon.QueryDataIDParam("Pr_DeleteBlogComment",commentID);
		}			
	}
}
