<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="webQYGG.aspx.cs" Inherits="ShowPage_webQYGG" Title="供求信息---企业广告" %>

<%@ Register Src="../UserControl/RecommendInfo.ascx" TagName="RecommendInfo" TagPrefix="uc2" %>

<%@ Register Src="../UserControl/InfoSearch.ascx" TagName="InfoSearch" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table background="images/beijing.gif" bgcolor="#ffffff" cellpadding="0" cellspacing="0"
        width="778">
        <tr>
            <td align="center" style="height: 1016px" valign="top" width="216">
                <table cellpadding="0" cellspacing="0" width="59">
                    <tr>
                        <td valign="top">
                            <img height="28" src="images/left1.GIF" width="213" /></td>
                    </tr>
                    <tr>
                        <td align="center" bgcolor="#fffef6" height="166" valign="middle">
                            <uc2:RecommendInfo ID="RecommendInfo1" runat="server" />
                        </td>
                    </tr>
                    <tr style="font-family: 宋体">
                        <td>
                            <img height="30" src="images/left2.gif" width="213" /></td>
                    </tr>
                    <tr style="font-family: 宋体">
                        <td background="images/xiaobei.gif" height="105">
                            <uc1:InfoSearch ID="InfoSearch1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img height="29" src="images/left3.gif" width="214" /></td>
                    </tr>
                    <tr>
                        <td align="center">
                            <table cellpadding="0" cellspacing="0" height="149" width="194">
                                <tr>
                                    <td align="left" class="huise" width="194">
                                        <span><span style="color: #000000"><span style="font-family: Arial"><span class="hongcu">
                                            吉林省***科技有限公司</span><br />
                                        </span></span></span>
                                        <table bgcolor="#cc0000" cellpadding="0" cellspacing="0" height="3" style="color: #000000;
                                            font-family: Arial" width="194">
                                            <tr>
                                                <td>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <span class="banhui"><span style="color: #000000"><span style="font-family: Arial">联系地址：****</span>市东*大街亚****广<br />
                                        </span><span style="color: #000000">场座2205室<br />
                                        </span><span style="color: #000000">联系电话：885**86 88**4275<br />
                                        </span><span style="color: #000000">邮政编码：1**000</span></span></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td align="center" style="width: 560px; color: #000000; height: 1016px" valign="top" class="txt">
                <table cellpadding="0" cellspacing="0" width="10">
                    <tr>
                        <td>
                            <img border="0" height="28" src="images/right5.gif" width="561" /></td>
                    </tr>
                    <tr>
                        <td align="left" bgcolor="#ffffff" height="20" valign="top">
                            <asp:DataList ID="dlCharge" runat="server" Width="543px">
                                <ItemTemplate>
                                    <table align="center" cellpadding="0" cellspacing="0" width="543">
                                        <tr>
                                            <td>
                                                <span class="hongcu">『<%# DataBinder.Eval(Container.DataItem,"type") %>』</span><span
                                                    class="chengse"><%# DataBinder.Eval(Container.DataItem,"title") %></span> <span class="huise1">
                                                        <%#DataBinder.Eval(Container.DataItem,"date") %>
                                                    </span>
                                                <br />
                                                <span class="shenlan">&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<%#DataBinder.Eval(Container.DataItem,"info") %>
                                                </span>
                                                <br />
                                                <span class="chengse">联系人：<%#DataBinder.Eval(Container.DataItem,"linkMan") %>
                                                    联系电话：<%#DataBinder.Eval(Container.DataItem,"tel") %></span></td>
                                        </tr>
                                        <tr style="color: #000000">
                                            <td align="center">
                                                <img height="1" src="images/longline.gif" width="525" /></td>
                                        </tr>
                                        <tr style="color: #000000">
                                            <td height="10">
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList></td>
                    </tr>
                    <tr style="color: #000000">
                        <td height="0">
                        </td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="0" style="color: #000000" width="10">
                    <tr>
                        <td height="75" valign="top">
                            <img height="67" src="images/banner1.jpg" width="559" /></td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="0" style="color: #000000" width="10">
                    <tr>
                        <td style="width: 581px">
                            <img border="0" height="28" src="images/right6.gif" width="561" /></td>
                    </tr>
                    <tr>
                        <td align="left" height="20" style="width: 581px" valign="top">
                            &nbsp;<asp:DataList ID="dlFree" runat="server">
                                <ItemTemplate>
                                    <table align="center" cellpadding="0" cellspacing="0" width="543">
                                        <tr>
                                            <td class="huise">
                                                <span class="shenlancu">『<%# DataBinder.Eval(Container.DataItem,"type") %>』</span><span
                                                    class="banhui"><%# DataBinder.Eval(Container.DataItem,"title") %>[
                                                        <%# DataBinder.Eval(Container.DataItem,"date") %>
                                                        ]
                                                    <br />
                                                </span><span class="banhui">&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                                        <%# DataBinder.Eval(Container.DataItem,"info") %>
                                                    <br />
                                                </span><span class="banhui">联系人：<%#DataBinder.Eval(Container.DataItem,"linkMan") %>
                                                    联系电话：<%#DataBinder.Eval(Container.DataItem,"tel") %></span></td>
                                        </tr>
                                        <tr style="color: #000000">
                                            <td align="center">
                                                <img height="1" src="images/longline.gif" width="525" /></td>
                                        </tr>
                                        <tr style="color: #000000">
                                            <td height="10">
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList></td>
                    </tr>
                    <tr>
                        <td style="width: 581px; height: 11px">
                        </td>
                    </tr>
                </table>
                当前页码为［<asp:Label ID="lblCurrentPage" runat="server" Text="1"></asp:Label>］页 总页码［<asp:Label
                    ID="lblSumPage" runat="server" Text="0"></asp:Label>］页
                <asp:LinkButton ID="lnkBtnFirst" runat="server" Font-Underline="False" OnClick="lnkBtnFirst_Click"> 第一页 </asp:LinkButton>
                <asp:LinkButton ID="lnkBtnPrevious" runat="server" Font-Underline="False" OnClick="lnkBtnPrevious_Click"> 上一页 </asp:LinkButton>
                <asp:LinkButton ID="lnkBtnNext" runat="server" Font-Underline="False" OnClick="lnkBtnNext_Click"> 下一页 </asp:LinkButton>
                <asp:LinkButton ID="lnkBtnLast" runat="server" Font-Underline="False" OnClick="lnkBtnLast_Click"> 末一页 </asp:LinkButton></td>
        </tr>
    </table>
</asp:Content>

