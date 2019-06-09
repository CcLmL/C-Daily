using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace Web2ASPNET2.WebStore
{
	public enum ThreadState:byte
	{
		Read   = 0,    /// 00
		Edit   = 1,    /// 01
		Delete = 2,    /// 10
		Other  = 3     /// 11
	}

	public enum IPProhibitState:byte
	{
		Prohibit = 0,
		Allow = 1
	}

	public class WebStore
	{
		public static int TextStringLength = 2147483647;
		public static int NormalRoleID = 2;
		public static int WebStoreProjectID = 4;
		public WebStore()
		{
			///
		}
	}
}
