<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserStateUC.ascx.cs" Inherits="controls_UserStateUC" %>
<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
    DataTextField="StateName" DataValueField="StateName">
</asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
    SelectCommand="SELECT [StateName] FROM [UserState]"></asp:SqlDataSource>
