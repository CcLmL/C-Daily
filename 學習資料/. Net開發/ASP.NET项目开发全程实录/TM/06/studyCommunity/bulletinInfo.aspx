<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bulletinInfo.aspx.cs" Inherits="bulletinInfo" %>

<%@ Register Src="dh.ascx" TagName="dh" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body style="font-size: 12pt">
    <form id="form1" runat="server">
    <div style="text-align: center">
                    <table style="width: 353px; height: 244px; text-align: center;" >
                    <tr>
                    <td align="center" style="height: 1px; width: 429px; font-size: 12px; color: #cc33ff;">
                    <span   id="lbTitle" runat="server" style="font-size: 20pt" >文章标题</span>
                    </td>
                    </tr>
                    <tr>
                    <td style="height: 75px; width: 429px;" valign="top">
                    <%=Content%>                    
                    </td>
                    </tr>
                        <tr>
                            <td align="right" style="width: 429px; height: 43px" valign="top">
                    <asp:Label ID="labDate" runat="server" Width="166px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 429px; height: 37px; text-align: center" valign="top">
                                &nbsp;<input id="Button2" type="button" onclick="window.close();" value="关 闭" /></td>
                        </tr>
                    
                    </table>
    
    </div>
    </form>
</body>
</html>
