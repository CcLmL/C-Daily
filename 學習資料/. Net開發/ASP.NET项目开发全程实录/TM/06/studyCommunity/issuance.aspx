<%@ Page Language="C#" AutoEventWireup="true" CodeFile="issuance.aspx.cs" Inherits="issuance" %>

<%@ Register Src="userBulletinInfo.ascx" TagName="userBulletinInfo" TagPrefix="uc3" %>
<%@ Register Src="userSound.ascx" TagName="userSound" TagPrefix="uc4" %>
<%@ Register Src="userVideo.ascx" TagName="userVideo" TagPrefix="uc5" %>
<%@ Register Src="bottomT.ascx" TagName="bottomT" TagPrefix="uc6" %>
<%@ Register Src="entry.ascx" TagName="entry" TagPrefix="uc2" %>
<%@ Register Src="dh.ascx" TagName="dh" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
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
        <div style="text-align: center">
            <uc1:dh ID="Dh1" runat="server" />
            <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 711px;
                height: 499px">
                <tr>
                    <td rowspan="1" valign="top" style="text-align: left">
                        <uc3:userBulletinInfo ID="UserBulletinInfo1" runat="server" />
                        <uc5:userVideo ID="UserVideo1" runat="server" />
                        <uc4:userSound ID="UserSound1" runat="server" />
                    </td>
                    <td colspan="3" rowspan="3" valign="top" align="center" style="text-align: left">
                        <table cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td style="height: 27px; text-align: center" valign="top">
                                    <img src="images/pangbian.gif" width="558" height="29">
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center; height: 27px;" valign="top">
                                    <table id="__01" align="center" border="0" cellpadding="0" cellspacing="0" height="22"
                                        width="428">
                                        <tr>
                                            <td style="height: 22px">
                                                <asp:ImageButton ID="imgbtnIssuance" runat="server" ImageUrl="images/fabuanniu_01.jpg"
                                                    OnClick="imgbtnIssuance_Click" CausesValidation="False" />
                                                <td style="height: 22px">
                                                    <asp:ImageButton ID="imgbtnYFVideo" runat="server" ImageUrl="images/fabuanniu_02.jpg"
                                                        OnClick="imgbtnYFVideo_Click" CausesValidation="False" />
                                                </td>
                                                <td style="height: 22px">
                                                    <asp:ImageButton ID="imgbtnYFSound" runat="server" ImageUrl="images/fabuanniu_03.jpg"
                                                        OnClick="imgbtnYFSound_Click" CausesValidation="False" />
                                                </td>
                                                <td style="height: 22px">
                                                    <asp:ImageButton ID="imgbtnExit" runat="server" ImageUrl="images/fabuanniu_04.gif"
                                                        OnClick="imgbtnExit_Click" CausesValidation="False" />
                                                </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#FFFFFF" style="height: 27px; text-align: center" valign="top">
                                    <table width="516" align="center" cellpadding="0" cellspacing="0" background="images/dline.gif">
                                        <tr>
                                            <td height="1" class="shenlancu" style="text-align: center">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <span style="font-size: 16pt; color: #ff00ff"><strong><span style="color: #6633cc"></span>
                        </strong></span>
                        <asp:Panel ID="PanelFB" runat="server" Height="50px" Width="500px">
                            <img height="29" src="images/fbjc.gif" style="width: 417px" />
                            <table id="TABLE1" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="right" style="width: 86px; height: 24px;">
                                        教程名称：</td>
                                    <td style="width: 155px; height: 24px;">
                                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                                    <td style="width: 100px; height: 24px;">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="必须填写"
                                            ControlToValidate="txtName"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" style="width: 86px; height: 1px;" valign="top">
                                        教程类型：</td>
                                    <td style="width: 155px; height: 1px; text-align: left;" valign="top">
                                        <table border="0" cellpadding="0" cellspacing="0" style="width: 179px">
                                            <tr>
                                                <td style="width: 63px; height: 20px;">
                                                    <asp:RadioButton ID="rdibtnVideo" runat="server" GroupName="Type" Text="视频" Checked="True" /></td>
                                                <td style="width: 100px; height: 20px;">
                                                    <asp:RadioButton ID="rdibtnSound" runat="server" GroupName="Type" Text="语音" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 100px; height: 1px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 86px; height: 22px">
                                        课程类型：</td>
                                    <td style="width: 155px; height: 22px">
                                        <asp:DropDownList ID="ddlLanguage" runat="server" DataTextField="TypeName" DataValueField="TypeID">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 100px; height: 22px">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 86px" valign="top">
                                        内容简介：</td>
                                    <td style="width: 155px">
                                        <asp:TextBox ID="txtContent" runat="server" Height="140px" Width="142px" TextMode="MultiLine"></asp:TextBox></td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 86px; height: 20px;">
                                        上传教程：</td>
                                    <td style="width: 155px; height: 20px;">
                                        <asp:FileUpload ID="FileUpload1" runat="server" /></td>
                                    <td style="width: 100px; height: 20px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" rowspan="3" style="text-align: center; height: 24px;">
                                        <asp:Button ID="btnFB" runat="server" Text="发布" Width="65px" OnClick="btnFB_Click" />
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                </tr>
                            </table>
                            <strong></strong>
                        </asp:Panel>
                        <asp:Panel CssClass="chengse" ID="PanelYvideo" runat="server" >
                            <span>
                                <br />
                                <asp:GridView ID="gvFBVideo" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvFBVideo_RowDataBound"
                                    OnRowDeleting="gvFBVideo_RowDeleting" Width="409px">
                                    <Columns>
                                        <asp:BoundField HeaderText="编号" />
                                        <asp:BoundField DataField="VideoName" HeaderText="视频名称" />
                                        <asp:BoundField DataField="TypeName" HeaderText="语言类型" />
                                        <asp:BoundField HeaderText="发布日期" DataField="FBDate" DataFormatString="{0:yy-MM-dd}"
                                            HtmlEncode="False" />
                                        <asp:HyperLinkField DataNavigateUrlFields="VideoID" DataNavigateUrlFormatString="seeVideo.aspx?VideoID={0}"
                                            HeaderText="查看留言" NavigateUrl="~/seeVideo.aspx" Target="_blank" Text="查看" />
                                        <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                                    </Columns>
                                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                                </asp:GridView>
                                &nbsp;&nbsp; </span>
                        </asp:Panel>
                        <asp:Panel CssClass="chengse" ID="PanelYsound" runat="server" >
                            <strong>
                                <br />
                                <asp:GridView ID="gvFBSound" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvFBSound_RowDataBound"
                                    OnRowDeleting="gvFBSound_RowDeleting" Width="495px">
                                    <Columns>
                                        <asp:BoundField HeaderText="编号" />
                                        <asp:BoundField DataField="SoundName" HeaderText="语音名称" />
                                        <asp:BoundField DataField="TypeName" HeaderText="语言类型" />
                                        <asp:BoundField DataField="FBDate" DataFormatString="{0:yy-MM-dd}" HeaderText="发布日期"
                                            HtmlEncode="False" />
                                        <asp:HyperLinkField DataNavigateUrlFields="SoundID" DataNavigateUrlFormatString="playSound.aspx?SoundID={0}"
                                            HeaderText="查看留言" Target="_blank" Text="查看">
                                            <ControlStyle Font-Underline="False" />
                                        </asp:HyperLinkField>
                                        <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                                    </Columns>
                                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                                </asp:GridView>
                            </strong>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td style="width: 76px;" valign="top" rowspan="2">
                    </td>
                </tr>
                <tr>
                </tr>
                <tr>
                    <td style="height: 31px; text-align: center;" colspan="4">
                        <uc6:bottomT ID="BottomT1" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
