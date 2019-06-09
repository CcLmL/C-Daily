<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Portal_Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>社会标签系统管理后台</title>
</head>
	<frameset id="IndexFrame" rows="80,*" frameborder="1" border="0" framespacing="0">
		<frame id="Header" name="Header" scrolling="no" src="../UserControl/Header.aspx" noresize ></frame>
		<frameset id="MainFrame" cols="180,*" rows="*" border="0" framespacing="0">
			<frame name="Tree" src="OperateTree.aspx" scrolling="auto" frameborder="0" noresize></frame>
			<frame name="Desktop" src="Desktop.aspx" scrolling="auto" frameborder="0"></frame>
		</frameset>
	</frameset>
</html>
