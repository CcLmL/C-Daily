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
using System.Data.SqlClient;
using Web2ASPNET2.WebBlog;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;

public partial class Index_Index:Web2ASPNET2.WebBlog.PageBase
{
	protected void Page_Load(object sender,EventArgs e)
	{   ///获取日期
		if(Request.Params["Date"] != null)
		{
			CommandArgument = Request.Params["Date"].ToString();
			ParameterType = ParameterTypes.Date;
			///导入控件
			LoadUserControl();
			return;
		}			
		///获取种类的ID值
		if(Request.Params["CatalogID"] != null)
		{
			CommandArgument = Request.Params["CatalogID"].ToString();
			ParameterType = ParameterTypes.ID;
		}
		else
		{   ///获取数据
			GetPageData();
		}
		///导入控件
		LoadUserControl();
	}

	private void GetPageData()
	{   ///获取种类数据
		Catalog catalog = new Catalog();
		SqlDataReader dr = catalog.GetCatalogs();
		if(dr == null)return ;
		if(dr.Read())
		{   ///设置属性的值
			CommandArgument = dr["ID"].ToString();
			ParameterType = ParameterTypes.ID;
		}
		dr.Close();
	}

	private void LoadUserControl()
	{   ///获取界面的配置
		TableCellBase[] cellList = OperateXmlFile.GetIndexPage(WebBlog.Face);
		if(cellList == null) return;
		foreach(TableCellBase cell in cellList)
		{   ///找到装载导入控件的模板
			HtmlTableCell tc = (HtmlTableCell)FindControl(cell.ID);
			if(tc == null) continue;
			tc.BgColor = cell.BgColor;
			tc.Width = cell.Width;
			tc.Height = cell.Height;
			///导入控件
			foreach(UserControlBase control in cell.Modules)
			{
				control.CommandArgument = "0";
				tc.Controls.Add(Page.LoadControl(control.Src));
			}
		}
	}
}
