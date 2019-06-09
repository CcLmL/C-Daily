<%@ Page Language="C#" AutoEventWireup="true" CodeFile="typeInfo.aspx.cs" Inherits="typeInfo" %>

<%@ Register Src="userBulletinInfo.ascx" TagName="userBulletinInfo" TagPrefix="uc3" %>

<%@ Register Src="search.ascx" TagName="search" TagPrefix="uc2" %>

<%@ Register Src="dh.ascx" TagName="dh" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
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
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        <uc1:dh ID="Dh1" runat="server" />
        <br />
        <img height="126" src="images/index_05.jpg" width="802" />&nbsp;</div>
        <table align="center" cellpadding="0" cellspacing="0" height="600" style="width: 774px">
            <tr>
                <td valign="top" width="240">
                    <table cellpadding="0" cellspacing="0" height="4" width="100%">
                        <tr>
                            
                            <td>
                                <uc3:userBulletinInfo ID="UserBulletinInfo1" runat="server" />
                            </td>
                        </tr>
                    </table>
                    <table cellpadding="0" cellspacing="0" height="29" width="239">
                        <tr>
                            <td>
                                <img height="29" src="images/spph.gif" width="239" /></td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <table cellpadding="0" cellspacing="0" height="4" width="100%">
                                    <tr>
                                        <td>
                                            <asp:GridView ID="gvVideoP"　 runat="server" AutoGenerateColumns="False" BorderWidth="0px"
                                                ShowHeader="False" Width="236px" CssClass="chengse">
                                                <Columns>
                                                    <asp:HyperLinkField　 DataNavigateUrlFields="VideoID" DataNavigateUrlFormatString="seeVideo.aspx?VideoID={0}"
                                                        DataTextField="VideoName">
                                                    </asp:HyperLinkField>
                                                    <asp:BoundField DataField="TypeName" />
                                                    <asp:BoundField DataField="ClickSum" />
                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table cellpadding="0" cellspacing="0" height="29" width="239">
                        <tr>
                            <td>
                                <img height="29" src="images/spph.gif" width="239" /></td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:GridView ID="gvSoundP" runat="server" AutoGenerateColumns="False" BorderWidth="0px"
                                    ShowHeader="False" Width="237px" CssClass="chengse">
                                    <Columns>
                                        <asp:HyperLinkField DataNavigateUrlFields="SoundId" DataNavigateUrlFormatString="playSound.aspx?SoundID={0}"
                                            DataTextField="SoundName" />
                                        <asp:BoundField DataField="TypeName" />
                                        <asp:BoundField DataField="ClickSum" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
                <td valign="top" width="560">
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="right">
                                <table align="right" cellpadding="0" cellspacing="0" height="29" width="239">
                                    <tr>
                                        <td style="width: 559px">
                                            <img height="29" src="images/sousuolangif.gif" width="557" /></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 559px; height: 77px; text-align: left">
                                            <uc2:search ID="Search1" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table  width="239" height="29" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td style="height: 29px"><img src="images/ypkt.gif" width="557" height="29"></td>
              </tr>
              <tr>
                <td><table width="100%" cellpadding="1" cellspacing="1" bgcolor="D4D4D4">
                    <tr>
                      <td height="605" valign="top" bgcolor="#FFFFFF"><table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                              <td valign="middle"><table width="100%" height="20">
                                <tr>
                                  <td></td>
                                </tr>
                              </table>
                                <table width="516" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td class="shenlancu">
                                                <asp:LinkButton ID="lnkbtnNET" runat="server" OnClick="lbtNET_Click">.NET教程</asp:LinkButton><a href="#" class="shenlancu"></a></td>
                                </tr>
                                <tr>
                                  <td class="chengse"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 本书全面介绍了ASP程序开发的各方面技术和技巧，共分17章，内容包括表单/窗口与导航条设计、代码封装技术、数据库技术、SQL查询相关技术、在线统计、视图/存储过程和触发器的应用、报表与打印、学习参考。</td>
                                </tr>
                              </table>
                                <table width="516" align="center" cellpadding="0" cellspacing="0" background="images/dline.gif">
                                  <tr>
                                    <td height="1" class="shenlancu"></td>
                                  </tr>
                                </table>
                                <table width="516" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td class="shenlancu"><asp:LinkButton ID="lnkbtnASP" runat="server" OnClick="lbtASP_Click">ASP教程</asp:LinkButton></td>
                                  </tr>
                                  <tr>
                                    <td class="chengse">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 本书全面介绍了ASP程序开发的各方面技术和技巧，共分17章，内容包括表单/窗口与导航条设计、代码封装技术、数据库技术、SQL查询相关技术、在线统计、视图/存储过程和触发器的应用、报表与打印、学习参考。</td>
                                  </tr>
                                </table>
                                <table width="516" align="center" cellpadding="0" cellspacing="0" background="images/dline.gif">
                                  <tr>
                                    <td height="1" class="shenlancu"></td>
                                  </tr>
                                </table>
                                <table width="516" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td class="shenlancu"><asp:LinkButton ID="lnkbtnJSP" runat="server" OnClick="lbtJSP_Click">JSP教程</asp:LinkButton></td>
                                  </tr>
                                  <tr>
                                    <td class="chengse">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 本书全面介绍了ASP程序开发的各方面技术和技巧，共分17章，内容包括表单/窗口与导航条设计、代码封装技术、数据库技术、SQL查询相关技术、在线统计、视图/存储过程和触发器的应用、报表与打印、学习参考。</td>
                                  </tr>
                                </table>
                                <table width="516" align="center" cellpadding="0" cellspacing="0" background="images/dline.gif">
                                  <tr>
                                    <td height="1" class="shenlancu"></td>
                                  </tr>
                                </table>
                                <table width="516" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td class="shenlancu"><asp:LinkButton ID="lnkbtnVB" runat="server" OnClick="lbtVB_Click">VB教程</asp:LinkButton></td>
                                  </tr>
                                  <tr>
                                    <td class="chengse">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 本书全面介绍了ASP程序开发的各方面技术和技巧，共分17章，内容包括表单/窗口与导航条设计、代码封装技术、数据库技术、SQL查询相关技术、在线统计、视图/存储过程和触发器的应用、报表与打印、学习参考。</td>
                                  </tr>
                                </table>
                                <table width="516" align="center" cellpadding="0" cellspacing="0" background="images/dline.gif">
                                  <tr>
                                    <td height="1" class="shenlancu"></td>
                                  </tr>
                                </table>
                                <table width="516" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td class="shenlancu"><asp:LinkButton ID="lnkbtnVC" runat="server" OnClick="lbtVC_Click">VC教程</asp:LinkButton></td>
                                  </tr>
                                  <tr>
                                    <td class="chengse">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 本书全面介绍了ASP程序开发的各方面技术和技巧，共分17章，内容包括表单/窗口与导航条设计、代码封装技术、数据库技术、SQL查询相关技术、在线统计、视图/存储过程和触发器的应用、报表与打印、学习参考。</td>
                                  </tr>
                                </table>
                                <table width="516" align="center" cellpadding="0" cellspacing="0" background="images/dline.gif">
                                  <tr>
                                    <td height="1" class="shenlancu"></td>
                                  </tr>
                                </table>
                                <table width="516" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td class="shenlancu"><asp:LinkButton ID="lnkbtnDELPHI" runat="server" OnClick="lbtDELPHI_Click">DELPHI教程</asp:LinkButton></td>
                                  </tr>
                                  <tr>
                                    <td class="chengse">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 本书全面介绍了ASP程序开发的各方面技术和技巧，共分17章，内容包括表单/窗口与导航条设计、代码封装技术、数据库技术、SQL查询相关技术、在线统计、视图/存储过程和触发器的应用、报表与打印、学习参考。</td>
                                  </tr>
                                </table></td>
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
                <td colspan="2" valign="top">
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td height="84">
                                <img height="76" src="images/index_08.jpg" width="802" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
