<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LinkRecordPage.aspx.cs" Inherits="LinkRecordPage" Title="Untitled Page" %>

<%@ Register Src="controls/AddLinkRecord.ascx" TagName="AddLinkRecord" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AddLinkRecord ID="AddLinkRecord1" runat="server" />
</asp:Content>

