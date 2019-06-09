<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProcessSample.aspx.cs" Inherits="ProcessSample" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <input  name="file1" type="file" />
        <asp:Button ID="Button1" runat="server" Text="上传" Width="79px" OnClick="Button1_Click" /></div>
    </form>
</body>
</html>
