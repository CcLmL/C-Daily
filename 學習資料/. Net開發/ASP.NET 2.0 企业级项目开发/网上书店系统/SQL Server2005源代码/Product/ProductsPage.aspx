<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductsPage.aspx.cs" Inherits="Product_ProductsPage" Title="Untitled Page" %>

<%@ Register Src="../controls/Products.ascx" TagName="Products" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:Products ID="Products1" runat="server" />
</asp:Content>

