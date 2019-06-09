<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="Manager_AddCategory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 453px; height: 289px">
            <tr>
                <td style="width: 125px">
                </td>
                <td style="color: black">
                    <b>论坛类别添加主界面</b></td>
            </tr>
            <tr>
                <td style="width: 125px">
                    论坛名称：</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="289px"></asp:TextBox>
                    *<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="论坛名称不能为空"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 125px">
                    论坛描述信息：</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Rows="8" TextMode="MultiLine" Width="296px"></asp:TextBox>
                    *<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                        ErrorMessage="论坛描述信息不能为空"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 125px; height: 24px">
                </td>
                <td style="height: 24px">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加类别" Width="109px" /></td>
            </tr>
            <tr>
                <td style="width: 125px; height: 24px">
                </td>
                <td style="height: 24px">
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
