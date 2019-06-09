<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ExcuteReader.aspx.cs" Inherits="ExcuteReader" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;</div>
        <table style="width: 411px">
            <tr>
                <td>
                    执行的语句：</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtsql" runat="server" Width="263px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="执行" Width="96px" /></td>
            </tr>
            <tr>
                <td>
                    执行结果：</td>
            </tr>
            <tr>
                <td>
        <asp:DataList ID="DataList1" runat="server" Width="400px">
        <ItemTemplate>
        员工姓名：<%# Eval("lname") %><br />
        雇佣时间：<%# Eval("hire_date") %><br/>
        </ItemTemplate>
        </asp:DataList></td>
            </tr>
        </table>
    </form>
</body>
</html>
