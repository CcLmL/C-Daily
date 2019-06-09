<%@ Page Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LeaveWordBack.aspx.cs" Inherits="LeaveWordBack" Title="回复留言"%>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style=" font-size: 9pt; font-family: 宋体; width:574px; height :806px; background-repeat :no-repeat; background-image: url(images/显示页面当前位置.jpg);">
        <tr>
            <td valign =top >
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="2" style="text-align: center; height: 27px;">
                <span style="font-size: 16pt"></span></td>
        </tr>
        <tr>
            <td style="width: 81px; text-align: center">
                <span style="font-size: 9pt">回复主题</span></td>
            <td colspan="1" style="text-align: left">
                <asp:TextBox ID="txtSubject" runat="server" Font-Size="9pt" MaxLength="50" ReadOnly="True"
                    Width="365px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 81px; height: 21px; text-align: center">
                <span style="font-size: 9pt">回 复 人</span></td>
            <td style="width: 401px; height: 21px; text-align: left">
                <asp:TextBox ID="txtUid" runat="server" Font-Size="9pt" MaxLength="50"
                    Width="365px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server" ControlToValidate="txtUid" ErrorMessage="姓名不能为空">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr style="color: #505050">
            <td style="width: 81px; height: 1px; text-align: center">
                <span style="font-size: 9pt">回复内容</span></td>
            <td rowspan="2" style="width: 401px; text-align: left">
                <FTB:FreeTextBox id="FreeTextBox1" runat="Server" SupportFolder="aspnet_client/FreeTextBox/" ButtonSet="Office2003" Width="368px" Height="200px" ImageGalleryPath="images/" Language="zh-cn" />
            </td>
        </tr>
        <tr>
            <td style="width: 81px; height: 228px">
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center; height: 30px;">
                <asp:Button ID="btnOK" runat="server" Font-Size="9pt" OnClick="btnOK_Click" Text="提交" />
                <asp:Button ID="btnReset" runat="server" Font-Size="9pt" OnClick="btnReset_Click" Text="重置" CausesValidation="False" />
                 <asp:Button ID="btnBack" runat="server" Font-Size="9pt" OnClick="btnBack_Click" Text="返回" CausesValidation="False" />
              </td>
        </tr>
    </table>
            </td>
        </tr>
    </table>
</asp:Content>
