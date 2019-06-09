<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmployeePage.aspx.cs" Inherits="EmployeePage" Title="Untitled Page" %>

<%@ Register Src="controls/EmployeeManage.ascx" TagName="EmployeeManage" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EmployeeManage id="EmployeeManage1" runat="server">
    </uc1:EmployeeManage>
</asp:Content>

