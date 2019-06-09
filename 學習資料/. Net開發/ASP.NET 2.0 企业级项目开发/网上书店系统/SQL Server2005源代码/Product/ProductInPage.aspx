<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductInPage.aspx.cs" Inherits="Product_ProductInPage" Title="Untitled Page" %>

<%@ Register Src="../controls/ProductIn.ascx" TagName="ProductIn" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ProductIn id="ProductIn1" runat="server">
    </uc1:ProductIn>
</asp:Content>

