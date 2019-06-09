<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StockSalePage.aspx.cs" Inherits="StockSalePage" Title="Untitled Page" %>

<%@ Register Src="controls/StockSale.ascx" TagName="StockSale" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:StockSale id="StockSale1" runat="server">
    </uc1:StockSale>
</asp:Content>

