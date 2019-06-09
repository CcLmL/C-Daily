<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GetHistotyPage.aspx.cs" Inherits="GetHistotyPage" Title="Untitled Page" %>

<%@ Register Src="controls/GetHistory.ascx" TagName="GetHistory" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:GetHistory ID="GetHistory1" runat="server" />
</asp:Content>

