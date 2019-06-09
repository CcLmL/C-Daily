<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TaskManagePage.aspx.cs" Inherits="TaskManagePage" Title="Untitled Page" %>

<%@ Register Src="controls/TaskManage.ascx" TagName="TaskManage" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:TaskManage ID="TaskManage1" runat="server" />
</asp:Content>

