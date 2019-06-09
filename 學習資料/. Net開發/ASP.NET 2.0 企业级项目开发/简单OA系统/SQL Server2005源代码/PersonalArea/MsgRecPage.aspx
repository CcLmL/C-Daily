<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MsgRecPage.aspx.cs" Inherits="PersonalArea_MsgRecPage" Title="Untitled Page" %>

<%@ Register Src="../controls/MsgRec.ascx" TagName="MsgRec" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:MsgRec ID="MsgRec1" runat="server" />
</asp:Content>

