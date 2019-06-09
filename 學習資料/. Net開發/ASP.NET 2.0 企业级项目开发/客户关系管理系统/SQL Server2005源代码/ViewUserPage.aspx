<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewUserPage.aspx.cs" Inherits="ViewUserPage" Title="Untitled Page" %>

<%@ Register Src="controls/ViewUser.ascx" TagName="ViewUser" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ViewUser ID="ViewUser1" runat="server" />
</asp:Content>

