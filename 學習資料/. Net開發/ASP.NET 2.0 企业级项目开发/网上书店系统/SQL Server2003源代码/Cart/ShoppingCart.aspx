<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="Cart_ShoppingCart" Title="Untitled Page" %>

<%@ Register Src="../controls/ShoppingCartControl.ascx" TagName="ShoppingCartControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ShoppingCartControl id="ShoppingCartControl1" runat="server">
    </uc1:ShoppingCartControl>
</asp:Content>

