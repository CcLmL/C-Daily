<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RequirementPage.aspx.cs" Inherits="RequirementPage" Title="Untitled Page" %>

<%@ Register Src="controls/Requirement.ascx" TagName="Requirement" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:Requirement ID="Requirement1" runat="server" />
</asp:Content>

