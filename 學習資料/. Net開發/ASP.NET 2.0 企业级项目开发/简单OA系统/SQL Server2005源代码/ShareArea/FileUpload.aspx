<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FileUpload.aspx.cs" Inherits="ShareArea_FileUpload" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 558px">
        <tr>
            <td colspan="2" style="height: 21px">
                请选择要上传的文件</td>
        </tr>
        <tr>
            <td style="width: 153px">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="414px" /></td>
            <td style="width: 109px">
                <asp:Button ID="Button1" runat="server" Text="上传" Width="81px" OnClick="Button1_Click" /></td>
        </tr>
    </table>
</asp:Content>

