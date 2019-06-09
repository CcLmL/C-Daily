<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DelCategory.aspx.cs" Inherits="Category_DelCategory" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
        DataTextField="CategoryName" DataValueField="CategoryID" Width="211px">
    </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookShopConnectionString %>"
        SelectCommand="SELECT [CategoryName], [CategoryID] FROM [Category]"></asp:SqlDataSource>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="删除目录" Width="89px" />
    <asp:Label ID="Label1" runat="server" Width="384px"></asp:Label>
</asp:Content>

