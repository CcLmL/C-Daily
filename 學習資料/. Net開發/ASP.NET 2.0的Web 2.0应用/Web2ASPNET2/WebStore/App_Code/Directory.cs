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

namespace Web2ASPNET2.WebStore
{
	public class Directory
	{
		public Directory(){}

		public SqlDataReader GetDirectorys()
		{
			return DataCommon.GetDataByReader("Pr_GetDirectorys");			
		}

		public DataSet GetDirectorysDS()
		{
			return DataCommon.GetDataByDataSet("Pr_GetDirectorys");
		}

		public SqlDataReader GetDirectoryFile(int directoryID)
		{	///定义保存数据的SqlDataReader对象
			SqlDataReader dr = null;
			///添加存储过程参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@DirectoryID",SqlDbType.Int,4,directoryID)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetDirectoryAndFile",out dr,parameters);
			///返回结果
			return dr;
		}

		public SqlDataReader GetSingleDirectory(int directoryID)
		{
			return DataCommon.GetDataByReaderIDParam("Pr_GetSingleDirectory",directoryID);
		}

		public int AddDirectory(string name,int parentID,int userID,string remark)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,50,name),
				OperateDatabase.CreateInParam("@ParentID",SqlDbType.Int,4,parentID),
				OperateDatabase.CreateInParam("@UserID",SqlDbType.Int,4,userID),
				OperateDatabase.CreateInParam("@Remark",SqlDbType.NVarChar,1000,remark)
			};
			return (OperateDatabase.RunProc("Pr_AddDirectory",parameters));
		}

		public int UpdateDirectory(int directoryID,string name,string remark)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,directoryID),
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,50,name),
				OperateDatabase.CreateInParam("@Remark",SqlDbType.NVarChar,1000,remark)
			};
			return (OperateDatabase.RunProc("Pr_UpdateDirectory",parameters));
		}

		public int UpdateDirectoryFileCount(int directoryID,int fileCount)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,directoryID),
				OperateDatabase.CreateInParam("@FileCount",SqlDbType.Int,4,fileCount)
			};
			return (OperateDatabase.RunProc("Pr_UpdateFileCount",parameters));
		}

		public int UpdateDirectoryUsedSpace(int directoryID,int usedSpace)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,directoryID),
				OperateDatabase.CreateInParam("@UsedSpace",SqlDbType.Int,4,usedSpace)
			};
			return (OperateDatabase.RunProc("Pr_UpdateUsedSpace",parameters));
		}

		public int DeleteDirectory(int directoryID)
		{
			return DataCommon.QueryDataIDParam("Pr_DeleteDirectory",directoryID);
		}

		public void CreateHiberarchyDirectory(ListControl list)
		{   ///获取数据
			DataSet ds = GetDirectorysDS();
			if(ds == null) return;
			if(ds.Tables.Count <= 0) return;

			///情况控件的选择项
			list.Items.Clear();
			DataRow[] rows = ds.Tables[0].Select("ParentID='0'");
			if(rows.Length <= 0) return;
			///创建、添加根节点
			list.Items.Add(new ListItem("/",rows[0]["ID"].ToString()));
			///创建其他节点
			CreateChildDirectory(
				list,
				ds.Tables[0],
				DataTypeConvert.ConvertToInt(rows[0]["ID"].ToString()),
				"/");
		}
		private void CreateChildDirectory(ListControl list,DataTable dt,int parentID,string parentName)
		{	///选择子节点
			DataRow[] rows = dt.Select("ParentID='" + parentID.ToString() + "'");
			foreach(DataRow row in rows)
			{
				string name = parentName + row["Name"].ToString() + "/";
				///创建新节点
				list.Items.Add(new ListItem(name,row["ID"].ToString()));
				///递归调用，创建其他节点
				CreateChildDirectory(
					list,
					dt,
					DataTypeConvert.ConvertToInt(row["ID"].ToString()),
					name);
			}
		}

		public void InitDirectoryTree(TreeView tv,bool isShowFile)
		{   ///获取目录数据
			DataSet ds = GetDirectorysDS();
			if(ds == null) return;
			if(ds.Tables.Count <= 0) return;
			///定义保存文件的DataSet对象
			DataSet dsFile = null;

			///清空树的所有节点
			tv.Nodes.Clear();     		
			DataRow[] rows = ds.Tables[0].Select("ParentID='0'");
			if(rows.Length < 1) return;

			///创建根节点
			TreeNode root = new TreeNode();
			///设置根节点属性
			root.Text = rows[0]["Name"].ToString();
			///设置根节点的value值
			root.Value = rows[0]["ID"].ToString();
			root.Expanded = true;
			///添加根节点
			tv.Nodes.Add(root);
			///添加根节点的文档
			if(isShowFile == true)
			{
				///获取文件数据
				Web2ASPNET2.WebStore.File file = new Web2ASPNET2.WebStore.File();
				dsFile = file.GetFilesDS();
				if(dsFile == null) return;
				if(dsFile.Tables.Count <= 0) return;
				CreateNodeDocument(root,dsFile.Tables[0]);
			}
			///创建其他节点
			CreateChildNode(root,ds.Tables[0], dsFile == null ? null : dsFile.Tables[0],isShowFile);
		}

		private void CreateChildNode(TreeNode parentNode,DataTable dt,
			DataTable dtFile,bool isShowFile)
		{	///获取子节点的数据
			DataRow[] rows = dt.Select("ParentID='" + parentNode.Value + "'");
			foreach(DataRow row in rows)
			{   ///创建新节点
				TreeNode node = new TreeNode();
				///设置节点的属性
				node.Text = row["Name"].ToString();
				node.Value = row["ID"].ToString();
				node.ImageUrl = "~/App_Themes/Web2ASPNET2/Images/folder.gif";
				parentNode.ChildNodes.Add(node);
				///添加节点的文档
				if(isShowFile == true)
				{
					CreateNodeDocument(node,dtFile);
				}
				///递归调用，创建其他节点
				CreateChildNode(node,dt,dtFile,isShowFile);
			}
		}

		private void CreateNodeDocument(TreeNode parentNode,DataTable dtFile)
		{   ///获取节点包含的文档
			DataRow[] rowsFile = dtFile.Select("DirectoryID='" + parentNode.Value + "'");
			foreach(DataRow row in rowsFile)
			{   ///设置节点的属性
				TreeNode node = new TreeNode();
				node.Text = row["Name"].ToString();
				if(row["Flag"].ToString().ToLower() == "false")
				{
					node.NavigateUrl = "../" + row["Url"].ToString();
				}
				else
				{
					node.NavigateUrl = "~/Portal/ShowFile.aspx?FileID=" + row["ID"].ToString();
				}
				node.Value = row["ID"].ToString();
				node.Target = "_blank";
				///添加该节点到树中
				parentNode.ChildNodes.Add(node);
			}
		}
	}

	public class File
	{
		public File() { }

		public DataSet GetFilesDS()
		{
			return DataCommon.GetDataByDataSet("Pr_GetFiles");
		}

		public SqlDataReader GetFileByDirectory(int directoryID)
		{	///定义保存数据的SqlDataReader对象
			SqlDataReader dr = null;
			///添加存储过程参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@DirectoryID",SqlDbType.Int,4,directoryID)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetFileByDirectory",out dr,parameters);
			///返回结果
			return dr;
		}

		public DataSet GetFilesDSByDirectory(int directoryID)
		{	///定义保存数据的DataSet对象
			DataSet ds = null;
			///添加存储过程参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@DirectoryID",SqlDbType.Int,4,directoryID)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetFileByDirectory",ref ds,parameters);
			///返回结果
			return ds;
		}

		public SqlDataReader GetSingleFile(int fileID)
		{
			return DataCommon.GetDataByReaderIDParam("Pr_GetSingleFile",fileID);
		}

		public int AddFile(string name,string type,long size,int directoryID,
			string url)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,50,name),
				OperateDatabase.CreateInParam("@Type",SqlDbType.VarChar,50,type),
				OperateDatabase.CreateInParam("@Size",SqlDbType.Int,4,size),
				OperateDatabase.CreateInParam("@DirectoryID",SqlDbType.Int,4,directoryID),
				OperateDatabase.CreateInParam("@Url",SqlDbType.VarChar,255,url)
			};
			return (OperateDatabase.RunProc("Pr_AddFileUrl",parameters));
		}

		public int AddFile(string name,string type,long size,int directoryID,
			byte[] data)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,50,name),
				OperateDatabase.CreateInParam("@Type",SqlDbType.VarChar,50,type),
				OperateDatabase.CreateInParam("@Size",SqlDbType.Int,4,size),
				OperateDatabase.CreateInParam("@DirectoryID",SqlDbType.Int,4,directoryID),
				OperateDatabase.CreateInParam("@Data",SqlDbType.Image,WebStore.TextStringLength,data)
			};
			return (OperateDatabase.RunProc("Pr_AddFileData",parameters));
		}

		public int UpdateFile(int fileID,string name)
		{
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@ID",SqlDbType.Int,4,fileID),
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,50,name)			
			};
			return (OperateDatabase.RunProc("Pr_UpdateFile",parameters));
		}

		public int DeleteFile(int fileID)
		{
			return DataCommon.QueryDataIDParam("Pr_DeleteFile",fileID);
		}
	}
}
