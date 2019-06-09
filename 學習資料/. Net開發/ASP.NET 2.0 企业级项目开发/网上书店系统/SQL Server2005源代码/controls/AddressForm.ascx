<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddressForm.ascx.cs" Inherits="controls_AddressForm" %>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td class="label" colspan="3" valign="top">
            姓名<br />
            <asp:TextBox ID="txtName" runat="server" Columns="30" CssClass="checkoutTextbox"
                MaxLength="80" Width="155px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="valFirstName" runat="server" ControlToValidate="txtName"
                 ErrorMessage="请输入姓名"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td class="label" colspan="3" valign="top">
            地址<br />
            <asp:TextBox ID="txtAddress" runat="server" Columns="55" CssClass="checkoutTextbox"
                MaxLength="80" Width="330px"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="valAddress1" runat="server" ControlToValidate="txtAddress"
                ErrorMessage="请输入地址"></asp:RequiredFieldValidator>&nbsp;&nbsp;
        </td>
    </tr>
    <tr>
        <td class="label" style="height: 19px" valign="top" colspan="3">
            邮编<br />
            <asp:TextBox ID="txtZip" runat="server" Columns="12" CssClass="checkoutTextbox" MaxLength="20"
                Width="150px"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="valZip" runat="server" ControlToValidate="txtZip"
                CssClass="asterisk" Display="Dynamic" ErrorMessage="请输入邮编"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="label" style="height: 19px" valign="top" colspan="3">
            国家<br />
            <asp:DropDownList ID="listCountry" runat="server" CssClass="checkoutDropdown" Width="150px">
                <asp:ListItem Value="USA">USA</asp:ListItem>
                <asp:ListItem Value="China" Selected="True">China</asp:ListItem>
                <asp:ListItem Value="England">England</asp:ListItem>
            </asp:DropDownList><br />
            &nbsp; </td>
    </tr>
    <tr>
        <td class="label" colspan="3" valign="top">
            电话<br />
            <asp:TextBox ID="txtPhone" runat="server" Columns="20" CssClass="checkoutTextbox"
                MaxLength="20" Width="155px"></asp:TextBox><asp:RequiredFieldValidator ID="valPhone" runat="server" ControlToValidate="txtPhone"
                CssClass="asterisk" ErrorMessage="请输入电话"></asp:RequiredFieldValidator>&nbsp;&nbsp;</td>
    </tr>
    <tr>
        <td class="label" colspan="3" style="height: 62px" valign="top">Email<br />
            <asp:TextBox ID="txtEmail" runat="server" Columns="55" CssClass="checkoutTextbox"
                MaxLength="80" Width="330px"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="valEmail" runat="server" ControlToValidate="txtEmail"
                CssClass="asterisk" Display="Dynamic" ErrorMessage="请输入邮箱"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                    ID="valEmail1" runat="server" ControlToValidate="txtEmail" CssClass="asterisk"
                    Display="Dynamic" ErrorMessage="Email 格式错误" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>&nbsp;&nbsp;
        </td>
    </tr>
</table>
