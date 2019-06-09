<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CardTypePage.aspx.cs" Inherits="CardTypePage" Title="Untitled Page" %>

<%@ Register Src="../controls/CardTypeSet.ascx" TagName="CardTypeSet" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:CardTypeSet id="CardTypeSet1" PageView="AddCardType" runat="server">
    </uc1:CardTypeSet>
</asp:Content>

