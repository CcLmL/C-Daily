<%@ Page Language="C#" AutoEventWireup="true" CodeFile="searchList.aspx.cs" Inherits="searchList" %>

<%@ Register Src="userBulletinInfo.ascx" TagName="userBulletinInfo" TagPrefix="uc3" %>
<%@ Register Src="userSound.ascx" TagName="userSound" TagPrefix="uc4" %>
<%@ Register Src="userVideo.ascx" TagName="userVideo" TagPrefix="uc5" %>

<%@ Register Src="bottomT.ascx" TagName="bottomT" TagPrefix="uc2" %>

<%@ Register Src="dh.ascx" TagName="dh" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
  
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="text-align: center">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 692px; height: 394px">
                <tr>
                    <td colspan="2" style="text-align: left">
                        <uc1:dh ID="Dh1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    <img src="images/index_05.jpg" width="802" height="126">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 62%; height: 366px">
                            <tr>
                                <td style="width: 195px">
                                    <uc3:userBulletinInfo ID="UserBulletinInfo1" runat="server" />
                                    <uc4:userSound ID="UserSound1" runat="server" />
                                    <uc5:userVideo ID="UserVideo1" runat="server" />
                                </td>
                                <td style="width: 100px" valign="top">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="192px" Width="435px" CssClass="chengse">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="VideoID" DataNavigateUrlFormatString="seeVideo.aspx?VideoID={0}"
                    DataTextField="VideoName" HeaderText="视频名称" />
                <asp:BoundField DataField="Name" HeaderText="发布人" />
                <asp:BoundField DataField="FBDate" HeaderText="发布日期" />
            </Columns>
        </asp:GridView>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Height="133px"
                            Width="433px" CssClass="chengse">
                            <Columns>
                                <asp:HyperLinkField DataNavigateUrlFields="SoundID" DataNavigateUrlFormatString="playSound.aspx?SoundID={0}"
                                    DataTextField="SoundName" HeaderText="语音名称" />
                                <asp:BoundField DataField="Name" HeaderText="发布人" />
                                <asp:BoundField DataField="FBDate" HeaderText="发布日期" />
                            </Columns>
                        </asp:GridView>
                        <asp:Panel ID="Panel1" runat="server" Height="50px" Width="400px">
                            <span style="font-size: 16pt; color: #ff0033"><strong>查询的教程不存在！请返回。</strong></span><br />
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/index.aspx" Width="44px">返回</asp:HyperLink></asp:Panel>
                                </td>
                            </tr>
                        </table>
                        &nbsp; &nbsp;<br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <uc2:bottomT ID="BottomT1" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    
    </div>
    </form>
</body>
</html>
