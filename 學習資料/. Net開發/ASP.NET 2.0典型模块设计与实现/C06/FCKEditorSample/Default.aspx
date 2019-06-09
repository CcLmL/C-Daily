<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" BasePath="/FCKEditor/Files/">
        </FCKeditorV2:FCKeditor>
    
    </div>
    </form>
</body>
</html>
