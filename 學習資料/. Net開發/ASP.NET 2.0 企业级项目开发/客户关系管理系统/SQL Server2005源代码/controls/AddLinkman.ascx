<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddLinkman.ascx.cs" Inherits="controls_AddLinkman" %>
<table style="width: 810px">
    <tr>
        <td style="width: 117px; height: 26px">
            姓名：</td>
        <td style="width: 151px; height: 26px">
            <asp:TextBox ID="txtname" runat="server" Width="158px"></asp:TextBox>*</td>
        <td style="width: 155px; height: 26px">
            性别：</td>
        <td style="width: 164px; height: 26px">
            <asp:DropDownList ID="ddlsex" runat="server">
                <asp:ListItem Selected="True" Value="0">男</asp:ListItem>
                <asp:ListItem Value="1">女</asp:ListItem>
            </asp:DropDownList></td>
    </tr>
    <tr>
        <td style="width: 117px">
            移动电话：</td>
        <td style="width: 151px">
            <asp:TextBox ID="txtphone" runat="server" Width="157px"></asp:TextBox></td>
        <td style="width: 155px">
            E-Mail：：</td>
        <td style="width: 164px">
            <asp:TextBox ID="txtmail" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 117px">
            爱好：</td>
        <td style="width: 151px">
            <asp:TextBox ID="txtlike" runat="server" Width="155px"></asp:TextBox></td>
        <td style="width: 155px">
            QQ：</td>
        <td style="width: 164px">
            <asp:TextBox ID="txtqq" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 117px">
            备注：</td>
        <td style="width: 151px">
            <asp:TextBox ID="txtnote" runat="server"></asp:TextBox></td>
        <td style="width: 155px">
            所在单位：</td>
        <td style="width: 164px">
            <asp:TextBox ID="txtcompany" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 151px">
            生日：</td>
        <td style="width: 155px">
            <asp:Calendar ID="Calendar1" runat="server" Width="174px"></asp:Calendar>
        </td>
        <td style="width: 164px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加联系人" Width="121px" /></td>
    </tr>
    <tr>
        <td style="width: 117px">
        </td>
        <td style="width: 151px">
            </td>
        <td style="width: 155px">
            <asp:Label ID="Label1" runat="server" Width="165px"></asp:Label></td>
        <td style="width: 164px">
        </td>
    </tr>
</table>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname"
    ErrorMessage="姓名必须填写"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtmail"
    ErrorMessage="MAIL格式不正确" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>