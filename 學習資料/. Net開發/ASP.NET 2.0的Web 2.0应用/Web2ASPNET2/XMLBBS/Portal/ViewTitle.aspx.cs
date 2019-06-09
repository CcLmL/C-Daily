using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Web2ASPNET2.XmlBBS;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;
using System.Data.SqlClient;

public partial class Portal_ViewTitle:System.Web.UI.Page
{
	protected string Name = string.Empty;
	protected string Body = string.Empty;
	protected int titleID = -1;
	protected void Page_Load(object sender,EventArgs e)
	{	///获取被修改信息的ID
		if(Request.Params["TitleID"] != null)
		{
			titleID = DataTypeConvert.ConvertToInt(Request.Params["TitleID"].ToString());
		}
		if(!Page.IsPostBack)
		{   ///显示被修改的数据
			if(titleID > -1)
			{
				BindPageData(titleID);
			}
		}		
	}
		
	private void BindPageData(int titleID)
	{
		Web2ASPNET2.XmlBBS.User user = new Web2ASPNET2.XmlBBS.User();
		DataSet ds = user.GetUsersByDS();
		if(ds == null) return;
		if(ds.Tables.Count <= 0) return;

		Board board = new Board();
		DataTable dtBoard = board.GetBoards();
		if(dtBoard == null) return;

		BBS bbs = new BBS();
		DataTable dtTitle = bbs.GetTitles();
		if(dtTitle == null)return;
		DataRow[] titleRows = dtTitle.Select("ID='" + titleID.ToString() + "'");
		if(titleRows.Length <= 0) return;
		Name = ModuleTitle1.Title = titleRows[0]["Name"].ToString();
		Body = titleRows[0]["Body"].ToString();
		///更新帖子访问次数
		bbs.UpdateTitleVisitNum(titleID,DataTypeConvert.ConvertToInt(titleRows[0]["VisitNum"].ToString()) + 1);

		DataTable dtReply = bbs.GetReplyByTitle(titleID);
		if(dtReply == null) return;

		dtReply.Columns.Add(new DataColumn("UserName",typeof(string)));
		dtReply.Columns.Add(new DataColumn("BoardName",typeof(string)));
		foreach(DataRow row in dtReply.Rows)
		{
			foreach(DataColumn column in dtReply.Columns)
			{
				if(column.ColumnName == "UserName")
				{
					row[column.ColumnName] = GetData(ds.Tables[0],
						"ID",
						column.ColumnName,
						row["UserID"].ToString());
				}
				if(column.ColumnName == "BoardName")
				{
					row[column.ColumnName] = GetData(dtBoard,
						"ID",
						"Name",
						GetData(dtTitle,"ID","BoardID",row["TitleID"].ToString()).ToString());
				}
			}
		}

		Web2ASPNET2.CommonOperation.DataBinder.BindGridViewData(
			gvTitle,dtReply);
	}

	private object GetData(DataTable dt,string sColumnName,string dColumnName,string sValue)
	{
		DataRow[] rows = dt.Select(sColumnName + "='" + sValue + "'");
		if(rows.Length <= 0) return null;
		return rows[0][dColumnName];
	}
}
