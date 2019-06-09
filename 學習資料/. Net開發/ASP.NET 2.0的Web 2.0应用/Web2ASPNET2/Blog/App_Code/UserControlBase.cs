using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace Web2ASPNET2.WebBlog
{
	public class UserControlBase:System.Web.UI.UserControl
	{
		public UserControlBase()
		{
			
		}

		/// <summary>
		/// 模块的标题
		/// </summary>
		private string title;
		public string Title
		{
			get { return title; }
			set { title = value; }
		}

		/// <summary>
		/// 模块的虚拟地址
		/// </summary>
		private string src;
		public string Src
		{
			get { return src; }
			set { src = value; }
		}

		/// <summary>
		/// 模块的显示顺序
		/// </summary>
		private int showOrder;
		public int ShowOrder
		{
			get { return showOrder; }
			set { showOrder = value; }
		}

		/// <summary>
		/// 模块的参数
		/// </summary>
		private string commandArgument;
		public string CommandArgument
		{
			get { return commandArgument; }
			set { commandArgument = value; }
		}
	}
}
