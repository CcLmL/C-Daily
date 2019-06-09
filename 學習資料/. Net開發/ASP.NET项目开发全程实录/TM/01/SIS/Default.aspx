<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" Title="供求信息网" %>

<%@ Register Src="UserControl/RecommendInfo.ascx" TagName="RecommendInfo" TagPrefix="uc1" %>
<%@ Register Src="UserControl/InfoSearch.ascx" TagName="InfoSearch" TagPrefix="uc2" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1">
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
                                        <uc1:RecommendInfo ID="RecommendInfo1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <img height="30" src="images/left2.gif" width="213" /></td>
                                </tr>
                                <tr>
                                    <td background="images/xiaobei.gif" height="105">
                                        <uc2:InfoSearch ID="InfoSearch1" runat="server" />
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
                                                <td align="left" class="huise1" width="194">
                                                    <span class="hongcu">吉林省***科技有限公司</span><br />
                                                    <table bgcolor="#cc0000" cellpadding="0" cellspacing="0" height="3" width="194">
                                                        <tr>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <br />
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
                                    <td colspan="2">
                                        <img border="0" height="28" src="images/right1.gif" usemap="#Map" width="561" />
                                        <map id="Map" name="Map">
                                            <area coords="223,4,265,21" href="ShowPage/webZP.aspx" shape="RECT" />
                                            <area coords="508,5,550,22" href="ShowPage/webPX.aspx" shape="RECT" />
                                        </map>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" style="height: 120px" valign="top" width="285">
                                        <asp:DataList ID="dlZP" runat="server" CssClass="hong">
                                            <ItemTemplate>
                                                <table align="center" cellpadding="0" cellspacing="0" width="266">
                                                    <tr>
                                                        <td>
                                                            <span class="hong" style="color: #000000">·<a class="huise" href="#" 
             onClick="window.open('ShowLeaguerInfo.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id") %>','','height=258, width=479, top=200, left=200')"><%#DataBinder.Eval(Container.DataItem,"title") %></a></span></td>
                                                    </tr>
                                                    <tr style="color: #000000">
                                                        <td>
                                                            <img height="1" src="images/line.gif" width="266" /></td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:DataList></td>
                                    <td align="left" style="color: #000000; height: 120px; vertical-align: top;" width="276"><asp:DataList ID="dlPX" runat="server">
                                        <ItemTemplate>
                                            <table align="center" cellpadding="0" cellspacing="0" width="266">
                                                <tr>
                                                    <td>
                                                        <span class="hong" style="color: #000000">·<a class="huise" href="#" 
             onClick="window.open('ShowLeaguerInfo.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id") %>','','height=258, width=479, top=200, left=200')"
                                                                ><%#DataBinder.Eval(Container.DataItem,"title") %></a></span></td>
                                                </tr>
                                                <tr style="color: #000000">
                                                    <td>
                                                        <img height="1" src="images/line.gif" width="266" /></td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList></td>
                                </tr>
                                <tr style="color: #000000">
                                    <td colspan="2" style="height: 5px">
                                    </td>
                                </tr>
                            </table>
                            <table cellpadding="0" cellspacing="0" style="color: #000000" width="10">
                                <tr>
                                    <td colspan="2">
                                        <img border="0" height="28" src="images/right2.gif" usemap="#MapMap" width="561" />
                                        <map id="MapMap" name="MapMap">
                                            <area coords="223,4,265,21" href="ShowPage/webGY.aspx" shape="RECT" />
                                            <area coords="508,5,550,22" href="ShowPage/webJJ.aspx" shape="RECT" />
                                        </map>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" valign="top" width="285" style="height: 120px"><asp:DataList ID="dlGY" runat="server">
                                        <ItemTemplate>
                                            <table align="center" cellpadding="0" cellspacing="0" width="266">
                                                <tr>
                                                    <td>
                                                        <span class="hong" style="color: #000000">·<a class="huise" href="#" 
             onClick="window.open('ShowLeaguerInfo.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id") %>','','height=258, width=479, top=200, left=200')"
                                                                ><%#DataBinder.Eval(Container.DataItem,"title") %></a></span></td>
                                                </tr>
                                                <tr style="color: #000000">
                                                    <td>
                                                        <img height="1" src="images/line.gif" width="266" /></td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList></td>
                                    <td align="left" style="color: #000000; vertical-align: top; height: 120px;" width="276"><asp:DataList ID="dlJJ" runat="server">
                                        <ItemTemplate>
                                            <table align="center" cellpadding="0" cellspacing="0" width="266">
                                                <tr>
                                                    <td>
                                                        <span class="hong" style="color: #000000">·<a class="huise" href="#" 
             onClick="window.open('ShowLeaguerInfo.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id") %>','','height=258, width=479, top=200, left=200')"
                                                                ><%#DataBinder.Eval(Container.DataItem,"title") %></a></span></td>
                                                </tr>
                                                <tr style="color: #000000">
                                                    <td>
                                                        <img height="1" src="images/line.gif" width="266" /></td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList></td>
                                </tr>
                                <tr style="color: #000000">
                                    <td colspan="2" height="11">
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
                                    <td colspan="2">
                                        <img border="0" height="28" src="images/right3.gif" usemap="#MapMapMap" width="561" />
                                        <map id="MapMapMap" name="MapMapMap">
                                            <area coords="223,4,265,21" href="ShowPage/webWPQG.aspx" shape="RECT" />
                                            <area coords="508,5,550,22" href="ShowPage/webWPCS.aspx" shape="RECT" />
                                        </map>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" valign="top" width="285" style="height: 120px"><asp:DataList ID="dlWPQG" runat="server">
                                        <ItemTemplate>
                                            <table align="center" cellpadding="0" cellspacing="0" width="266">
                                                <tr>
                                                    <td>
                                                        <span class="hong" style="color: #000000">·<a class="huise" href="#" 
             onClick="window.open('ShowLeaguerInfo.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id") %>','','height=258, width=479, top=200, left=200')"
                                                                ><%#DataBinder.Eval(Container.DataItem,"title") %></a></span></td>
                                                </tr>
                                                <tr style="color: #000000">
                                                    <td>
                                                        <img height="1" src="images/line.gif" width="266" /></td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList></td>
                                    <td align="left" style="color: #000000; vertical-align: top; height: 120px;" width="276"><asp:DataList ID="dlWPCS" runat="server">
                                        <ItemTemplate>
                                            <table align="center" cellpadding="0" cellspacing="0" width="266">
                                                <tr>
                                                    <td>
                                                        <span class="hong" style="color: #000000">·<a class="huise" href="#" 
             onClick="window.open('ShowLeaguerInfo.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id") %>','','height=258, width=479, top=200, left=200')"
                                                                ><%#DataBinder.Eval(Container.DataItem,"title") %></a></span></td>
                                                </tr>
                                                <tr style="color: #000000">
                                                    <td>
                                                        <img height="1" src="images/line.gif" width="266" /></td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList></td>
                                </tr>
                                <tr style="color: #000000">
                                    <td colspan="2" height="11">
                                    </td>
                                </tr>
                            </table>
                            <table cellpadding="0" cellspacing="0" style="color: #000000" width="10">
                                <tr>
                                    <td colspan="2">
                                        <img border="0" height="28" src="images/right4.gif" usemap="#MapMapMap2" width="561" />
                                        <map id="MapMapMap2" name="MapMapMap2">
                                            <area coords="223,4,265,21" href="ShowPage/webQDCD.aspx" shape="RECT" />
                                            <area coords="508,5,550,22" href="ShowPage/webCL.aspx" shape="RECT" />
                                        </map>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" valign="top" width="285" style="height: 120px"><asp:DataList ID="dlQDCD" runat="server">
                                        <ItemTemplate>
                                            <table align="center" cellpadding="0" cellspacing="0" width="266">
                                                <tr>
                                                    <td>
                                                        <span class="hong" style="color: #000000">·<a class="huise" href="#" 
             onClick="window.open('ShowLeaguerInfo.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id") %>','','height=258, width=479, top=200, left=200')"
                                                               ><%#DataBinder.Eval(Container.DataItem,"title") %></a></span></td>
                                                </tr>
                                                <tr style="color: #000000">
                                                    <td>
                                                        <img height="1" src="images/line.gif" width="266" /></td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList></td>
                                    <td align="left" style="color: #000000; vertical-align: top; height: 120px;" width="276"><asp:DataList ID="dlCL" runat="server">
                                        <ItemTemplate>
                                            <table align="center" cellpadding="0" cellspacing="0" width="266">
                                                <tr>
                                                    <td>
                                                        <span class="hong" style="color: #000000">·<a class="huise" href="#" 
             onClick="window.open('ShowLeaguerInfo.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id") %>','','height=258, width=479, top=200, left=200')"
                                                                ><%#DataBinder.Eval(Container.DataItem,"title") %></a></span></td>
                                                </tr>
                                                <tr style="color: #000000">
                                                    <td>
                                                        <img height="1" src="images/line.gif" width="266" /></td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList></td>
                                </tr>
                                <tr style="color: #000000">
                                    <td colspan="2" height="11">
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
