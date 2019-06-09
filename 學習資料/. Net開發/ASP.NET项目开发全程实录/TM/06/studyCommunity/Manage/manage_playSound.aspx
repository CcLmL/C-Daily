<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_playSound.aspx.cs" Inherits="Manage_manage_PlaySound" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;</div>
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 100px; height: 44px;">
             
              <embed src="<%=SUrl%>" style="width: 349px; height: 40px" ></embed>
                
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 505px; height: 140px">
                        <tr>
                            <td align="left" style="width: 34px" valign="top">
                            </td>
                            <td align="left" colspan="2" rowspan="1">
                             &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:Blue; font-size:20px;"><span style="color: navy">
                                 视频名称：</span><%=SoundTitle%>  </span>  <span style="font-size:15px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; 点击率：<%=ClickSum%></span>  
                            </td>
                        </tr>
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
                            <td align="right" style="width: 356px; height: 22px">
                                发布人：<%=Name %></td>
                            <td style="width: 100px; height: 22px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 34px; height: 23px">
                            </td>
                            <td align="right" style="width: 356px; height: 23px">
                                发布日期：<%=FBDate%></td>
                            <td style="width: 100px; height: 23px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 23px; text-align: center">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td valign="top">
                                            <span style="font-size: 12pt">留言内容：</span></td>
                                        <td>
                                            <asp:TextBox ID="TextBox2" runat="server" Height="88px" TextMode="MultiLine" Width="212px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="发　言" Width="74px" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
