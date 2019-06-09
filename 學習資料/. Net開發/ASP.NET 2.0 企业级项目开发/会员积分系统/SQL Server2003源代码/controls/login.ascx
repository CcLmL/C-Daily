<%@ Control Language="C#" AutoEventWireup="true" CodeFile="login.ascx.cs" Inherits="controls_login" %>
<asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate" CreateUserText="注册" CreateUserUrl="~/RegisterPage.aspx">
</asp:Login>
