<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChatWin.aspx.cs" Inherits="ChatWin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
			<TABLE id="Table6" cellSpacing="0" cellPadding="0" width="456" align="center" border="0">
				<TR>
					<TD width="8" height="8"></TD>
					<TD bgColor="orange" height="22" rowSpan="2" width="224" vAlign="bottom"><STRONG>聊天室</STRONG></TD>
					<TD vAlign="bottom" align="right" width="224" bgColor="orange" height="22" rowSpan="2"></TD>
					<TD height="8" style="width: 9px"></TD>
				</TR>
				<TR>
					<TD bgColor="orange" style="height: 14px"></TD>
					<TD bgColor="orange" style="width: 9px; height: 14px"></TD>
				</TR>
			</TABLE>
			<TABLE id="Table3" cellSpacing="0" cellPadding="1" border="0" align="center" bgColor="orange">
				<TR>
					<TD>
						<iframe style="BORDER-RIGHT: orange 2px solid; BORDER-TOP: orange 2px solid; BORDER-LEFT: orange 2px solid; WIDTH: 450px; BORDER-BOTTOM: orange 2px solid; HEIGHT: 250px; BACKGROUND-COLOR: #ffffcc"
							src="TheChatScreenWin.aspx">Chat</iframe>
					</TD>
				</TR>
				<TR>
					<TD align="right" style="height: 27px">
						聊天信息:
						<asp:TextBox id="TB_ToSend" runat="server" Width="300px" tabIndex="1"></asp:TextBox>
						<asp:Button id="BT_Send" runat="server" Text="发送" Width="80px" CssClass="button1" tabIndex="2" OnClick="BT_Send_Click"></asp:Button>
					</TD>
				</TR>
			</TABLE>
    </form>
</body>
</html>
