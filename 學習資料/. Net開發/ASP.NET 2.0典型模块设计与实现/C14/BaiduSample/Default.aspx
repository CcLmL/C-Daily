<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <SCRIPT language="javascript">
    function g(formname){
    var url = "http://www.baidu.com/baidu";
    if (formname.s[1].checked) {
    formname.ct.value = "2097152";
    }
    else {
    formname.ct.value = "0";
    }
    formname.action = url;
    return true;
    }
</SCRIPT>

</head>
<body>
    <form id="form1" runat="server" onsubmit="return g(this)">

<table style="font-size:9pt;">
<tr height="100"><td valign="top"><img src="http://img.baidu.com/img/logo_yy.gif" border="0" alt="baidu"></td>
<td>
<input name=word size="30" maxlength="100">
<input type="submit" value="百度搜索"><br>
<input name=tn type=hidden value="bds">
<input name=cl type=hidden value="3">
<input name=ct type=hidden>
<input name=si type=hidden value="www.zhannei.com">
<input name=s type=radio> 互联网
<input name=s type=radio checked> 站内
</td></tr></table>
    </form>
</body>
</html>
