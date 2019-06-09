<%@ Page Language="C#" AutoEventWireup="true" CodeFile="playSound.aspx.cs" Inherits="seeSound" %>

<%@ Register Src="bottomT.ascx" TagName="bottomT" TagPrefix="uc1" %>
<%@ Register Src="userSound.ascx" TagName="userSound" TagPrefix="uc2" %>
<%@ Register Src="userVideo.ascx" TagName="userVideo" TagPrefix="uc3" %>
<%@ Register Src="userBulletinInfo.ascx" TagName="userBulletinInfo" TagPrefix="uc4" %>
<%@ Register Src="dh.ascx" TagName="dh" TagPrefix="uc5" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <br />
<!-- ImageReady Slices (互动社区.psd) -->
<table id="__01" width="1002" height="83" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="814" height="83">
            <uc5:dh ID="Dh1" runat="server" />
        </td>
	</tr>
</table>
<table width="802" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="33" valign="top" background="images/index_03.jpg"></td>
  </tr>
</table>
<table width="190" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/index_05.jpg" width="802" height="126"></td>
  </tr>
</table>
<table width="190" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/index_06.jpg" width="802" height="3"></td>
  </tr>
</table>
<table width="802" height="600" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="240" valign="top">
      <table width="100%" height="4" cellpadding="0" cellspacing="0">
        <tr>
          <td>
              <uc4:userBulletinInfo ID="UserBulletinInfo1" runat="server" />
          </td>
        </tr>
      </table>
      <table width="239" height="29" cellpadding="0" cellspacing="0">
        <tr>
          <td>
              <uc3:userVideo ID="UserVideo1" runat="server" />
          </td>
        </tr>
        <tr>
          <td valign="top">
            <table width="100%" height="4" cellpadding="0" cellspacing="0">
              <tr>
                <td></td>
              </tr>
            </table>
              <uc2:userSound ID="UserSound1" runat="server" />
          </td>
        </tr>
      </table>
      </td>
    <td width="560" valign="top" style="text-align: center">
        <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 517px;
            height: 45px">
            <tr style="font-weight: bold; font-size: 14pt">
                <td align="center" colspan="4" style="height: 2%; width: 735px;">
                <img src="images/pangbian.gif" width="558" height="29">
                </td>
            </tr>
            <tr style="font-weight: bold; font-size: 14pt">
                <td align="center" colspan="4" style="height: 6%; width: 735px;">
                    &nbsp; &nbsp; &nbsp; &nbsp; <span style="font-size: 20px; color: blue">
                        <%=SoundTitle%>
                    </span><span style="font-size: 15px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 点击率：<%=ClickSum%></span>
                </td>
            </tr>
            <tr style="font-weight: bold; font-size: 14pt">
                <td align="center" colspan="4" style="height: 6%; width: 735px;" valign="top">
                    <embed noerror="true" src="<%=SUrl%>" style="width: 516px; height: 40px"></embed>&nbsp;<br />
                    &nbsp;
                </td>
            </tr>
        </table>
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 495px; height: 140px">
                        <tr>
                            <td align="left" style="width: 34px" valign="top">
                                <asp:Label ID="Label1" runat="server" Text="内容简介：" Width="112px"></asp:Label></td>
                            <td align="left" colspan="2" rowspan="3">
                                <%=Content %>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="width: 34px" valign="top">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 34px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 34px; height: 22px">
                            </td>
                            <td align="right" style="width: 897px; height: 22px">
                                发布人：<%=Name %></td>
                            <td style="width: 350px; height: 22px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 34px; height: 23px">
                            </td>
                            <td align="right" style="width: 897px; height: 23px">
                                发布日期：<%=FBDate%></td>
                            <td style="width: 350px; height: 23px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 23px; text-align: center">
                                <asp:Button ID="btnDown" runat="server" Text="下载" Width="70px" OnClick="btnDown_Click" /></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 23px; text-align: center" valign="top">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="height: 44px">
                                            <asp:TextBox ID="txtYzm" runat="server" Width="69px"></asp:TextBox></td>
                                        <td style="height: 44px">
                                            <asp:Image ID="Image1" runat="server" Height="24px" Width="51px" />
                                            <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="12pt" OnClick="LinkButton1_Click"
                                                Width="71px">看不清</asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <span style="font-size: 12pt">留言内容：</span></td>
                                        <td>
                                            <asp:TextBox ID="txtCont" runat="server" Height="88px" TextMode="MultiLine" Width="212px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Button ID="btnSpeak" runat="server" OnClick="Button3_Click" Text="发　言" Width="74px" /></td>
                                    </tr>
                                </table>
                                <asp:DataList ID="dlSpeak" runat="server" Width="486px" >
                                    <ItemTemplate>
                                        <table backcolor="Brown" border="1" cellpadding="0" cellspacing="0">
                                            <tr　bgcolor="#B0A299" class="hongcu">
                                                <td　bgcolor="#B0A299">
                                                    <span style="font-size: 12pt">发言人：</span></td>
                                                <td　bgcolor="#B0A299">
                                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("Spokesman") %>'></asp:Label></td>
                                            </tr>
                                            <tr　bgcolor="#FBF5EC" class="chengse">
                                                <td valign="top">
                                                    <span style="font-size: 12pt">发言内容：</span></td>
                                                <td>
                                                    <asp:TextBox ID="TextBox3" runat="server" Font-Size="12pt" Height="95px" ReadOnly="True"
                                                        Text='<%#Eval("SpeakContent") %>' TextMode="MultiLine" Width="351px"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                                <td>
                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                        <tr　bgcolor="#FBF5EC" class="chengse">
                                                            <td>
                                                                <span style="font-size: 12pt">发言时间：</span></td>
                                                            <td>
                                                                <asp:Label ID="Label2" runat="server" Text='<%#Eval("SpeakDate") %>' Width="258px"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                                <table width="516" align="center" cellpadding="0" cellspacing="0" bgcolor="E5E5E5" style="height: 1px">
                                  <tr>
                                    <td align="center" class="chengse">
                                <table cellpadding="0" cellspacing="0" style="width: 498px">
                                    <tr>
                                        <td style="font-size: 9pt; width: 579px; height: 17px; text-align: right">
                                            <asp:Label ID="Label7" runat="server" Text="当前页码为："></asp:Label>
                                            [
                                            <asp:Label ID="labPage" runat="server" Text="1"></asp:Label>
                                            &nbsp;]
                                            <asp:Label ID="Label6" runat="server" Text="总页码为："></asp:Label>
                                            [
                                            <asp:Label ID="labBackPage" runat="server"></asp:Label>
                                            &nbsp;]
                                            <asp:LinkButton ID="lnkbtnFirst" runat="server" Font-Underline="False" ForeColor="Red"
                                                OnClick="lnkbtnFirst_Click">第一页</asp:LinkButton>
                                            <asp:LinkButton ID="lnkbtnFront" runat="server" Font-Underline="False" ForeColor="Red"
                                                OnClick="lnkbtnFront_Click">上一页</asp:LinkButton>
                                            <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" ForeColor="Red"
                                                OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>&nbsp;
                                            <asp:LinkButton ID="lnkbtnLast" runat="server" Font-Underline="False" ForeColor="Red"
                                                OnClick="lnkbtnLast_Click">最后一页</asp:LinkButton>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </td>
                                  </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
    </td>
  </tr>
  <tr>
    <td colspan="2" valign="top"><table width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td height="84">
            <uc1:bottomT ID="BottomT1" runat="server" />
        </td>
      </tr>
    </table></td>
  </tr>
</table>
<!-- End ImageReady Slices -->

    
    </div>
    </form>
</body>
</html>
