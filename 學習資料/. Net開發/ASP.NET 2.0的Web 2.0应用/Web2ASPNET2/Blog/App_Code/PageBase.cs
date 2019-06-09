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
	/// <summary>
	/// 页面参数类型的枚举
	/// </summary>
	public enum ParameterTypes
	{
		ID,
		Date,
		Other
	}

	public class PageBase:System.Web.UI.Page
	{
		public PageBase()
		{

		}

		/// <summary>
		/// 页面的参数
		/// </summary>
		private string commandArgument;
		public string CommandArgument
		{
			get { return commandArgument; }
			set { commandArgument = value; }
		}

		/// <summary>
		/// 页面的参数类型
		/// </summary>
		private ParameterTypes parameterType;
		public ParameterTypes ParameterType
		{
			get { return parameterType; }
			set { parameterType = value; }
		}
	}
}
