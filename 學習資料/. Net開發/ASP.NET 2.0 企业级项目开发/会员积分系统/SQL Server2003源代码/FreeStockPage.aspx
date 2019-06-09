<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FreeStockPage.aspx.cs" Inherits="FreeStockPage" Title="Untitled Page" %>

<%@ Register Src="controls/FreeStock.ascx" TagName="FreeStock" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:FreeStock ID="FreeStock1" runat="server" />
    <a href="~/controls/FreeStock.ascx"></a></asp:Content>

