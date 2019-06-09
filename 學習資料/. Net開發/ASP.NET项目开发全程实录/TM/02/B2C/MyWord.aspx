<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyWord.aspx.cs" Inherits="MyWord" Title="我的留言" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style=" font-size: 9pt; font-family: 宋体; width:574px; height :806px; background-repeat :no-repeat; background-image: url(images/显示页面当前位置.jpg);">
        
        <tr>
            <td colspan="3" rowspan="3" style="width: 550px; vertical-align: top; text-align: center;">
                <table cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                       <td style="height :80px" valign="middle" align="left" colspan =2>
                            <br />&nbsp; &nbsp;目前位置：首页 &gt; 我的留言
			            </td>
                    </tr>
                    <tr>
                        <td colspan="3" rowspan="2" style="width: 739px; text-align: center;">
                            <asp:DataList ID="dlMyWord" runat="server" OnDeleteCommand="dlMyWord_DeleteCommand" >
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
                                            <td style="font-size: 9pt">
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
                                            <td colspan="2" rowspan="2" style="width: 382px; text-align:left;" valign =middle >
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
                                                    text-decoration: none"><span style="color: #000000">回复留言</span></a>
                                               <a href='leaveWordView.aspx?ID=<%#DataBinder.Eval(Container,"DataItem.ID") %>'
                                                        style="font-size: 9pt; color: #0000ff; text-decoration: none"><span style="color: #000000">
                                                            查看回复</span></a> &nbsp;<asp:LinkButton ID="lnkbtnDelete" runat="server" CommandName="delete"
                                                                Font-Size="9pt" Font-Underline="False" ForeColor="Black">删除留言</asp:LinkButton>&nbsp;
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
                        <td colspan="3" style="width: 739px; height: 5px; vertical-align: top; text-align: center;">
                            <table cellpadding="0" cellspacing="0" style="width: 100%">
                                <tr>
                                    <td style="width: 302px; height: 15px">
                                    </td>
                                    <td style="width: 221px; height: 15px; text-align: center">
                                        <span style="font-size: 9pt">共有</span><asp:Label ID="labCount" runat="server" Font-Size="9pt"
                                            ForeColor="Red"></asp:Label><span style="font-size: 9pt; vertical-align: bottom;
                                                text-align: center">页</span></td>
                                    <td style="width: 130px; height: 15px; text-align: center">
                                        <span style="font-size: 9pt">当前第</span><asp:Label ID="labNowPage" runat="server"
                                            Font-Size="9pt" ForeColor="Red">1</asp:Label><span style="font-size: 9pt; vertical-align: bottom;
                                                text-align: center">页</span></td>
                                    <td style="vertical-align: bottom; width: 365px; height: 15px; text-align: center">
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
</asp:Content>
