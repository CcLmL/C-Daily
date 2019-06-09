<%@ Page Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LeaveWordView.aspx.cs" Inherits="LeaveWordView"Title="查看回复" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<table style=" font-size: 9pt; font-family: 宋体; width:574px; height :806px; background-repeat :no-repeat; background-image: url(images/显示页面当前位置.jpg);">
        <tr>
            <td colspan="3" rowspan="2" style="width: 591px; text-align: center; vertical-align: top;">
                <table cellpadding="0" cellspacing="0" style="font-size: 9pt; height: 144px" width="480">
                    <tr>
                        <td colspan="5" rowspan="1" style="text-align: center; height: 27px;">
                            <strong><span style="font-size: 16pt"></span></strong></td>
                    </tr>
                    <tr style="color: #000000">
                        <td colspan="5" rowspan="2" style="text-align: center">
                            <asp:DataList ID="DataList1" runat="server" OnDeleteCommand="DataList1_DeleteCommand">
                                <ItemTemplate>
                                    <table style="border-right: #8dbadb 1px solid; border-top: #8dbadb 1px solid; border-left: #8dbadb 1px solid;
                                        border-bottom: #8dbadb 1px solid" width="480">
                                        <tr>
                                            <td style="width: 148px">
                                                回 复 人</td>
                                            <td colspan="2" style="width: 382px; text-align: left">
                                            <%#DataBinder.Eval(Container,"DataItem.UName") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 148px">
                                                <span style="font-size: 9pt">回复时间</span></td>
                                            <td colspan="2" style="width: 382px; text-align: left">
                                            <%#DataBinder.Eval(Container,"DataItem.DateTime") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 148px">
                                                <span style="font-size: 9pt">回复内容</span></td>
                                            <td colspan="2" rowspan="2" style="width: 382px; text-align: left">
                                            <%#DataBinder.Eval(Container,"DataItem.Content") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 148px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 148px">
                                            </td>
                                            <td colspan="2" rowspan="1" style="width: 382px; text-align: right">
                                           
                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="delete" Font-Underline="False">删除回复</asp:LinkButton>&nbsp;
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
                        <td colspan="5" style="height: 33px">
                            <table cellpadding="0" cellspacing="0" style="width: 100%">
                                <tr>
                                    <td style="width: 425px; height: 15px">
                                    </td>
                                    <td style="width: 253px; height: 15px; text-align: center">
                                        <span style="font-size: 9pt">共有</span><asp:Label ID="labCount" runat="server" Font-Size="9pt"
                                            ForeColor="#FF3300"></asp:Label><span style="font-size: 9pt; vertical-align: bottom;
                                                text-align: center">页</span></td>
                                    <td style="width: 167px; height: 15px; text-align: center">
                                        <span style="font-size: 9pt">当前第</span><asp:Label ID="labNowPage" runat="server"
                                            Font-Size="9pt" ForeColor="Red">1</asp:Label><span style="font-size: 9pt; vertical-align: bottom;
                                                text-align: center">页</span></td>
                                    <td style="vertical-align: bottom; width: 381px; height: 15px; text-align: center">
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
                            <asp:Button ID="btnBack" runat="server" Text="返回" OnClick="btnBack_Click" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
        </tr>
    </table>
</asp:Content>