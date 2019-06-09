<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="UserControl/GoodEmployee.ascx" TagName="GoodEmployee" TagPrefix="uc1" %>
<%@ Register Src="UserControl/Notice.ascx" TagName="Notice" TagPrefix="uc2" %>
<%@ Register Src="UserControl/Logon.ascx" TagName="Logon" TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>企业办公自动化管理系统</title>
    <link href="CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
        
<body>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing="0" style="width: 1003x; height: 342px">
            <tr>
                <td colspan="2" style="height: 91px; background-attachment: fixed; background-image: url(images/index_01.jpg); vertical-align: super; background-repeat: no-repeat;" align="right">
                    <a href="#" onclick="this.style.behavior='url(#default#homepage)'; this.setHomePage('http://www.cxyhome.com');">设为主页</a>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                    &nbsp;</td>
                <td style="height: 91px">
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; width: 224px; height: 173px">
                    <table cellpadding="0" cellspacing="0" style="width: 189px">
                        <tr>
                            <td style="height: 44px; vertical-align: top;">
                               <table id="TABLE1" style="width: 224px" bgcolor="#f0f0f1" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <img height="30" src="images/index_04.jpg" width="224" /></td>
                                    </tr>
                                    <tr>
                                        <td><asp:Calendar ID="Calendar1" runat="server" BackColor="#F0F0F1" BorderColor="White" BorderWidth="1px" Font-Italic="False" Font-Names="Verdana" Font-Overline="False" Font-Size="9pt" ForeColor="Black" Height="143px" Width="224px" >
                                            <SelectedDayStyle BackColor="#333399" Font-Italic="False" ForeColor="White" />
                                            <TodayDayStyle BackColor="#FF8080" />
                                            <DayStyle Font-Size="7pt" />
                                            <OtherMonthDayStyle Font-Bold="False" ForeColor="#999999" />
                                            <NextPrevStyle Font-Bold="False" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="2px" Font-Bold="False"
                                                Font-Size="9pt" ForeColor="#333399" />
                                        </asp:Calendar>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 53px">
                                <uc3:Logon ID="Logon1" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 15px">
                                <img height="30" src="images/index_16.jpg" width="224" /></td>
                        </tr>
                        <tr>
                            <td style="height: 60px">
                                <uc1:GoodEmployee ID="GoodEmployee1" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="vertical-align: top; width: 723px; height: 173px">
                    <img height="112" src="images/index_06.jpg" width="779" /><br />
                    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0><TBODY><TR><TD width="2%" style="height: 30px"> &nbsp;&nbsp;</TD><TD class="shouye" vAlign=middle 
align=left width="98%" style="height: 30px">首页 &gt; 
系统公告</TD></TR><TR><TD vAlign=top align=left 
colSpan=2 style="height: 17px"><IMG height=3 
src="images/index_10.jpg" width=758 
/></TD></TR>
                        <tr>
                            <td align="left" colspan="2" style="height: 38px" valign="top">
                                <uc2:Notice ID="Notice1" runat="server" />
                            </td>
                        </tr>
                    </TBODY></TABLE>
                </td>
                <td style="height: 173px">
                </td>
            </tr>
            <tr>
                <td style="height: 31px;" colspan="3">
                    <table bgcolor="#526a96" border="0" cellpadding="0" cellspacing="0" class="copyrights" style="width: 1003px">
                        <tr>
                            <td height="28" valign="top" width="2%">
                                &nbsp;</td>
                            <td align="left" valign="middle" style="width: 79%">
                                © All CopyRights reserved 2007 吉林省**科技有限公司</td>
                            <td align="left" valign="middle" width="17%">
                                帮助 | 关于我们 | 联络我们</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
