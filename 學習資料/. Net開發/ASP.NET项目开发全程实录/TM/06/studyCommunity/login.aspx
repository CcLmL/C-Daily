<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<%@ Register Src="bottomT.ascx" TagName="bottomT" TagPrefix="uc2" %>

<%@ Register Src="dh.ascx" TagName="dh" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>�ޱ���ҳ</title>
    
</head>
<body style="font-size: 12pt">
    <form id="form1" runat="server">  
        <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 763px;
            height: 515px">
            <tr>
                <td colspan="4" style="height: 1%">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" colspan="4" style="height: 1%">
                    &nbsp;
                    <uc1:dh ID="Dh1" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="4" rowspan="1" style="text-align: center; height: 116px;" valign="top">
                <img src="images/index_05.jpg" width="802" height="126">
                </td>
            </tr>
            <tr>
                <td style="text-align: center;" valign="top" colspan="4" rowspan="2">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 490px; height: 337px; background-color: #d3d3d3;">
                        <tr>
                            <td align="right" colspan="4" style="height: 1px">
                            <img src="images/zchy.gif" width="557" height="29">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 27px; height: 1px">
                            </td>
                            <td align="right" style="width: 145px; height: 1px">
                                <span>�û���</span>��</td>
                            <td style="width: 155px; height: 1px; text-align: left;">
                                <asp:TextBox ID="txtName" runat="server" Width="92px"></asp:TextBox>
                                <span style="color: #ff0066">*</span></td>
                            <td style="width: 190px; color: #000000; height: 1px; text-align: left;">
                                &nbsp;<asp:Button ID="btnisName" runat="server" CausesValidation="False" OnClick="btnisName_Click"
                                    Text="����û���" /><span style="font-size: 10pt"> </span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="txtName"
                                    ErrorMessage="������д" Font-Bold="True" Font-Size="10pt"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr style="font-weight: bold; font-size: 12pt; color: #000000">
                            <td align="right" style="width: 27px; height: 23px">
                            </td>
                            <td align="right" style="font-weight: normal; width: 145px; height: 23px">
                                <span></span>���룺</td>
                            <td style="font-size: 10pt; width: 155px; color: #ff0066; height: 23px; text-align: left; font-weight: normal;">
                                <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Width="125px"></asp:TextBox><span
                                    style="font-size: 12pt">*</span></td>
                            <td style="font-size: 12pt; width: 190px; color: #000000; height: 23px; font-weight: bold; text-align: left;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" runat="server" ControlToValidate="txtPass"
                                    ErrorMessage="������д" Font-Bold="True" Font-Size="10pt"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr style="font-size: 12pt; color: #000000">
                            <td align="right" style="width: 27px; height: 26px">
                            </td>
                            <td align="right" style="width: 145px; height: 26px">
                                <span>ȷ������</span>��</td>
                            <td style="font-size: 12pt; width: 155px; height: 26px; text-align: left;">
                                <asp:TextBox ID="txtQrPass" runat="server" TextMode="Password" Width="123px"></asp:TextBox><span>
                                    <span></span></span>
                            </td>
                            <td style="font-size: 12pt; width: 190px; color: #000000; height: 26px; text-align: left;">
                                <asp:CompareValidator ID="CompareValidatorPass" runat="server" ControlToCompare="txtPass"
                                    ControlToValidate="txtQrPass" ErrorMessage="�������벻һ��" Font-Bold="True" Font-Size="10pt"></asp:CompareValidator></td>
                        </tr>
                        <tr style="font-weight: bold; font-size: 12pt; color: #000000">
                            <td align="right" style="width: 27px; height: 24px">
                            </td>
                            <td align="right" style="width: 145px; height: 24px">
                                <span><span style="font-weight: normal">�Ա�</span></span></td>
                            <td style="width: 155px; color: #ff0066; height: 24px; text-align: left; font-weight: bold;">
                                <asp:RadioButton ID="RadioButtonMan" runat="server" Checked="True" Font-Bold="False"
                                    Font-Size="12pt" ForeColor="#000000" GroupName="sex" Text="��" />
                                <asp:RadioButton ID="RadioButtonWoman" runat="server" Font-Bold="False" Font-Size="12pt"
                                    ForeColor="#000000" GroupName="sex" Text="Ů" /></td>
                            <td style="width: 190px; color: #000000; height: 24px; font-weight: bold;">
                            </td>
                        </tr>
                        <tr style="font-size: 12pt; color: #000000">
                            <td align="right" style="width: 27px">
                            </td>
                            <td align="right" style="width: 145px">
                                <span>������ʾ���⣺</span></td>
                            <td style="font-size: 12pt; width: 155px; text-align: left;">
                                <asp:TextBox ID="txtPassQuestion" runat="server" Width="141px"></asp:TextBox></td>
                            <td style="font-size: 12pt; width: 190px">
                            </td>
                        </tr>
                        <tr style="font-size: 12pt; color: #000000">
                            <td align="right" style="width: 27px; height: 28px;">
                            </td>
                            <td align="right" style="width: 145px; height: 28px;">
                                ������ʾ�𰸣�</td>
                            <td style="font-size: 12pt; width: 155px; text-align: left; height: 28px;">
                                <asp:TextBox ID="txtPassSolution" runat="server" Width="140px"></asp:TextBox></td>
                            <td style="font-size: 12pt; width: 190px; height: 28px;">
                            </td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td align="right" style="width: 27px; height: 27px;">
                            </td>
                            <td align="right" style="width: 145px; height: 27px;">
                                ��ʵ������</td>
                            <td style="width: 155px; height: 27px; text-align: left;">
                                <asp:TextBox ID="txtTrueName" runat="server" Width="92px"></asp:TextBox></td>
                            <td style="width: 190px; height: 27px">
                            </td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td align="right" style="width: 27px; height: 31px;">
                            </td>
                            <td align="right" style="width: 145px; height: 31px;">
                                <span>���֤�ţ�</span></td>
                            <td style="width: 155px; height: 31px; text-align: left;">
                                <span
                                    style="color: #ff0066">
                                    <asp:TextBox ID="txtIDCard" runat="server" Width="143px"></asp:TextBox></span></td>
                            <td style="width: 190px; height: 31px; text-align: left;">
                                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidatorIDCard" runat="server"
                                    ControlToValidate="txtIDCard" ErrorMessage="���֤�Ų���ȷ" ValidationExpression="\d{17}[\d|X]|\d{15}"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td align="right" style="width: 27px; height: 28px;">
                            </td>
                            <td align="right" style="width: 145px; height: 28px;">
                                <span>Email��</span></td>
                            <td style="width: 155px; text-align: left; height: 28px;">
                                <asp:TextBox ID="txtEmail" runat="server" EnableViewState="False"></asp:TextBox><span
                                    style="color: #ff0066">* </span>
                            </td>
                            <td style="width: 190px; height: 28px; text-align: left;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="������д" Font-Bold="True" Font-Size="10pt"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator��mail" runat="server"
                                    ControlToValidate="txtEmail" ErrorMessage="�ʼ���ַ����ȷ" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td align="center" colspan="4" style="height: 18px">
                                <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="ע��" Width="60px" />
                                <asp:Button ID="buttonCancel" runat="server" CausesValidation="False" OnClick="buttonCancel_Click"
                                    Text="ȡ��" Width="61px" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="font-size: 12pt">
            </tr>
            <tr style="font-size: 12pt">
                <td style="height: 27px; text-align: center;" colspan="4">
                    <uc2:bottomT ID="BottomT1" runat="server" />
                    &nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
