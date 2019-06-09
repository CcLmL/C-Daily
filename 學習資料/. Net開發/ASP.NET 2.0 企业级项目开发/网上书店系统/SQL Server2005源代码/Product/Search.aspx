<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" Title="Untitled Page" %>

<%@ Register Src="../controls/SearchControl.ascx" TagName="SearchControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:SearchControl ID="SearchControl1" runat="server" />
</asp:Content>

