<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewWorkLogPage.aspx.cs" Inherits="ViewWorkLogPage" Title="Untitled Page" %>

<%@ Register Src="controls/ViewWorkLog.ascx" TagName="ViewWorkLog" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ViewWorkLog ID="ViewWorkLog1" runat="server" />
</asp:Content>

