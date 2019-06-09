<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
	protected void Page_Load(object sender,EventArgs e)
	{   ///保存上一页的地址
		if(!Page.IsPostBack)
		{
			ViewState["PREVURL"] = Request.UrlReferrer.ToString();
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   ///返回上一页
		Response.Redirect(ViewState["PREVURL"].ToString());
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>目的页面</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:Button ID="btnReturn" runat="server" Text="返回上一页" OnClick="btnReturn_Click" />
    </div>
    </form>
</body>
</html>
