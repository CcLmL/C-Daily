<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TimeSetPage.aspx.cs" Inherits="ManagerArea_TimeSetPage" Title="Untitled Page" %>

<%@ Register Src="../controls/TimeSet.ascx" TagName="TimeSet" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:TimeSet ID="TimeSet1" runat="server" />
</asp:Content>

