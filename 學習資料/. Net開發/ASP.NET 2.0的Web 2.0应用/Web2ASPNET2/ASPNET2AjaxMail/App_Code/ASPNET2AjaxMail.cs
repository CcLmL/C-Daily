using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace Web2ASPNET2.ASPNET2AjaxMail
{
	public class ASPNET2AjaxMail
	{
		public static int TextStringLength = 2147483647;
		public static int NormalRoleID = 2;
		public static int ASPNET2AjaxMailProjectID = 4;
		public ASPNET2AjaxMail()
		{
			///
		}
	}

	public class FilterBase:System.Web.UI.UserControl
	{
		private string key = string.Empty;
		public virtual string Key
		{
			get { return key; }
		}

		public FilterBase() { }
	}
}
