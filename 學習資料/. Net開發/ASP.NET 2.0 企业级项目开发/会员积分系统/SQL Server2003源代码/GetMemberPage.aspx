<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GetMemberPage.aspx.cs" Inherits="GetMemberPage" Title="Untitled Page" %>

<%@ Register Src="controls/GetMember.ascx" TagName="GetMember" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:GetMember id="GetMember1" runat="server">
    </uc1:GetMember>
</asp:Content>

