<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddCity.aspx.cs" Inherits="AddCity" Title="Untitled Page" %>

<%@ Register Src="controls/AddCity.ascx" TagName="AddCity" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AddCity ID="AddCity1" runat="server" />
</asp:Content>

