<%@ Page Language="C#"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>显示图片</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:Image ID="ixp" runat="server" ImageUrl="~/Images/xp.jpg" Width="80px" />
		<img src="Images/xp.jpg" alt="XP图片" width="80" /><br />
		<asp:ImageMap ID="imxp" runat="server" ImageUrl="~/Images/xp.jpg" Width="400px">
			<asp:RectangleHotSpot HotSpotMode="Navigate" Right="200" Top="200" AlternateText="这是第一个区域" Target="_blank" />
		</asp:ImageMap>
    </div>
    </form>
</body>
</html>
