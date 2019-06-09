<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addReaderInfo.aspx.cs" Inherits="addReaderInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">

    <title>无标题页</title>
        <link href="css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" background="Images/beijing.gif" border="0" cellpadding="0"
            cellspacing="0" height="371" width="340">
            <tr>
                <td>
                    <table align="center" border="0" cellpadding="0" cellspacing="0" style="height: 263px"
                        width="325">
                        <tr>
                            <td style="width: 85px; height: 16px">
                                <div align="right">
                                    条形码：</div>
                            </td>
                            <td style="height: 16px" width="175">
                                <asp:TextBox ID="txtReaderBarCode" runat="server" ReadOnly="True"></asp:TextBox></td>
                            <td style="height: 16px" width="76">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 85px">
                                <div align="right">
                                    读者姓名：</div>
                            </td>
                            <td>
                                <asp:TextBox ID="txtReaderName" runat="server" Width="114px"></asp:TextBox></td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr style="color: #000000">
                            <td style="width: 85px; height: 20px;">
                                <div align="right">
                                    性别：</div>
                            </td>
                            <td style="height: 20px">
                                <asp:RadioButton ID="radbtnMan" runat="server" Checked="True" GroupName="sex" Text="男" />
                                <asp:RadioButton ID="radbtnWoman" runat="server" GroupName="sex" Text="女" /></td>
                            <td style="height: 20px">
                                &nbsp;</td>
                        </tr>
                        <tr style="color: #000000">
                            <td style="width: 85px">
                                <div align="right">
                                    读者类型：</div>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlReaderType" runat="server" Width="73px">
                                </asp:DropDownList></td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 85px">
                                <div align="right">
                                    证件类型：</div>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlCertificateType" runat="server" Width="72px">
                                    <asp:ListItem>学生证</asp:ListItem>
                                    <asp:ListItem>身份证</asp:ListItem>
                                    <asp:ListItem>工作证</asp:ListItem>
                                </asp:DropDownList></td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr style="color: #000000">
                            <td style="width: 85px">
                                <div align="right">
                                    证件号码：</div>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCertificate" runat="server" Width="116px"></asp:TextBox></td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 85px">
                                <div align="right">
                                    联系电话：</div>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTel" runat="server" Width="116px"></asp:TextBox></td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 85px; text-align: right">
                                E-mail：</td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server" Width="115px"></asp:TextBox></td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 85px; text-align: right">
                                备注：</td>
                            <td>
                                <asp:TextBox ID="txtRemark" runat="server" Height="74px" TextMode="MultiLine" Width="155px"></asp:TextBox></td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align: center">
                                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="保　存" />&nbsp;
                                <input id="Button1" onclick="window.close();" type="button" value="关　闭" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
