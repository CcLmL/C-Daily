<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddWorkLogPage.aspx.cs" Inherits="AddWorkLogPage" Title="Untitled Page" %>

<%@ Register Src="controls/AddWorkLog.ascx" TagName="AddWorkLog" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AddWorkLog ID="AddWorkLog1" runat="server" />
</asp:Content>

