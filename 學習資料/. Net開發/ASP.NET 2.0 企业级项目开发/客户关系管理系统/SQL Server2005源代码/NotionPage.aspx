<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NotionPage.aspx.cs" Inherits="NotionPage" Title="Untitled Page" %>

<%@ Register Src="controls/Notion.ascx" TagName="Notion" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:Notion id="Notion1" runat="server">
    </uc1:Notion>
</asp:Content>

