<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RolePage.aspx.cs" Inherits="ManagerArea_RolePage" Title="Untitled Page" %>

<%@ Register Src="../controls/RoleManager.ascx" TagName="RoleManager" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:RoleManager ID="RoleManager1" runat="server" />
</asp:Content>

