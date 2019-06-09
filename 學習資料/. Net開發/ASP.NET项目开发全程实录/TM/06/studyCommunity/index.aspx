<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" %>

<%@ Register Src="userBulletinInfo.ascx" TagName="userBulletinInfo" TagPrefix="uc5" %>
<%@ Register Src="userSound.ascx" TagName="userSound" TagPrefix="uc6" %>
<%@ Register Src="userVideo.ascx" TagName="userVideo" TagPrefix="uc7" %>
<%@ Register Src="bottomT.ascx" TagName="bottomT" TagPrefix="uc4" %>
<%@ Register Src="search.ascx" TagName="search" TagPrefix="uc3" %>
<%@ Register Src="dh.ascx" TagName="dh" TagPrefix="uc2" %>
<%@ Register Src="entry.ascx" TagName="entry" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>

    <script>
     function openPWD(i)
   {
      window.showModalDialog("bulletinInfo.aspx?ID="+i,"","dialogHeight: 300px; dialogWidth: 480px;dialogTop:px; dialogLeft:px; edge: Raised; center: Yes; help: No; resizable: No; status: No;scroll:No");
   }
    
    </script>

    <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
    <link href="css/css.css" rel="stylesheet" type="text/css">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            &nbsp;</div>
        <table id="__01" width="1002" height="83" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="814" height="83">
                    <uc2:dh ID="Dh1" runat="server" />
                </td>
            </tr>
        </table>
        <table width="802" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td height="33" valign="top" background="images/index_03.jpg" style="width: 746px">
                    <asp:Panel align="center" ID="PanelEntry" runat="server">
                        &nbsp;<uc1:entry ID="Entry1" runat="server" />
                    </asp:Panel>
                    <asp:Panel ID="PanelHello" runat="server">
                        欢迎<asp:Label ID="Label1" runat="server" Text="Label" Width="11px"></asp:Label>登录！<asp:Button
                            ID="Button1" runat="server" OnClick="Button1_Click" Text="退出登录" />&nbsp;<br />
                        &nbsp;
                    </asp:Panel>
                </td>
                <td height="33" valign="top" background="images/index_03.jpg" style="width: 5px">
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <table width="190" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <img src="images/index_05.jpg" width="802" height="126"></td>
            </tr>
        </table>
        <table width="190" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <img src="images/index_06.jpg" width="802" height="3"></td>
            </tr>
        </table>
        <table width="802" height="600" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td width="240" valign="top">
                    <table width="239" cellpadding="0" cellspacing="0" style="height: 5px">
                        <tr>
                            <td>
                                </td>
                        </tr>
                        <tr>
                            <td>
                                <uc5:userBulletinInfo id="UserBulletinInfo1" runat="server">
                                </uc5:userBulletinInfo></td>
                        </tr>
                    </table>
                    <table width="100%" height="4" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
                    <uc6:userSound id="UserSound1" runat="server">
                    </uc6:userSound>
                    <uc7:userVideo id="UserVideo1" runat="server">
                    </uc7:userVideo></td>
                <td valign="top" style="width: 560px">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="right">
                                <table width="239" height="29" align="right" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="width: 559px">
                                            <img src="images/sousuolangif.gif" width="557" height="29"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 559px; height: 77px; text-align: left">
                                            <uc3:search ID="Search1" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table width="100%" height="4" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="right">
                                <table width="239" height="29" align="right" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <img src="images/shipin.gif" width="557" height="29"></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table width="100%" cellpadding="1" cellspacing="1" bgcolor="D4D4D4">
                                                <tr>
                                                    <td bgcolor="#FFFFFF" style="height: 41px; text-align: left;">
                                                        <asp:GridView ID="gvNewVideo" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                            Width="549px" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px"
                                                            CellPadding="3" CellSpacing="1" GridLines="None" CssClass="chengse" Height="185px">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="最新视频">
                                                                    <ItemTemplate>
                                                                        <a target="_blank" href='seeVideo.aspx?VideoID=<%#Eval("VideoID") %>' class="heihei">
                                                                            <%#Eval("VideoName") %>
                                                                        </a>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="TypeName" HeaderText="语言类型" />
                                                                <asp:BoundField HeaderText="发布时间" DataField="FBDate" DataFormatString="{0:yy-MM-dd}"
                                                                    HtmlEncode="False" />
                                                            </Columns>
                                                            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                                            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                                            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                                            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table width="100%" height="5" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="right">
                                <table width="239" height="29" align="right" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="height: 22px">
                                            <img src="images/yinpin.gif" width="557" height="29"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left">
                                            <asp:GridView ID="gvNewSound" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1"
                                                GridLines="None" ShowHeader="False" Width="550px" CssClass="chengse">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <a target="_blank" href='playSound.aspx?SoundID=<%#Eval("SoundID") %>' class="heihei">
                                                                <%#Eval("SoundName") %>
                                                            </a>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="TypeName" HeaderText="语言类型" />
                                                    <asp:BoundField DataField="FBDate" HeaderText="发布日期" DataFormatString="{0:yy-MM-dd}"
                                                        HtmlEncode="False" />
                                                </Columns>
                                                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" valign="top">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="height: 84px; text-align: center">
                                <uc4:bottomT ID="BottomT1" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <!-- End ImageReady Slices -->
        <map name="Map">
            <area shape="rect" coords="408,39,467,57" href="issuance.aspx">
            <area shape="rect" coords="509,38,571,56" href="typeInfo.aspx">
            <area shape="rect" coords="614,38,674,57" href="typeInfo.aspx">
            <area shape="rect" coords="703,38,766,56" href="login.aspx">
            <area shape="rect" coords="794,38,853,57" href="mailto:tmoonbook@sina.com">
        </map>
    </form>
</body>
</html>
