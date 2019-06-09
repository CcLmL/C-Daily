<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserGradeUC.ascx.cs" Inherits="controls_UserGradeUC" %>
<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
    DataTextField="GradeName" DataValueField="GradeName">
</asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
    SelectCommand="SELECT [GradeName] FROM [UserGrade]"></asp:SqlDataSource>
