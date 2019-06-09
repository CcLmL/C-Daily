<%@ Page Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="feedback" Title="留言薄" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <table style=" font-size: 9pt; font-family: 宋体; width:574px; height :806px; background-repeat :no-repeat; background-image: url(images/显示页面当前位置.jpg);">
        <tr>
            <td  style="width: 356px; text-align: center; height: 370px;font-size :9pt" align =center valign =top >
                <table width="480" cellpadding="0" cellspacing="0" align="center">
                    <tr>
                       <td style="height :80px" valign="middle" align="left" colspan =2>
                            <br />&nbsp; &nbsp;目前位置：首页 &gt; 网站留言
			            </td>
                    </tr>
                    <tr>
                        <td style="width: 80px ;font-size :9pt">
                            留言主题</td>
                        <td style="width: 403px; text-align: left">
                            <asp:TextBox ID="txtTitle" runat="server" Width="360px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle"
                                ErrorMessage="主题不能为空">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 80px; height: 2px;font-size :9pt">
                            留言内容</td>
                        <td rowspan="2" style="width: 403px; text-align: left">
                            <FTB:FreeTextBox id="FreeTextBox1" runat="Server" SupportFolder="aspnet_client/FreeTextBox/" ButtonSet="Office2003" Height="200px" Width="365px" ImageGalleryPath="../../images/" Language="zh-cn" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 80px; height: 153px">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 9px; text-align: center">
                            <asp:Button ID="btnOK" runat="server" OnClick="btnOK_Click" Text="提交" />&nbsp;
                            <asp:Button ID="btnReset" runat="server" OnClick="Button1_Click" Text="重置" CausesValidation="False" />&nbsp;
                            <asp:Button id="btnBack" onclick="btnBack_Click" runat="server" Font-Size="9pt" Text="返回" CausesValidation =false ></asp:Button>
                            </td>
                    </tr>
                </table>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                    ShowSummary="False" />
            </td>
        </tr>
       
    </table>
  </asp:Content>
