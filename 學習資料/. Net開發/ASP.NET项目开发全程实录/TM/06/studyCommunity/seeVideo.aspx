<%@ Page Language="C#" AutoEventWireup="true" CodeFile="seeVideo.aspx.cs" Inherits="seeVideo" %>

<%@ Register Src="bottomT.ascx" TagName="bottomT" TagPrefix="uc2" %>
<%@ Register Src="userBulletinInfo.ascx" TagName="userBulletinInfo" TagPrefix="uc3" %>
<%@ Register Src="userSound.ascx" TagName="userSound" TagPrefix="uc4" %>
<%@ Register Src="userVideo.ascx" TagName="userVideo" TagPrefix="uc5" %>

<%@ Register Src="dh.ascx" TagName="dh" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
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
<!-- ImageReady Slices (互动社区.psd) -->
<table id="__01" width="1002" height="83" border="0" cellpadding="0" cellspacing="0" style="font-weight: bold">
	<tr>
		<td width="814" height="83">
            <uc1:dh ID="Dh1" runat="server" />
        </td>
	</tr>
</table>
<table width="802" align="center" cellpadding="0" cellspacing="0" style="font-weight: bold">
  <tr>
    <td height="33" valign="top" background="images/index_03.jpg"></td>
  </tr>
</table>
<table width="190" align="center" cellpadding="0" cellspacing="0" style="font-weight: bold">
  <tr>
    <td><img src="images/index_05.jpg" width="802" height="126"></td>
  </tr>
</table>
<table width="190" align="center" cellpadding="0" cellspacing="0" style="font-weight: bold">
  <tr>
    <td><img src="images/index_06.jpg" width="802" height="3"></td>
  </tr>
</table>
<table width="802" height="600" align="center" cellpadding="0" cellspacing="0" style="font-weight: bold">
  <tr>
    <td width="240" valign="top">
      <table width="100%" height="4" cellpadding="0" cellspacing="0">
        <tr>
          <td>
              <uc3:userBulletinInfo ID="UserBulletinInfo1" runat="server" />
          </td>
        </tr>
      </table>
      <table width="239" height="29" cellpadding="0" cellspacing="0">
        <tr>
          <td>
          </td>
        </tr>
        <tr>
          <td valign="top">
            <table width="100%" height="4" cellpadding="0" cellspacing="0">
              <tr>
                <td>
                    <uc4:userSound ID="UserSound1" runat="server" />
                </td>
              </tr>
            </table>
              <uc5:userVideo ID="UserVideo1" runat="server" />
          </td>
        </tr>
      </table>
      </td>
    <td width="560" valign="top">
        <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 619px;
            height: 494px">
            <tr style="font-weight: bold; font-size: 14pt">
                <td align="center" colspan="4" style="height: 6%">
                <img src="images/pangbian.gif" height="29" style="width: 610px">
                </td>
            </tr>
            <tr style="font-weight: bold; font-size: 14pt">
                <td align="center" colspan="4" style="height: 6%">
              &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:Blue; font-size:20px;"><%=VideoTitle%>  </span>  <span style="font-size:15px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; 点击率：<%=ClickSum%></span>   
                </td>
            </tr>
            <tr style="font-weight: bold; font-size: 14pt">
                <td align="center" colspan="4" style="height: 7%">
                 <embed src="<%=VUrl%>" noerror="true" style="width: 579px; height: 321px"></embed>
                    <br />
                    <table border="0" cellpadding="0" cellspacing="0" style="height: 291px; width: 563px;">
                        <tr>
                            <td align="left" style="width: 33px" valign="top">
                            </td>
                            <td style="width: 34px" align="left" valign="top">
                                <asp:Label ID="Label1" runat="server" Text="内容简介：" Width="112px" Font-Bold="False"></asp:Label></td>
                            <td align="left" colspan="2" rowspan="3">
                            <%=Content %>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="width: 33px; height: 22px" valign="top">
                            </td>
                            <td align="left" style="width: 34px; height: 22px;" valign="top">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 33px">
                            </td>
                            <td style="width: 34px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 33px; height: 22px">
                            </td>
                            <td style="width: 34px; height: 22px;">
                            </td>
                            <td style="width: 356px; height: 22px;" align="right">
                                发布人：<%=Name %></td>
                            <td style="width: 100px; height: 22px;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 33px; height: 23px">
                            </td>
                            <td style="width: 34px; height: 23px">
                            </td>
                            <td align="right" style="width: 356px; height: 23px">
                                发布日期：<%=FBDate%></td>
                            <td style="width: 100px; height: 23px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="1" style="width: 33px; height: 23px; text-align: center">
                            </td>
                            <td colspan="3" style="height: 23px; text-align: center;">
                                <asp:Button ID="btnDown" runat="server" Text="下载" Width="70px" OnClick="btnDown_Click" /></td>
                        </tr>
                        <tr>
                            <td colspan="1" style="width: 33px; height: 23px; text-align: center">
                            </td>
                            <td colspan="3" style="height: 23px; text-align: center">
                                <table border="0" cellpadding="0" cellspacing="0" >
                                    <tr>
                                        <td style="height: 44px" >
                                            <asp:TextBox ID="txtYzm" runat="server" Width="69px"></asp:TextBox></td>
                                        <td style="height: 44px" >
                                            <asp:Image ID="Image1" runat="server" Height="24px" Width="51px" />
                                            <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="12pt" OnClick="LinkButton1_Click" Width="71px">看不清</asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td valign="top" >
                                            <span style="font-size: 12pt">留言内容：</span></td>
                                        <td >
                                            <asp:TextBox ID="txtContent" runat="server" Height="88px" TextMode="MultiLine" Width="212px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td  colspan="2">
                                            <asp:Button ID="btnSpeak" runat="server" OnClick="btnSpeak_Click" Text="发　言" Width="74px" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                                <asp:DataList ID="dlSpeak" runat="server" >
                                    <ItemTemplate>
                                        <table border="1" cellpadding="0" cellspacing="0" backcolor="Brown">
                                            <tr　bgcolor="#B0A299" class="hongcu">
                                                <td >
                                                    <span style="font-size: 12pt">发言人：</span></td>
                                                <td >
                                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("Spokesman") %>'></asp:Label></td>
                                            </tr>
                                            <tr　bgcolor="#FBF5EC" class="chengse">
                                                <td valign="top" >
                                                    <span style="font-size: 12pt">发言内容：</span></td>
                                                <td >
                                                    <asp:TextBox ID="TextBox3" runat="server" Font-Size="12pt" Height="95px" ReadOnly="True"
                                                        TextMode="MultiLine" Width="351px" Text='<%#Eval("SpeakContent") %>'></asp:TextBox></td>
                                            </tr>
                                            <tr　bgcolor="#FBF5EC" class="chengse">
                                                <td >
                                                </td>
                                                <td  >
                                                    
                                                    <table border="0" cellpadding="0" cellspacing="0" >
                                                        <tr>
                                                            <td >
                                                                <span style="font-size: 12pt">
                                                                发言时间：</span></td>
                                                            <td >
                                                           
                                                               <asp:Label ID="Label2" runat="server" Text='<%#Eval("SpeakDate") %>' Width="258px"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                    <table id="TABLE1" cellpadding="0" cellspacing="0" style="width: 489px">
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
  <tr>
    <td colspan="2" valign="top"><table width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td height="84">
            &nbsp;<uc2:bottomT ID="BottomT1" runat="server" />
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
