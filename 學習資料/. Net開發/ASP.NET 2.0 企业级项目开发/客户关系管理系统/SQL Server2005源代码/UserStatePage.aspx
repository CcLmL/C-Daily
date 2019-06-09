<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserStatePage.aspx.cs" Inherits="UserStatePage" Title="Untitled Page" %>

<%@ Register Src="controls/UserState.ascx" TagName="UserState" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UserState ID="UserState1" runat="server" />
</asp:Content>

