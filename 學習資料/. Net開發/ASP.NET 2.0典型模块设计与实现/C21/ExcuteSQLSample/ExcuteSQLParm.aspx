﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ExcuteSQLParm.aspx.cs" Inherits="ExcuteSQLParm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 470px; height: 159px">
            <tr>
                <td>
                    参数名：<asp:TextBox ID="txtparm" runat="server" Width="256px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    参数值：<asp:TextBox ID="txtvalue" runat="server" Width="252px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    要执行的语句：</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtsql" runat="server" Width="438px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="执行" Width="116px" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
