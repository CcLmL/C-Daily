<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditUserPage.aspx.cs" Inherits="EditUserPage" Title="Untitled Page" %>

<%@ Register Src="controls/EditUser.ascx" TagName="EditUser" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EditUser ID="EditUser1" runat="server" />
</asp:Content>

