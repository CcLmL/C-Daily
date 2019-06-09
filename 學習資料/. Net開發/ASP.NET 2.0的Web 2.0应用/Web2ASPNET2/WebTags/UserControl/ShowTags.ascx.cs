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
using Web2ASPNET2.WebTags;
using System.Data.SqlClient;

public partial class UserControl_ShowTags:System.Web.UI.UserControl
{
	protected void Page_Load(object sender,EventArgs e)
	{	///绑定控件的数据
		if(!Page.IsPostBack)
		{
			BindPageData();
		}
	}
	private void BindPageData()
	{   ///绑定控件的数据
		Tag tag = new Tag();
		SqlDataReader dr = tag.GetTags();
		if(dr == null) return;
		///创建保存数据的DataTable对象
		DataTable dt = new DataTable();
		dt.Columns.Add(new DataColumn("ID",typeof(int)));
		dt.Columns.Add(new DataColumn("Name",typeof(string)));
		dt.Columns.Add(new DataColumn("ViewCount",typeof(int)));
		int count = 0;
		while(dr.Read() && count < 10)
		{   ///读取一行数据
			DataRow row = dt.NewRow();
			row["ID"] = dr["ID"];
			row["Name"] = dr["Name"];
			row["ViewCount"] = dr["ViewCount"];
			///添加到dt中
			dt.Rows.Add(row);
			count++;
		}
		dr.Close();	
		///绑定控件的数据
		Web2ASPNET2.CommonOperation.DataBinder.BindDataListData(
		    dlTag,dt);
	}
}
