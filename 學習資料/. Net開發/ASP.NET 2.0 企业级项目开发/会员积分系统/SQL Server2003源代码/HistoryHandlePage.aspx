<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="HistoryHandlePage.aspx.cs" Inherits="HistoryHandlePage" Title="Untitled Page" %>

<%@ Register Src="controls/HistoryHandle.ascx" TagName="HistoryHandle" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:HistoryHandle id="HistoryHandle1" runat="server">
    </uc1:HistoryHandle>
</asp:Content>

