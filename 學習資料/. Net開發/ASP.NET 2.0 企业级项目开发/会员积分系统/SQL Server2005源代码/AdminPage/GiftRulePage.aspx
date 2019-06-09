<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GiftRulePage.aspx.cs" Inherits="GiftRulePage" Title="Untitled Page" %>

<%@ Register Src="../controls/GiftRule.ascx" TagName="GiftRule" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:GiftRule id="GiftRule1" runat="server">
    </uc1:GiftRule>
</asp:Content>

