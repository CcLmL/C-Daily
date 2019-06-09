<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GuestIndex.aspx.cs" Inherits="Portal_GuestIndex" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head id="Head1" runat="server">
    <title>Web2ASPNET2----XMLBBS普通用户操作平台</title>
</head>
	<frameset id="IndexFrame" rows="80,*" frameborder="1" border="0" framespacing="0">
		<frame id="Header" name="Header" scrolling="no" src="../UserControl/Header.aspx" noresize ></frame>
		<frameset id="MainFrame" cols="180,*" rows="*" border="0" framespacing="0">
			<frame name="Tree" src="GuestOperateTree.aspx" scrolling="auto" frameborder="0" noresize></frame>
			<frame name="Desktop" src="ViewBoard.aspx?BoardID=0" scrolling="auto" frameborder="0"></frame>
		</frameset>
	</frameset>
</html>
