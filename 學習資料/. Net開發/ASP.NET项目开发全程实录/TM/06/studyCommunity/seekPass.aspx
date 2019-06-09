<%@ Page Language="C#" AutoEventWireup="true" CodeFile="seekPass.aspx.cs" Inherits="seekPass" %>

<%@ Register Src="dh.ascx" TagName="dh" TagPrefix="uc1" %>
<%@ Register Src="bottomT.ascx" TagName="bottomT" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="text-align: center">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 624px; height: 357px">
                <tr>
                    <td colspan="3">
                        <uc1:dh ID="Dh1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                    <IMG height=126 src="images/index_05.jpg" width=802 />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center">
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 422px; height: 182px">
                            <tr>
                                <td style="width: 115px; height: 7px; text-align: right;">
                                    用户名：</td>
                                <td align="left" style="width: 110px; height: 7px;">
                                    &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 206px">
                                        <tr>
                                            <td style="width: 100px; height: 24px">
                                    <asp:TextBox ID="txtName" runat="server" Width="117px"></asp:TextBox></td>
                                            <td style="width: 100px; height: 24px">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                                    ErrorMessage="必须填写"></asp:RequiredFieldValidator></td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="width: 100px; height: 7px; text-align: left;">
                                    &nbsp;<asp:LinkButton ID="lnkbtnLoopupQuestion" runat="server" Width="70px" OnClick="LinkButton1_Click">查找问题</asp:LinkButton></td>
                            </tr>
                            <tr>
                                <td style="width: 115px; height: 27px; text-align: right;">
                                    密码提示问题：</td>
                                <td style="width: 110px; height: 27px; text-align: left">
                                    <asp:TextBox ID="txtPassQuestion" runat="server" Width="149px"></asp:TextBox></td>
                                <td style="width: 100px; height: 27px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 115px; text-align: right;">
                                    密码提示答案：</td>
                                <td style="width: 110px; text-align: left">
                                    <asp:TextBox ID="txtPassSolution" runat="server" Width="151px"></asp:TextBox></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 115px; text-align: right;">
                                    密码：</td>
                                <td style="width: 110px; text-align: left">
                                    <asp:TextBox ID="txtPass" runat="server" ReadOnly="True" Width="115px"></asp:TextBox></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:Button ID="btnLookup" runat="server" OnClick="Button1_Click" Text="查找密码" />
                                    <asp:Button ID="Button2" runat="server" Text="返　回" Width="79px" PostBackUrl="~/index.aspx" CausesValidation="False" OnClick="Button2_Click" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        &nbsp;<uc2:bottomT ID="BottomT1" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    
    </div>
    </form>
</body>
</html>
