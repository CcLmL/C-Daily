<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddUser.ascx.cs" Inherits="controls_AddUser" %>
<%@ Register Src="UserType.ascx" TagName="UserType" TagPrefix="uc1" %>
<%@ Register Src="UserStateUC.ascx" TagName="UserStateUC" TagPrefix="uc2" %>
<%@ Register Src="UserGradeUC.ascx" TagName="UserGradeUC" TagPrefix="uc3" %>
<%@ Register Src="UserTypeUC.ascx" TagName="UserTypeUC" TagPrefix="uc4" %>
&nbsp;
<table style="width: 810px">
    <tr>
        <td style="width: 117px; height: 26px">
            客户名称：</td>
        <td style="width: 151px; height: 26px">
            <asp:TextBox ID="txtusername" runat="server" Width="212px"></asp:TextBox>*</td>
        <td style="width: 155px; height: 26px">
            软件版本：</td>
        <td style="width: 164px; height: 26px">
            <asp:TextBox ID="softversion" runat="server"></asp:TextBox>*</td>
    </tr>
    <tr>
        <td style="width: 117px">
            行业类型：</td>
        <td style="width: 151px">
            <uc4:UserTypeUC ID="UserTypeUC1" runat="server"  />
            *</td>
        <td style="width: 155px">
            客户状态：</td>
        <td style="width: 164px">
            <uc2:UserStateUC ID="UserStateUC2" runat="server" />
            *</td>
    </tr>
    <tr>
        <td style="width: 117px">
            客户等级：</td>
        <td style="width: 151px">
            <uc3:UserGradeUC ID="UserGradeUC1" runat="server" />
            *</td>
        <td style="width: 155px">
            所在城市：</td>
        <td style="width: 164px">
            <asp:TextBox ID="txtcity" runat="server"></asp:TextBox>*</td>
    </tr>
</table>
<hr style="width: 696px" />
<table style="width: 817px">
    <tr>
        <td style="width: 122px; height: 26px">
            客户地址：</td>
        <td style="width: 172px; height: 26px">
            <asp:TextBox ID="txtaddress" runat="server" Width="215px"></asp:TextBox></td>
        <td style="width: 160px; height: 26px">
            联系人：</td>
        <td style="width: 187px; height: 26px">
            <asp:TextBox ID="txtlinkman" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 122px; height: 26px;">
            联系电话：</td>
        <td style="width: 172px; height: 26px;">
            <asp:TextBox ID="txtphone" runat="server" Width="213px"></asp:TextBox></td>
        <td style="width: 160px; height: 26px;">
            传真：</td>
        <td style="width: 187px; height: 26px;">
            <asp:TextBox ID="txtfax" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 122px; height: 26px;">
            E-Mail：</td>
        <td style="width: 172px; height: 26px;">
            <asp:TextBox ID="txtmail" runat="server" Width="210px"></asp:TextBox></td>
        <td style="width: 160px; height: 26px;">
            QQ：</td>
        <td style="width: 187px; height: 26px;">
            <asp:TextBox ID="txtqq" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 122px; height: 21px">
            员工数量：</td>
        <td style="width: 172px; height: 21px">
            <asp:TextBox ID="txtpeople" runat="server" Width="209px"></asp:TextBox></td>
        <td style="width: 160px; height: 21px">
        </td>
        <td style="width: 187px; height: 21px">
        </td>
    </tr>
    <tr>
        <td style="width: 122px; height: 21px">
        </td>
        <td style="width: 172px; height: 21px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加客户" Width="121px" /></td>
        <td style="width: 160px; height: 21px">
        </td>
        <td style="width: 187px; height: 21px">
            <asp:Label ID="Label1" runat="server" Width="165px"></asp:Label></td>
    </tr>
</table>
<asp:ValidationSummary ID="ValidationSummary1" runat="server" Width="654px" />
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtusername"
    ErrorMessage="请填写用户名称"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="softversion"
    ErrorMessage="请填写软件软本"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtcity"
    ErrorMessage="请填写所在城市"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtmail"
    ErrorMessage="E-Mail格式不正确" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
