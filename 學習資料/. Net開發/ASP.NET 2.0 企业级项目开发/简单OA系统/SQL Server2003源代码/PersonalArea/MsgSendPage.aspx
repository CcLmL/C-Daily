<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MsgSendPage.aspx.cs" Inherits="ManagerArea_MsgSendPage" Title="Untitled Page" %>

<%@ Register Src="../controls/MsgSend.ascx" TagName="MsgSend" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:MsgSend ID="MsgSend1" runat="server" />
    <a href="../controls/SendMsg.aspx"></a>
</asp:Content>

