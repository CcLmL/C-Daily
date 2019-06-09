<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserGradePage.aspx.cs" Inherits="UserGradePage" Title="Untitled Page" %>

<%@ Register Src="controls/UserGrade.ascx" TagName="UserGrade" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UserGrade ID="UserGrade1" runat="server" />
</asp:Content>

