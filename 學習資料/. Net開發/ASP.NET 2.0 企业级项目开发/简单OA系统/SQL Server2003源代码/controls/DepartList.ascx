<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DepartList.ascx.cs" Inherits="controls_DepartList" %>
<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
    DataTextField="DepartName" DataValueField="DepartName">
</asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SimpleOAConnectionString %>"
    SelectCommand="SELECT [DepartID], [DepartName] FROM [Department]"></asp:SqlDataSource>
