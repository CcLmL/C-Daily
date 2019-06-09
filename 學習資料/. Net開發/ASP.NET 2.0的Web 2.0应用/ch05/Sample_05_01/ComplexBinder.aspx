<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
	protected void Page_Load(object sender,EventArgs e)
	{
		if(!Page.IsPostBack)
		{   ///创建颜色数组
			System.Collections.ArrayList colors = new ArrayList();
			colors.Add("Red");
			colors.Add("Blue");
			colors.Add("Green");
			colors.Add("Black");
			colors.Add("Yellow");
			colors.Add("Gray");
			
			///把colors设置为ListBox控件lbColor的数据源，并绑定控件的数据
			lbColor.DataSource = colors;
			lbColor.DataBind();
		}
	}

	protected void lbColor_SelectedIndexChanged(object sender,EventArgs e)
	{
		if(lbColor.SelectedIndex > -1)
		{   ///把控件的前景颜色设置为选择项的颜色
			lbColor.ForeColor = System.Drawing.Color.FromName(lbColor.SelectedItem.Text);
		}
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>复杂数据绑定</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:ListBox ID="lbColor" runat="server" Rows="10" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="lbColor_SelectedIndexChanged"></asp:ListBox>
    </div>
    </form>
</body>
</html>
