<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="InfoAdd.aspx.cs" Inherits="InfoAdd" Title="供求信息---信息免费发布" %>

<%@ Register Src="UserControl/InfoSearch.ascx" TagName="InfoSearch" TagPrefix="uc1" %>
<%@ Register Src="UserControl/RecommendInfo.ascx" TagName="RecommendInfo" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table align="center" bgcolor="#ffffff" cellpadding="0" cellspacing="0" height="400"
        width="778">
        <tr>
            <td background="images/beijing.gif" valign="top">
                <table cellpadding="0" cellspacing="0" width="778">
                    <tr>
                        <td align="center" valign="top" width="216">
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
                                <tr>
                                    <td>
                                        <img height="30" src="images/left2.gif" width="213" /></td>
                                </tr>
                                <tr>
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
                                        <table cellpadding="0" cellspacing="0" height="149" width="194" class="txt">
                                            <tr>
                                                <td align="left" class="huise" width="194">
                                                    <span class="hongcu">吉林省***科技有限公司</span><br />
                                                    <table bgcolor="#cc0000" cellpadding="0" cellspacing="0" height="3" width="194">
                                                        <tr>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    联系地址：****市东*大街亚****广<br />
                                                    场座2205室<br />
                                                    联系电话：885**86 88**4275<br />
                                                    邮政编码：1**000</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td align="right" valign="top" width="560">
                            <table cellpadding="0" cellspacing="0" width="10">
                                <tr>
                                    <td>
                                        <img border="0" height="28" src="images/mianfeifabu.gif" width="561" /></td>
                                </tr>
                                <tr>
                                    <td align="left" height="400" style="text-align: center" valign="middle">
                <table style="width: 520px; height: 116px" cellpadding="0" cellspacing="0" class="txt">
                    <tr>
                        <td style="width: 85px" align="right">
                            信息类别：</td>
                        <td style="width: 336px" align="left">
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="121px">
                                <asp:ListItem>招聘信息</asp:ListItem>
                                <asp:ListItem>求职信息</asp:ListItem>
                                <asp:ListItem>培训信息</asp:ListItem>
                                <asp:ListItem>家教信息</asp:ListItem>
                                <asp:ListItem>公寓信息</asp:ListItem>
                                <asp:ListItem>物品求购</asp:ListItem>
                                <asp:ListItem>物品出售</asp:ListItem>
                                <asp:ListItem>求兑出兑</asp:ListItem>
                                <asp:ListItem>车辆信息</asp:ListItem>
                                <asp:ListItem>寻求合作</asp:ListItem>
                                <asp:ListItem>企业广告</asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="width: 89px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 85px" align="right">
                            信息标题：</td>
                        <td style="width: 336px" align="left">
                            <asp:TextBox ID="txtTitle" runat="server" Width="337px"></asp:TextBox></td>
                        <td style="width: 89px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle"
                                ErrorMessage="* 必填项"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 85px" align="right">
                            信息内容：</td>
                        <td style="width: 336px" align="left">
                            <asp:TextBox ID="txtInfo" runat="server" Height="147px" TextMode="MultiLine" Width="360px"></asp:TextBox></td>
                        <td style="width: 89px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtInfo"
                                ErrorMessage="* 必填项"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 85px" align="right">
                            联系人：</td>
                        <td style="width: 336px" align="left">
                            <asp:TextBox ID="txtLinkMan" runat="server"></asp:TextBox></td>
                        <td style="width: 89px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLinkMan"
                                ErrorMessage="* 必填项"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 85px; height: 24px;" align="right">
                            联系电话：</td>
                        <td style="width: 336px; height: 24px;" align="left">
                            <asp:TextBox ID="txtTel" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtTel"
                                ErrorMessage="格式：(3/4位)-（7/8位）" ValidationExpression="(\(\d{3,4}\)|\d{3,4}-)?\d{7,8}"></asp:RegularExpressionValidator></td>
                        <td style="width: 89px; height: 24px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTel"
                                ErrorMessage="* 必填项"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 85px; height: 43px">
                        </td>
                        <td style="width: 336px; height: 43px">
                        </td>
                        <td style="width: 89px; height: 43px">
                        </td>
                    </tr>
                </table>
            <asp:ImageButton ID="imgBtnAdd" runat="server" AlternateText="发布信息" Height="46px"
                    OnClick="imgBtnAdd_Click" Width="145px" ImageUrl="images/kaishifa.jpg" /></td>
                                </tr>
                                <tr>
                                    <td height="2">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
