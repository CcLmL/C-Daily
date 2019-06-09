<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BargainPage.aspx.cs" Inherits="BargainPage" Title="Untitled Page" %>

<%@ Register Src="controls/Bargain.ascx" TagName="Bargain" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:Bargain ID="Bargain1" runat="server" />
</asp:Content>

