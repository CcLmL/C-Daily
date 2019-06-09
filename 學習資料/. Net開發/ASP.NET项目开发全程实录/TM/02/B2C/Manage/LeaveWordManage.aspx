<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LeaveWordManage.aspx.cs" Inherits="Manage_LeaveWordManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>留言管理</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <table style="background-repeat: no-repeat">
        <tr>
            <td colspan="3" rowspan="3" style="width: 550px;">
                <table cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                        <td colspan="4" rowspan="1" style="height: 57px; text-align: center">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" rowspan="2" style="width: 739px; text-align: center;">
                            <asp:DataList ID="dlManage" runat="server" OnItemCommand="dlManage_ItemCommand">
                                <ItemTemplate>
                                    <table style="border-right: #8dbadb 1px solid; border-top: #8dbadb 1px solid; font-size: 9pt;
                                        border-left: #8dbadb 1px solid; border-bottom: #8dbadb 1px solid" width="480">
                                        <tr>
                                            <td style="width: 80px">
                                                <span style="font-size: 9pt">
                            留言主题</span></td>
                                            <td colspan="2" style="width: 382px; text-align: left">
                                            <%#DataBinder.Eval(Container,"DataItem.Subject") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                留 言 人</td>
                                            <td colspan="2" style="width: 382px; text-align: left">
                                            <%#DataBinder.Eval(Container,"DataItem.Uid") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span style="font-size: 9pt">
                            留言时间</span></td>
                                            <td colspan="2" style="width: 382px; text-align: left">
                                            <%#DataBinder.Eval(Container,"DataItem.DateTime") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span style="font-size: 9pt">
                            留言内容</span></td>
                                            <td colspan="2" rowspan="2" style="width: 382px; text-align: left">
                                            <%#DataBinder.Eval(Container,"DataItem.Content") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td colspan="2" style="font-size: 9pt; width: 382px; text-align: right">
                                                <a href='LeaveWordBack.aspx?ID=<%#DataBinder.Eval(Container,"DataItem.ID") %>' style="color: #0000ff;
                                                    text-decoration: none"><span style="color: #000000">回复留言</span></a> <a href='ShowWord.aspx?ID=<%#DataBinder.Eval(Container,"DataItem.ID") %>'
                                                        style="font-size: 9pt; color: #0000ff; text-decoration: none"><span style="color: #000000">
                                                            查看回复</span></a> <asp:LinkButton ID="lnkbtnDelete" runat="server" CommandName="delete" CommandArgument =<%#DataBinder.Eval(Container,"DataItem.ID") %>
                                                                Font-Size="9pt" Font-Underline="False" ForeColor="Black">删除留言</asp:LinkButton>
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
                        <td colspan="3" style="width: 739px; height: 5px">
                            <table cellpadding="0" cellspacing="0" style="width: 100%">
                                <tr>
                                    <td style="width: 398px; height: 15px">
                                    </td>
                                    <td style="width: 264px; height: 15px; text-align: center">
                                        <span style="font-size: 9pt">共有</span><asp:Label ID="labCount" runat="server" Font-Size="9pt"
                                            ForeColor="Red"></asp:Label><span style="font-size: 9pt; vertical-align: bottom;
                                                text-align: center">页</span></td>
                                    <td style="width: 182px; height: 15px; text-align: center">
                                        <span style="font-size: 9pt">当前第</span><asp:Label ID="labNowPage" runat="server"
                                            Font-Size="9pt" ForeColor="Red">1</asp:Label><span style="font-size: 9pt; vertical-align: bottom;
                                                text-align: center">页</span></td>
                                    <td style="vertical-align: bottom; width: 423px; height: 15px; text-align: center">
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
        <tr>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
