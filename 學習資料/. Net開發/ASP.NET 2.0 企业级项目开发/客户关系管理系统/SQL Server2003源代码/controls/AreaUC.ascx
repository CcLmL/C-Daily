<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AreaUC.ascx.cs" Inherits="controls_AreaUC" %>
<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
    DataTextField="AreaName" DataValueField="AreaName">
</asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
    SelectCommand="SELECT [AreaName] FROM [Area]"></asp:SqlDataSource>
