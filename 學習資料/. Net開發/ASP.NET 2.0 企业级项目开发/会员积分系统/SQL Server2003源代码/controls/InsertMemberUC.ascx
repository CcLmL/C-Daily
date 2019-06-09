<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InsertMemberUC.ascx.cs" Inherits="controls_InsertMemberUC" %>
<table style="width: 548px; height: 211px;">
    <tr>
        <td style="width: 102px">
        </td>
        <td style="width: 172px"><b>添加会员信息</b>
        </td>
        <td style="width: 113px">
        </td>
    </tr>
    <tr>
        <td style="width: 102px">
            <asp:Label ID="Label1" runat="server" Text="会员姓名" Width="92px"></asp:Label></td>
        <td style="width: 172px">
            <asp:TextBox ID="txtname" runat="server"></asp:TextBox>*</td>
        <td style="width: 113px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname"
                ErrorMessage="会员姓名必须填写" ForeColor="Black" Width="155px"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 102px; height: 17px;">
            <asp:Label ID="Label2" runat="server" Text="身份证号" Width="90px"></asp:Label></td>
        <td style="width: 172px; height: 17px;">
            <asp:TextBox ID="txtidentity" runat="server"></asp:TextBox>*</td>
        <td style="width: 113px; height: 17px;">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtidentity"
                ErrorMessage="身份证必须填写" Width="129px" ForeColor="Black"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtidentity"
                ErrorMessage="身份证只允许输入数字" ValidationExpression="\d{17}[\d|X]|\d{15}" Width="164px" ForeColor="Black"></asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td style="width: 102px; height: 26px;">
            <asp:Label ID="Label3" runat="server" Text="联系电话" Width="97px"></asp:Label></td>
        <td style="width: 172px; height: 26px;">
            <asp:TextBox ID="txtphone" runat="server"></asp:TextBox></td>
        <td style="width: 113px; height: 26px">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtphone"
                ErrorMessage="电话只能输入数字" ValidationExpression="(\(\d{3}\)|\d{3}-)?\d{8}" ForeColor="Black" Width="159px"></asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td style="width: 102px">
            <asp:Label ID="Label4" runat="server" Text="联系地址" Width="95px"></asp:Label></td>
        <td style="width: 172px">
            <asp:TextBox ID="txtaddress" runat="server"></asp:TextBox></td>
        <td style="width: 113px">
        </td>
    </tr>
    <tr>
        <td style="width: 102px">
            <asp:Label ID="Label5" runat="server" Text="会员卡号" Width="93px"></asp:Label></td>
        <td style="width: 172px">
            <asp:TextBox ID="txtcardnum" runat="server"></asp:TextBox>*</td>
        <td style="width: 113px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtcardnum"
                ErrorMessage="会员卡号必须填写" ForeColor="Black" Width="159px"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 102px; height: 54px;">
            <asp:Label ID="Label6" runat="server" Text="卡类型" Width="90px"></asp:Label></td>
        <td style="width: 172px; height: 54px;">
            <asp:DropDownList ID="ddlcardtype" runat="server" Width="154px" DataSourceID="SqlDataSource1" DataTextField="CardTypeName" DataValueField="CardTypeName">
            </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MemberCardConnectionString %>"
                SelectCommand="SELECT [CardTypeName] FROM [CardType]"></asp:SqlDataSource>
            </td>
        <td style="width: 113px; height: 54px;">
        </td>
    </tr>
    <tr>
        <td style="width: 102px; height: 26px;">
        </td>
        <td style="width: 172px; height: 26px;">
            <asp:Button ID="btnadd" runat="server" Text="添加" OnClick="btnadd_Click" />
            <asp:Label ID="Label7" runat="server" Width="117px"></asp:Label></td>
        <td style="width: 113px; height: 26px;">
        </td>
    </tr>

</table>
