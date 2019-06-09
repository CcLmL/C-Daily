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
	/// <summary>
	/// Catalog 的摘要说明
	/// </summary>
	public class Catalog
	{
		public Catalog() { }

		/// <summary>
		/// 获取所有记录
		/// </summary>
		/// <returns></returns>
		public SqlDataReader GetCatalogs()
		{   ///获取所有记录
			return DataCommon.GetDataByReader("Pr_GetBlogCatalogs");
		}

		/// <summary>
		/// 获取单个记录
		/// </summary>
		/// <param name="catalogID"></param>
		/// <returns></returns>
		public SqlDataReader GetSingleCatalog(int catalogID)
		{   ///获取单个记录
			return DataCommon.GetDataByReaderIDParam("Pr_GetSingleBlogCatalog",catalogID);
		}

		/// <summary>
		/// 添加一条记录
		/// </summary>
		/// <param name="name"></param>
		/// <param name="parentID"></param>
		/// <param name="userID"></param>
		/// <param name="flag"></param>
		/// <returns></returns>
		public int AddCatalog(string name,int parentID,int userID,byte flag)
		{   ///创建参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,50,name),
				OperateDatabase.CreateInParam("@ParentID",SqlDbType.Int,4,parentID),
				OperateDatabase.CreateInParam("@UserID",SqlDbType.Int,4,userID),
				OperateDatabase.CreateInParam("@Flag",SqlDbType.TinyInt,1,flag)
			};
			///执行存储过程并返回结果
			return (OperateDatabase.RunProc("Pr_AddBlogCatalog",parameters));
		}

		/// <summary>
		/// 更新给定的记录
		/// </summary>
		/// <param name="catalogID"></param>
		/// <param name="name"></param>
		/// <param name="flag"></param>
		/// <returns></returns>
		public int UpdateCatalog(int catalogID,string name,byte flag)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,catalogID),
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,50,name),
				OperateDatabase.CreateInParam("@Flag",SqlDbType.TinyInt,1,flag)
			};
			///执行存储过程并返回结果
			return (OperateDatabase.RunProc("Pr_UpdateBlogCatalog",parameters));
		}

		/// <summary>
		/// 更新给定记录的显示顺序
		/// </summary>
		/// <param name="catalogID"></param>
		/// <param name="moveFlag"></param>
		/// <returns></returns>
		public int UpdateCatalogOrder(int catalogID,string moveFlag)
		{	///创建参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,catalogID),
				OperateDatabase.CreateInParam("@MoveFlag",SqlDbType.VarChar,20,moveFlag)
			};
			///执行存储过程并返回结果
			return (OperateDatabase.RunProc("Pr_UpdateBlogCatalogOrder",parameters));
		}

		/// <summary>
		/// 删除给定的记录
		/// </summary>
		/// <param name="catalogID"></param>
		/// <returns></returns>
		public int DeleteCatalog(int catalogID)
		{	///执行删除操作
			return DataCommon.QueryDataIDParam("Pr_DeleteBlogCatalog",catalogID);
		}			
	}
}
