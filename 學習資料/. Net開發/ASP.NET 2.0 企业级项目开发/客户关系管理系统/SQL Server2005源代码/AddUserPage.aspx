<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddUserPage.aspx.cs" Inherits="AddUserPage" Title="Untitled Page" %>

<%@ Register Src="controls/AddUser.ascx" TagName="AddUser" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AddUser ID="AddUser1" runat="server" />
</asp:Content>

