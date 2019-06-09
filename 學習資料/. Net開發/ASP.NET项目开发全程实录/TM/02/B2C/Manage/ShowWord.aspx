<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowWord.aspx.cs" Inherits="Manage_ShowWord" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>回复留言</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-image: url()">
     <table cellpadding="0" cellspacing="0"  height="400" style="background-repeat: no-repeat">
        <tr>
            <td colspan="3" rowspan="2" style="height: 1px; vertical-align: top; text-align: center;">
                <table cellpadding="0" cellspacing="0"  style="height: 1px">
                    <tr>
                        <td style="width: 50px; height: 63px">
                        </td>
                        <td style="width: 80px; height: 63px; text-align: center">
                        </td>
                        <td style="height: 63px; text-align: left">
                        </td>
                        <td style="width: 50px; height: 63px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50px; height: 17px;">
                        </td>
                        <td style="width: 80px; text-align: center; height: 17px; font-size :9pt">
                            留言主题</td>
                        <td style="height: 17px; text-align: left;">
                        <%=ShowSubject %>
                        </td>
                        <td style="width: 50px; height: 17px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 17px">
                        </td>
                        <td style="height: 17px; text-align: center ; font-size :9pt">
                            留 言 人</td>
                        <td style="height: 17px; text-align: left;">
                        <%=ShowName %>
                        </td>
                        <td style="height: 17px">
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 17px">
                        </td>
                        <td style="text-align: center; height: 17px;; font-size :9pt">
                            留言时间</td>
                        <td style="height: 17px; text-align: left;">
                        <%=ShowTime %>
                        </td>
                        <td style="height: 17px">
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td style="text-align: center; font-size :9pt">
                            留言内容</td>
                        <td rowspan="2" style="text-align: left">
                        <%=ShowContent %>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 17px">
                        </td>
                        <td style="text-align: center; height: 17px;">
                        </td>
                        <td style="height: 17px">
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 7px">
                        </td>
                        <td style="height: 7px; text-align: center">
                        </td>
                        <td rowspan="1" style="height: 7px; text-align: right; font-size :9pt">
                            <asp:LinkButton ID="lnkbtnFeedBack" runat="server" OnClick="lnkbtnFeedBack_Click" Font-Underline="False">我要回复</asp:LinkButton>&nbsp;
                            &nbsp;<asp:LinkButton ID="lnkbtnViewBack" runat="server" Font-Underline="False" OnClick="lnkbtnViewBack_Click">查看回复</asp:LinkButton>
                            &nbsp;&nbsp;
                        </td>
                        <td style="height: 7px">
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 17px">
                        </td>
                        <td colspan="2" style="text-align: center; height: 17px;">
                        </td>
                        <td style="height: 17px">
                        </td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="0" width="100%" style="height:1px">
                    <tr>
                        <td rowspan="2" style="width: 50px; height: 1px;">
                        </td>
                        <td rowspan="2" style="width: 377px; text-align: center; height: 1px;">
                            <asp:Panel ID="Panel1" runat="server" Height="50px" Visible="False" Width="125px">
                                <table cellpadding="0" cellspacing="0" style="width: 480px">
                                    <tr>
                                        <td colspan="3" rowspan="2" style="width: 606px; height: 35px">
                                            <table cellpadding="0" cellspacing="0" style="width: 100%; height: 1px;">
                                                <tr>
                                                    <td colspan="3" rowspan="2" style="width: 607px">
                                                        <asp:DataList ID="dlReplyWord" runat="server">
                                                            <ItemTemplate>
                                                                <table style="border-right: #8dbadb 1px solid; border-top: #8dbadb 1px solid; font-size: 9pt;
                                                                    border-left: #8dbadb 1px solid; border-bottom: #8dbadb 1px solid" width="480">
                                                                    <tr>
                                                                        <td style="width: 80px">
                                                                            <span style="font-size: 9pt">回 复 人</span></td>
                                                                        <td colspan="2" style="width: 382px; text-align: left">
                                                                        <%#DataBinder.Eval(Container,"DataItem.UName") %>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <span style="font-size: 9pt">回复时间</span></td>
                                                                        <td colspan="2" style="width: 382px; text-align: left">
                                                                        <%#DataBinder.Eval(Container,"DataItem.DateTime") %>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <span style="font-size: 9pt">回复内容</span></td>
                                                                        <td colspan="2" style="width: 382px; text-align: left">
                                                                        <%#DataBinder.Eval(Container,"DataItem.Content") %>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                            <HeaderTemplate>
                                                                <span style="font-size: 16pt"></span>
                                                            </HeaderTemplate>
                                                        </asp:DataList></td>
                                                </tr>
                                                <tr>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="width: 607px; height: 12px">
                                                        <table cellpadding="0" cellspacing="0" style="width: 100%">
                                                            <tr>
                                                                <td style="width: 370px; height: 15px">
                                                                </td>
                                                                <td style="width: 264px; height: 15px">
                                                                    <span style="font-size: 9pt">共有</span><asp:Label ID="labCount" runat="server" Font-Size="9pt"
                                                                        ForeColor="Red"></asp:Label><span style="font-size: 9pt; vertical-align: bottom;
                                                                            text-align: center">页</span></td>
                                                                <td style="width: 253px; height: 15px">
                                                                    <span style="font-size: 9pt">当前第</span><asp:Label ID="labNowPage" runat="server"
                                                                        Font-Size="9pt" ForeColor="Red">1</asp:Label><span style="font-size: 9pt; vertical-align: bottom;
                                                                            text-align: center">页</span></td>
                                                                <td style="vertical-align: bottom; width: 422px; height: 15px; text-align: center">
                                                                    <asp:LinkButton ID="lnkbtnTop" runat="server" Font-Size="9pt" Font-Underline="False"
                                                                        ForeColor="Black" OnClick="lnkbtnTop_Click">首页</asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkbtnPrve" runat="server" Font-Size="9pt" Font-Underline="False"
                                                                        ForeColor="Black" OnClick="lnkbtnPrve_Click">上一页</asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Size="9pt" Font-Underline="False"
                                                                        ForeColor="Black" OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkbtnLast" runat="server" Font-Overline="False" Font-Size="9pt"
                                                                        Font-Underline="False" ForeColor="Black" OnClick="lnkbtnLast_Click">尾页</asp:LinkButton></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                    </tr>
                                </table>
                            </asp:Panel>
                            &nbsp;
                        </td>
                        <td rowspan="2" style="width: 50px; height:1px;">
                        </td>
                    </tr>
                    <tr>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
