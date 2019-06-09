using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace Web2ASPNET2.WebTags
{
	public enum TagState:byte
	{
		Public = 0,
		Friendly = 1,
		Private = 2
	}

	public class WebTags
	{
		public static int TextStringLength = 2147483647;
		public static int NormalRoleID = 2;
		public static int WebTagsProjectID = 4;
		public WebTags()
		{
			///
		}
	}
}
