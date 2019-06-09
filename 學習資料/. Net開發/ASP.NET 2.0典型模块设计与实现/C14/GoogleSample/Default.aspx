<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
<!-- SiteSearch Google -->
<form method=get action="http://www.google.com/search">
<table bgcolor="#FFFFFF"><tr><td>
<a href="http://www.google.com/">
<img src="http://www.google.com/logos/Logo_40wht.gif" 
border="0" alt="Google"></a>
</td>
<td>
<input type=text name=q size=31 maxlength=255 value="">
<input type=hidden name=ie value=utf-8>
<input type=hidden name=oe value=GB2312>
<input type=hidden name=hl value=zh-CN>
<input type=submit name=btnG value="Google 搜索">
<font size=-1>
<input type=hidden name=domains value="站内"><br>
<input type=radio name=sitesearch value=""> 搜索万网 
<input type=radio name=sitesearch value="http://localhost/Default.aspx" checked> 搜索站内
</font>
</td></tr></table>

</form>
<!-- SiteSearch Google --> 
</body>
</html>
