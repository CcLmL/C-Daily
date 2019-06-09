<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" Title="Untitled Page" %>

<%@ Register Src="controls/AddressForm.ascx" TagName="AddressForm" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center" class="profilePosition">
    <table border="0" cellpadding="0" cellspacing="0" class="formContent" width="380">
        <tr>
            <td>
                <div class="checkoutHeaders" align="left">
                    帐户地址</div>
                <div class="info">
                    用户名:
                    <asp:LoginName ID="LoginName" runat="server" />
                    <br />
                </div>
                <div class="checkoutHeaders" align="left">
                <uc1:AddressForm ID="AddressForm" runat="server"  /></div>
                <asp:Panel ID="panFocus" runat="server" DefaultButton="btnSubmit">
                <asp:Label ID="lblMessage" runat="server" cssclass="label"></asp:Label>
                <div align="right" class="checkoutButtonBg">
                    
                    <asp:LinkButton ID="btnSubmit" runat="server" CssClass="submit" OnClick="btnSubmit_Click"
                        Text="更新"></asp:LinkButton></div>
                </asp:Panel>
            </td>
        </tr>
    </table>
</div>
</asp:Content>

