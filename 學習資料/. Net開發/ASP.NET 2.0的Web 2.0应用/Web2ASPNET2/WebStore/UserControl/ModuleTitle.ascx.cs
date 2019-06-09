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

public partial class UserControl_ModuleTitle:System.Web.UI.UserControl
{
	/// <summary>
	/// 模块的标题
	/// </summary>
	protected string title;
	public string Title
	{
		get
		{
			return (title);
		}
		set
		{
			title = value;
		}
	}

	protected void Page_Load(object sender,EventArgs e)
	{   ///绑定数据
		this.DataBind();
	}
}
