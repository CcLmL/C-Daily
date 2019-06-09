<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserTypeUC.ascx.cs" Inherits="controls_UserTypeUC" %>
<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
    DataTextField="TypeName" DataValueField="TypeName">
</asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
    SelectCommand="SELECT [TypeName] FROM [UserType]"></asp:SqlDataSource>
