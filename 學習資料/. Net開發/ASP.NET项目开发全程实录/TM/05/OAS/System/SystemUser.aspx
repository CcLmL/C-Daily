<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SystemUser.aspx.cs" Inherits="System_SystemUser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table id="table1" align="center" border="0" class="css" language="javascript" onclick="return table1_onclick()"
            style="width: 365px; height: 126px" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center" class="csstitle" colspan="3" style="height: 20px">
                    系统操作员设置</td>
            </tr>
            <tr>
                <td style="width: 2334px; height: 16px">
                    职员姓名：</td>
                <td style="width: 374px; height: 16px">
                    <asp:DropDownList ID="dlEmployee" runat="server" Width="153px">
                    </asp:DropDownList></td>
                <td rowspan="2" style="width: 204px">
                    &nbsp;<asp:ListBox ID="ListBox1" runat="server" Height="90px" Width="105px">
                    </asp:ListBox></td>
            </tr>
            <tr>
                <td style="width: 2334px">
                    系统密码：</td>
                <td style="width: 374px">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="inputcss" Width="150px"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Button ID="Button1" runat="server" CssClass="greenbuttoncss" OnClick="Button1_Click"
                        Text="保存密码" /></td>
                <td align="center" style="width: 204px">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click"
                        Text="删除操作员" /></td>
            </tr>
        </table>
    
    </div>
        
    </form>
</body>
</html>
