using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;

namespace Web2ASPNET2.WebBlog
{
	public class TableCellBase
	{
		public TableCellBase()
		{
		
		}

		/// <summary>
		/// 模块的ID值
		/// </summary>
		private string id;
		public string ID
		{
			get { return id; }
			set { id = value; }
		}
		
		/// <summary>
		/// 模块的宽度
		/// </summary>
		private string width;
		public string Width
		{
			get { return width; }
			set { width = value; }
		}

		/// <summary>
		/// 模块的高度
		/// </summary>
		private string height;
		public string Height
		{
			get { return height; }
			set { height = value; }
		}

		/// <summary>
		/// 模块的前景颜色
		/// </summary>
		private string foreColor;
		public string ForeColor
		{
			get { return foreColor; }
			set { foreColor = value; }
		}

		/// <summary>
		/// 模块的背景颜色
		/// </summary>
		private string bgColor;
		public string BgColor
		{
			get { return bgColor; }
			set { bgColor = value; }
		}

		/// <summary>
		/// 包含的子模块列表
		/// </summary>
		private ArrayList modules;
		public ArrayList Modules
		{
			get { return modules; }
			set { modules = value; }
		}
	}
}
