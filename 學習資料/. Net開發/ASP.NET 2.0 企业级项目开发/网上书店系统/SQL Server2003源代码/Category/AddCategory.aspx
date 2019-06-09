<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="Category_AddCategory" Title="Untitled Page" %>

<%@ Register Src="../controls/AddCategory.ascx" TagName="AddCategory" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AddCategory ID="AddCategory1" runat="server" />
    <a href="../Category/AddCategory.aspx"></a>

</asp:Content>

