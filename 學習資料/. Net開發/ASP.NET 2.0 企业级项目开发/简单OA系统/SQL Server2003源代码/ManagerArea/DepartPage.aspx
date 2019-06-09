<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DepartPage.aspx.cs" Inherits="ManagerArea_DepartPage" Title="Untitled Page" %>

<%@ Register Src="../controls/DepartSet.ascx" TagName="DepartSet" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:DepartSet ID="DepartSet1" runat="server" />
</asp:Content>

