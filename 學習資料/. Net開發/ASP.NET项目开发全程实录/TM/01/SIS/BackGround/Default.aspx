<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="BackGround_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>供求信息网「后台管理」</title>
    <link href="../Css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <table id="__01" border="0" cellpadding="0" cellspacing="0" height="598" width="1003">
            <tr>
                <td colspan="2">
                    <img alt="" border="0" height="93" src="images/guanli_01.jpg" usemap="#Map" width="1003" /></td>
            </tr>
            <tr>
                <td>
                    <img alt="" height="33" src="images/guanli_02.jpg" width="182" /></td>
                <td background="images/guanli_03.jpg" height="33" width="821">
                    <table cellpadding="0" cellspacing="0" width="589">
                        <tr>
                            <td width="41">
                                &nbsp;</td>
                            <td class="huise" width="546">
                                现在的位置：供求信息网 &gt; <span class="hong">后台管理系统</span>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td background="images/guanli_04.jpg" colspan="2" height="420" valign="top">
                    <table cellpadding="0" cellspacing="0" width="981">
                        <tr>
                            <td width="10">
                                &nbsp;</td>
                            <td width="144">
                                &nbsp;</td>
                            <td width="55">
                                &nbsp;</td>
                            <td class="huise" width="770">
                                &nbsp;</td>
                        </tr>
                    </table>
                    <table cellpadding="0" cellspacing="0" style="width: 991px">
                        <tr>
                            <td style="width: 185px; height: 374px" align="center">
                                <asp:TreeView ID="TreeView1" runat="server" ImageSet="Arrows" Width="84px">
                                    <ParentNodeStyle Font-Bold="False" />
                                    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                                    <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px"
                                        VerticalPadding="0px" />
                                    <Nodes>
                                        <asp:TreeNode Text="招聘信息" Value="招聘信息">
                                            <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/CheckInfo.aspx?id=招聘信息"
                                                Target="mainFrame"></asp:TreeNode>
                                            <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/DeleteInfo.aspx?id=招聘信息"
                                                Target="mainFrame"></asp:TreeNode>
                                        </asp:TreeNode>
                                        <asp:TreeNode Text="求职信息" Value="求职信息">
                                            <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/CheckInfo.aspx?id=求职信息"
                                                Target="mainFrame"></asp:TreeNode>
                                            <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/DeleteInfo.aspx?id=求职信息"
                                                Target="mainFrame"></asp:TreeNode>
                                        </asp:TreeNode>
                                        <asp:TreeNode Text="培训信息" Value="培训信息">
                                            <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/CheckInfo.aspx?id=培训信息"
                                                Target="mainFrame"></asp:TreeNode>
                                            <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/DeleteInfo.aspx?id=培训信息"
                                                Target="mainFrame"></asp:TreeNode>
                                        </asp:TreeNode>
                                        <asp:TreeNode Text="家教信息" Value="家教信息">
                                            <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/CheckInfo.aspx?id=家教信息"
                                                Target="mainFrame"></asp:TreeNode>
                                            <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/DeleteInfo.aspx?id=家教信息"
                                                Target="mainFrame"></asp:TreeNode>
                                        </asp:TreeNode>
                                        <asp:TreeNode Text="公寓信息" Value="公寓信息">
                                            <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/CheckInfo.aspx?id=公寓信息"
                                                Target="mainFrame"></asp:TreeNode>
                                            <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/DeleteInfo.aspx?id=公寓信息"
                                                Target="mainFrame"></asp:TreeNode>
                                        </asp:TreeNode>
                                        <asp:TreeNode Text="物品求购" Value="物品求购">
                                            <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/CheckInfo.aspx?id=物品求购"
                                                Target="mainFrame"></asp:TreeNode>
                                            <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/DeleteInfo.aspx?id=物品求购"
                                                Target="mainFrame"></asp:TreeNode>
                                        </asp:TreeNode>
                                        <asp:TreeNode Text="物品出售" Value="物品出售">
                                            <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/CheckInfo.aspx?id=物品出售"
                                                Target="mainFrame"></asp:TreeNode>
                                            <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/DeleteInfo.aspx?id=物品出售"
                                                Target="mainFrame"></asp:TreeNode>
                                        </asp:TreeNode>
                                        <asp:TreeNode Text="求兑出兑" Value="求兑出兑">
                                            <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/CheckInfo.aspx?id=求兑出兑"
                                                Target="mainFrame"></asp:TreeNode>
                                            <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/DeleteInfo.aspx?id=求兑出兑"
                                                Target="mainFrame"></asp:TreeNode>
                                        </asp:TreeNode>
                                        <asp:TreeNode Text="车辆信息" Value="车辆信息">
                                            <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/CheckInfo.aspx?id=车辆信息"
                                                Target="mainFrame"></asp:TreeNode>
                                            <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/DeleteInfo.aspx?id=车辆信息"
                                                Target="mainFrame"></asp:TreeNode>
                                        </asp:TreeNode>
                                        <asp:TreeNode Text="寻求合作" Value="寻求合作">
                                            <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/CheckInfo.aspx?id=寻求合作"
                                                Target="mainFrame"></asp:TreeNode>
                                            <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/DeleteInfo.aspx?id=寻求合作"
                                                Target="mainFrame"></asp:TreeNode>
                                        </asp:TreeNode>
                                        <asp:TreeNode Text="企业广告" Value="企业广告">
                                            <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/CheckInfo.aspx?id=企业广告"
                                                Target="mainFrame"></asp:TreeNode>
                                            <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/DeleteInfo.aspx?id=企业广告"
                                                Target="mainFrame"></asp:TreeNode>
                                        </asp:TreeNode>
                                        <asp:TreeNode Text="收费信息" Value="收费信息">
                                            <asp:TreeNode Text="信息发布" Value="信息发布" Target="mainFrame" NavigateUrl="~/BackGround/LeaguerInfo.aspx">
                                            </asp:TreeNode>
                                            <asp:TreeNode Text="信息删除" Value="信息删除" Target="mainFrame" NavigateUrl="~/BackGround/LeaguerInfoDelete.aspx">
                                            </asp:TreeNode>
                                        </asp:TreeNode>
                                    </Nodes>
                                    <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="5px"
                                        NodeSpacing="0px" VerticalPadding="0px" />
                                </asp:TreeView>
                            </td>
                            <td style="height: 374px; vertical-align: top;">
                                <iframe id="iframe1" name="mainFrame" style="width: 802px; height: 596px" frameborder="0">
                                </iframe>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td background="images/guanli_05.jpg" colspan="2" height="62" valign="top">
                    <table align="center" cellpadding="0" cellspacing="0" height="39" width="488">
                        <tr>
                            <td align="center" height="39">
                                <span class="huise">公司网址：www.mingri**ft.com &nbsp;&nbsp; 吉林省**科技有限公司 版权所有</span></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <!-- End ImageReady Slices -->
        <map name="Map">
            <area coords="820,63,906,89" href="../Default.aspx" shape="RECT" />
            <area coords="909,61,994,89" href="<%PageExit(); %>" shape="RECT" />
        </map>
    </form>
</body>
</html>
