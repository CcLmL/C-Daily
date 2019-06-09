<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddLinkmanPage.aspx.cs" Inherits="AddLinkmanPage" Title="Untitled Page" %>

<%@ Register Src="controls/AddLinkman.ascx" TagName="AddLinkman" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AddLinkman id="AddLinkman1" runat="server">
    </uc1:AddLinkman>
</asp:Content>

