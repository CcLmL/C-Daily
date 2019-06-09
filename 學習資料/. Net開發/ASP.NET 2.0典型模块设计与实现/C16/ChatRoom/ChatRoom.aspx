<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChatRoom.aspx.cs" Inherits="ChatRoom" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-Frameset.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<frameset rows="*" cols="150,*" frameborder="1" border="1" framespacing="0">
  <frame border = 1 src="viewonline.aspx" name="leftFrame" scrolling="yes" noresize>
  <frameset rows="*,100" frameborder="1" border="1" framespacing="0">
    <frame border = 1 src="viewmsg.aspx" name="showmsg"  scrolling = "yes">
    <frame border = 1 src="postmsg.aspx" name="bottomFrame" scrolling="no" noresize>
  </frameset>
</frameset>
<noframes><body>
</body></noframes>
</html>
