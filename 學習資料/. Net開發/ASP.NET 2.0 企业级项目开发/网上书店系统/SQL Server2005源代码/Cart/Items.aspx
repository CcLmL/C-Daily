<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Items.aspx.cs" Inherits="Cart_Items" Title="Untitled Page" %>

<%@ Register Src="../controls/ItemControl.ascx" TagName="ItemControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ItemControl id="ItemControl1" runat="server">
    </uc1:ItemControl>
</asp:Content>

