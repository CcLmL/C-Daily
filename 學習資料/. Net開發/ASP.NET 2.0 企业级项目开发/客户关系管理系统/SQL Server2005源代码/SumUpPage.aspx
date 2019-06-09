<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SumUpPage.aspx.cs" Inherits="SumUpPage" Title="Untitled Page" %>

<%@ Register Src="controls/SumUp.ascx" TagName="SumUp" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:SumUp ID="SumUp1" runat="server" />
</asp:Content>

