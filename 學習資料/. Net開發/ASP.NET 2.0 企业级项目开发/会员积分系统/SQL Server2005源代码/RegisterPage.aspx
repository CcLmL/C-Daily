<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RegisterPage.aspx.cs" Inherits="RegisterPage" Title="Untitled Page" %>

<%@ Register Src="controls/Register.ascx" TagName="Register" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:Register ID="Register1" runat="server" />
</asp:Content>

