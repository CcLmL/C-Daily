using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.OperateXmlDatabase;

namespace Web2ASPNET2.XmlBBS
{
	public class Board
	{
		private readonly string TableName = "Board";

		public Board() { }

		public DataTable GetBoards()
		{
			return DataCommon.GetDataByNoParam(XmlBBS.BoardFilePath,TableName);			
		}

		public DataTable GetSingleBoard(int boardID)
		{
			return DataCommon.GetDataByIDParam(XmlBBS.BoardFilePath,TableName,boardID);
		}

		public int AddBoard(string name,int parentID,byte state,string remark)
		{
			XmlParamter[] param = {
				XmlDatabase.CreateInsertParameter("Name",name),
				XmlDatabase.CreateInsertParameter("ParentID",parentID.ToString()),
				XmlDatabase.CreateInsertParameter("CreateDate",DateTime.Now.ToString()),
				XmlDatabase.CreateInsertParameter("ShowOrder","1"),
				XmlDatabase.CreateInsertParameter("State",state.ToString()),
				XmlDatabase.CreateInsertParameter("SubCount","0"),
				XmlDatabase.CreateInsertParameter("Remark",remark)
			};

			return (XmlDatabase.AddData(XmlBBS.BoardFilePath,TableName,param));
		}

		public int UpdateBoard(int boardID,string name,byte state,string remark)
		{
			XmlParamter[] param = {
				XmlDatabase.CreateEqualParameter("ID",boardID.ToString()),
				XmlDatabase.CreateUpdateParameter("Name",name),
				XmlDatabase.CreateUpdateParameter("State",state.ToString()),
				XmlDatabase.CreateUpdateParameter("Remark",remark)
			};

			return (XmlDatabase.UpdateData(XmlBBS.BoardFilePath,TableName,param));
		}

		public int UpdateBoardSubCount(int boardID,int subCount)
		{
			XmlParamter[] param = {
				XmlDatabase.CreateEqualParameter("ID",boardID.ToString()),
				XmlDatabase.CreateUpdateParameter("SubCount",subCount.ToString()),
			};

			return (XmlDatabase.UpdateData(XmlBBS.BoardFilePath,TableName,param));
		}

		public int DeleteBoard(int boardID)
		{
			return DataCommon.DeleteDataIDParam(XmlBBS.BoardFilePath,TableName,boardID);
		}

		public void CreateHiberarchyBoard(ListControl list)
		{   ///获取数据
			DataTable dt = GetBoards();
			if(dt == null) return;

			///情况控件的选择项
			list.Items.Clear();
			DataRow[] rows = dt.Select("ParentID='-1'");
			if(rows.Length <= 0) return;
			///创建、添加根节点
			list.Items.Add(new ListItem(rows[0]["Name"].ToString() + "/",rows[0]["ID"].ToString()));
			///创建其他节点
			CreateChildBoard(
				list,
				dt,
				DataTypeConvert.ConvertToInt(rows[0]["ID"].ToString()),
				rows[0]["Name"].ToString() + "/");
		}
		private void CreateChildBoard(ListControl list,DataTable dt,int parentID,string parentName)
		{	///选择子节点
			DataRow[] rows = dt.Select("ParentID='" + parentID.ToString() + "'");
			foreach(DataRow row in rows)
			{
				string name = parentName + row["Name"].ToString() + "/";
				///创建新节点
				list.Items.Add(new ListItem(name,row["ID"].ToString()));
				///递归调用，创建其他节点
				CreateChildBoard(
					list,
					dt,
					DataTypeConvert.ConvertToInt(row["ID"].ToString()),
					name);
			}
		}

		public void CreateHiberarchyTree(TreeView tv,bool isAddUrl,bool isGuest)
		{   ///获取数据
			DataTable dt = GetBoards();
			if(dt == null) return;

			///情况控件的选择项
			tv.Nodes.Clear();
			DataRow[] rows = dt.Select("ParentID='-1'");
			if(rows.Length <= 0) return;
			///创建、添加根节点
			TreeNode root = new TreeNode();
			root.Text = rows[0]["Name"].ToString();
			root.Value = rows[0]["ID"].ToString();
			if(isAddUrl == true)
			{
				if(isGuest == false)
				{
					root.NavigateUrl = "~/Portal/TitleManage.aspx?BoardID=" + rows[0]["ID"].ToString();
				}
				else
				{
					root.NavigateUrl = "~/Portal/ViewBoard.aspx?BoardID=" + rows[0]["ID"].ToString();
				} 
				root.Target = "Desktop";
			}
			tv.Nodes.Add(root);			
			///创建其他节点
			CreateChildBoard(root,dt,isAddUrl,isGuest);
		}
		public void CreateHiberarchyTree(TreeNode parentNode,bool isAddUrl,bool isGuest)
		{
			if(parentNode == null) return;
			///获取数据
			DataTable dt = GetBoards();
			if(dt == null) return;
			///创建其他节点
			CreateChildBoard(parentNode,dt,isAddUrl,isGuest);
		}
		private void CreateChildBoard(TreeNode parentNode,DataTable dt,bool isAddUrl,bool isGuest)
		{	///选择子节点
			DataRow[] rows = dt.Select("ParentID='" + parentNode.Value + "'");
			foreach(DataRow row in rows)
			{   ///创建新节点
				TreeNode node = new TreeNode();
				node.Text = row["Name"].ToString();
				node.Value = row["ID"].ToString();
				if(isAddUrl == true)
				{
					if(isGuest == false)
					{
						node.NavigateUrl = "~/Portal/TitleManage.aspx?BoardID=" + row["ID"].ToString();
					}
					else
					{
						node.NavigateUrl = "~/Portal/ViewBoard.aspx?BoardID=" + row["ID"].ToString();
					} 					
					node.Target = "Desktop";
				}
				parentNode.ChildNodes.Add(node);
				///递归调用，创建其他节点
				CreateChildBoard(node,dt,isAddUrl,isGuest);
			}
		}
	}
}
