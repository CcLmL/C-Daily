<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditMemberPage.aspx.cs" Inherits="EditMemberPage" Title="Untitled Page" %>

<%@ Register Src="controls/EditMemberInfo.ascx" TagName="EditMemberInfo" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EditMemberInfo ID="EditMemberInfo1" runat="server" />
</asp:Content>

