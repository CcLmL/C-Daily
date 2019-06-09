<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="InsertMemberPage.aspx.cs" Inherits="InsertMemberPage" Title="Untitled Page" %>

<%@ Register Src="controls/InsertMemberUC.ascx" TagName="InsertMemberUC" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:InsertMemberUC ID="InsertMemberUC1" runat="server" />
</asp:Content>

