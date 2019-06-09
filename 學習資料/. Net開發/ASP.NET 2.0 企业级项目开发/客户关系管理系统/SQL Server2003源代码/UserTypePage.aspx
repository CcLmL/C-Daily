<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserTypePage.aspx.cs" Inherits="UserTypePage" Title="Untitled Page" %>

<%@ Register Src="controls/UserType.ascx" TagName="UserType" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UserType ID="UserType1" runat="server" />
</asp:Content>

