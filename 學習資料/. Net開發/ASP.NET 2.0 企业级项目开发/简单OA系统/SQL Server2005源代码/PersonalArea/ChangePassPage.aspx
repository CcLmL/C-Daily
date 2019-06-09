<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassPage.aspx.cs" Inherits="PersonalArea_ChangePassPage" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ChangePassword ID="ChangePassword1" runat="server" ContinueButtonText="完成" OnContinueButtonClick="ChangePassword1_ContinueButtonClick">
    </asp:ChangePassword>
</asp:Content>

