<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SystemDefault.aspx.cs" Inherits="_Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>企业办公自动化管理系统</title>
    <link href="CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
   
    <table width="1003" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="230" height="620" rowspan="2" align="left" valign="top" background="images/back_01.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="76"></td>
      </tr>
      <tr>
        <td align="center" valign="middle" class="wenzi">
                            <asp:Label ID="lblUser" runat="server" Text="Label"></asp:Label>
            &nbsp;
                            <asp:ImageButton ID="imgBtnLogonOut" runat="server" AlternateText="注　销" Height="18px"
                                OnClick="imgBtnLogonOut_Click" Width="43px" ImageUrl="images/back_04.jpg" /></td>
      </tr>
      <tr>
        <td height="7"></td>
      </tr>
      <tr>
        <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="wenzi1">
          <tr>
            <td width="27%" valign="top">&nbsp;</td>
            <td width="73%" align="left" valign="top">
                <asp:TreeView ID="TreeView1" runat="server" CssClass="css" Font-Size="Small"
                    ForeColor="#072EAB" Height="427px" ImageSet="BulletedList3" LineImagesFolder="~/icon" ShowExpandCollapse="False"
                    Width="150px" BorderWidth="0px">
                    <ParentNodeStyle Font-Bold="False" />
                    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                    <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px"
                        VerticalPadding="0px" />
                    <Nodes>
                        <asp:TreeNode Text="公告管理" Value="公告管理">
                            <asp:TreeNode NavigateUrl="~/BaseInfo/BaseNoticeList.aspx" Target="MainFrame" Text="查看公告"
                                Value="查看公告"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/BaseInfo/BaseNoticeIssuance.aspx" Target="MainFrame" Text="发布公告"
                                Value="发布公告"></asp:TreeNode>
                        </asp:TreeNode><asp:TreeNode Text="文件管理" Value="文件管理">
                            <asp:TreeNode NavigateUrl="~/fileManage/FileSend.aspx" Target="MainFrame" Text="传送文件"
                                Value="传送文件"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/fileManage/FileIncept.aspx" Target="MainFrame" Text="接收文件"
                                Value="接收文件"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/fileManage/FileDelete.aspx" Target="MainFrame" Text="删除文件"
                                Value="删除文件"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="交流管理" Value="交流管理">
                            <asp:TreeNode NavigateUrl="~/MobileInfo/InfoSend.aspx" Target="MainFrame" Text="发送短信息"
                                Value="发送短信息"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/communion/VoteItemSetting.aspx" Target="MainFrame" Text="设置投票活动"
                                Value="设置投票活动"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/communion/Voting.aspx" Target="MainFrame" Text="活动投票"
                                Value="活动投票"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/communion/VotingResult.aspx" Target="MainFrame" Text="查看投票结果"
                                Value="查看投票结果"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="考勤管理" Value="考勤管理">
                            <asp:TreeNode NavigateUrl="~/Communion/CheckAttendance/SetingTime.aspx" Target="MainFrame"
                                Text="考勤时间设置" Value="考勤时间设置"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/Communion/CheckAttendance/SignIn.aspx?id=1" Target="MainFrame"
                                Text="上班签到" Value="上班签到"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/Communion/CheckAttendance/SignIn.aspx?id=0" Target="MainFrame"
                                Text="下班签退" Value="下班签退"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="系统管理" Value="系统管理">
                            <asp:TreeNode NavigateUrl="~/System/SystemUserPwdUpdate.aspx" Target="MainFrame" Text="个人密码设置"
                                Value="个人密码设置"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/System/SystemUser.aspx" Target="MainFrame" Text="操作员设置"
                                Value="操作员设置"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Checked="True" Text="部门管理" Value="部门管理">
                            <asp:TreeNode NavigateUrl="~/BaseInfo/BaseDepartmentAdd.aspx" Target="MainFrame" Text="新建部门"
                                Value="新建部门"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/BaseInfo/BaseDepartmentManager.aspx" Target="MainFrame" Text="编辑部门信息"
                                Value="编辑部门信息"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="员工管理" Value="员工管理">
                            <asp:TreeNode NavigateUrl="~/BaseInfo/BaseEmployeeAdd.aspx" Target="MainFrame" Text="添加员工信息"
                                Value="添加员工信息"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/BaseInfo/BaseEmployeeManager.aspx" Target="MainFrame" Text="编辑员工信息"
                                Value="编辑员工信息"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="规章制度管理" Value="规章制度管理">
                            <asp:TreeNode NavigateUrl="~/Rule/RuleUpdate.aspx" Target="MainFrame" Text="更新规章制度"
                                Value="更新规章制度"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/Rule/RulePreview.aspx" Target="MainFrame" Text="预览规章制度" Value="预览规章制度">
                            </asp:TreeNode>
                        </asp:TreeNode>
                    </Nodes>
                    <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="5px"
                        NodeSpacing="0px" VerticalPadding="0px" />
                </asp:TreeView><asp:TreeView ID="TreeView2" runat="server" CssClass="css" Font-Size="Small"
                    ForeColor="#072EAB" Height="253px" ImageSet="BulletedList3" LineImagesFolder="~/icon" ShowExpandCollapse="False"
                    Width="150px">
                    <ParentNodeStyle Font-Bold="False" />
                    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                    <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px"
                        VerticalPadding="0px" />
                    <Nodes>
                        <asp:TreeNode Text="桌面" Value="桌面">
                            <asp:TreeNode NavigateUrl="~/BaseInfo/BaseNoticeList.aspx" Target="MainFrame" Text="查看公告"
                                Value="查看公告"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/Rule/RulePreview.aspx" Target="MainFrame" Text="规章制度"
                                Value="规章制度"></asp:TreeNode>
                            <asp:TreeNode Text="修改登录密码" Value="修改登录密码" NavigateUrl="~/System/SystemUserPwdUpdate.aspx" Target="MainFrame"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="文件管理" Value="文件管理">
                            <asp:TreeNode NavigateUrl="~/fileManage/FileSend.aspx" Target="MainFrame" Text="传送文件"
                                Value="传送文件"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/fileManage/FileIncept.aspx" Target="MainFrame" Text="接收文件"
                                Value="接收文件"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/fileManage/FileDelete.aspx" Target="MainFrame" Text="删除文件"
                                Value="删除文件"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="交流管理" Value="交流管理">
                            <asp:TreeNode NavigateUrl="~/MobileInfo/InfoSend.aspx" Target="MainFrame" Text="发送短信息"
                                Value="发送短信息"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/communion/Voting.aspx" Target="MainFrame" Text="活动投票"
                                Value="活动投票"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="考勤管理" Value="考勤管理">
                            <asp:TreeNode NavigateUrl="~/Communion/CheckAttendance/SignIn.aspx?id=1" Target="MainFrame"
                                Text="上班签到" Value="上班签到"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/Communion/CheckAttendance/SignIn.aspx?id=0" Target="MainFrame"
                                Text="下班签退" Value="下班签退"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="行政管理" Value="行政管理">
                            <asp:TreeNode Text="部门及职责" Value="部门及职责" NavigateUrl="~/BaseInfo/BaseDepartmentListResponsibility.aspx" Target="MainFrame"></asp:TreeNode>
                            <asp:TreeNode Text="员工联系方式" Value="员工联系方式" NavigateUrl="~/BaseInfo/BaseEmployeeRponsibility.aspx" Target="MainFrame"></asp:TreeNode>
                        </asp:TreeNode>
                    </Nodes>
                    <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="5px"
                        NodeSpacing="0px" VerticalPadding="0px" />
                </asp:TreeView>
                        </td>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td valign="top" style="height: 75px"><img src="images/back_02.jpg" width="773" height="107" border="0" usemap="#Map" /></td>
  </tr>
  <tr>
    <td width="773" height="513" align="left" valign="top" background="images/back_03.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="center" valign="top" style="height: 470px"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center" valign="top">
            <iframe id="MainFrame" name="MainFrame" style="width: 720px; height: 455px;" frameborder="0" width="700"></iframe>
            </td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>

<map name="Map" id="Map"><area shape="rect" coords="432,39,488,57" href="#1" />
<area shape="rect" coords="506,39,560,56" href="#2" />
<area shape="rect" coords="581,38,634,57" href="#3" />
<area shape="rect" coords="655,39,688,56" href="#4" />
<area shape="rect" coords="702,40,736,56" href="#5" />
</map>
    
    
    </form>
</body>
</html>
