<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DepartPage.aspx.cs" Inherits="DepartPage" Title="Untitled Page" %>

<%@ Register Src="controls/Department.ascx" TagName="Department" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:Department ID="Department1" runat="server" />
</asp:Content>

