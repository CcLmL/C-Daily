<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="loginPage.aspx.cs" Inherits="loginPage" Title="Untitled Page" %>

<%@ Register Src="controls/login.ascx" TagName="login" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:login ID="Login1" runat="server" />
</asp:Content>

