<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CardCountPage.aspx.cs" Inherits="CardCountPage" Title="Untitled Page" %>

<%@ Register Src="controls/CardCount.ascx" TagName="CardCount" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:CardCount id="CardCount1" runat="server">
    </uc1:CardCount>
</asp:Content>

