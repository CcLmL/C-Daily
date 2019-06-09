<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UpdateMember.aspx.cs" Inherits="UpdateMember" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style=" font-size: 9pt; font-family: 宋体; width:574px; height :806px; background-repeat :no-repeat; background-image: url(images/显示页面当前位置.jpg);">
 <tr>
 <td valign =top >
 <br />
 <table  id="tabAddUserInfo" cellSpacing="1" cellPadding="1" width="560" align="center"
				border="0" runat =server style ="font-size :9pt">
				<tr>
					<td style="width: 540px">
						<table id="tabAddMenber" cellSpacing="0" cellPadding="0" width="95%" align="center"
							border="0" runat =server style ="font-size :9pt">
							<tr>
					             <td align="left" height="25" colspan="2" style ="font-size :9pt">
                                     &nbsp; &nbsp;&nbsp;
                                     更新会员信息</td>
				           </tr>
							<tr>
								<td align="right" width="250" style ="font-size :9pt">用户名：
								</td>
								<td align="left"><asp:textbox id="txtName" runat="server"  MaxLength="50"></asp:textbox><FONT color="red">*</FONT></td>
							</tr>
							<tr>
								<td align="right" width="250" style="height: 24px;font-size :9pt">密 码：
								</td>
								<td style="height: 24px" align="left"><asp:textbox id="txtPassword" runat="server"  MaxLength="50" ></asp:textbox><FONT color="red">*</FONT></td>
							</tr>
						
							<tr>
								<td align="right" width="250" style ="font-size :9pt">性别：</td>
								<td align="left"><asp:dropdownlist id="ddlSex" runat="server">
								    <asp:ListItem Value="0">女</asp:ListItem>
                                    <asp:ListItem Selected="True" Value="1">男</asp:ListItem> 
                                </asp:dropdownlist></td>
							</tr>
							<tr>
								<td align="right" width="250" style ="font-size :9pt">
                                    真实姓名：
								</td>
								<td align="left"><asp:textbox id="txtTrueName" runat="server"  MaxLength="50"></asp:textbox><FONT color="red">*</FONT></td>
							</tr>
							
							<tr>
								<td align="right" width="250" style ="font-size :9pt">
                                    邮编：
								</td>
								<td align="left"><asp:textbox id="txtPostCode" runat="server"  MaxLength="50" AutoPostBack="True"></asp:textbox><FONT color="red">*</FONT></td>
							</tr>
							<tr>
								<td align="right" width="250" style ="font-size :9pt">
                                    固定电话号码：
								</td>
								<td align="left"><asp:textbox id="txtPhone" runat="server"  MaxLength="50" AutoPostBack="True"></asp:textbox><FONT color="red">*</FONT></td>
							</tr>
                            <tr>
                                <td align="right" style="height: 24px; font-size :9pt" width="250">
                                    e-mail：</td>
                                <td style="height: 24px" align="left">
                                    <asp:textbox id="txtEmail" runat="server"  MaxLength="80" AutoPostBack="True"></asp:textbox><FONT color="red">*</FONT>
                                    </td>
                            </tr>
                            <tr>
								<td align="right" width="250" style ="font-size :9pt">
                                    详细住址：
								</td>
								<td  valign =middle align="left"  ><asp:textbox id="txtAddress" runat="server"  MaxLength="100" Height="115px" Width="206px" TextMode="MultiLine"></asp:textbox><span
                                        style="color: #ff0000">*</span></td>
							</tr>
							<tr>
								<td align="center" colSpan="2"><br>
									<asp:button id="btnUpdate" runat="server" Text="更新" OnClick="btnUpdate_Click" ></asp:button>
									<asp:Button ID="btnReset" runat="server" Text="重置" OnClick="btnReset_Click" /></td>
                                       
							</tr>
							</table>
							
					</td>
				</tr>
			
			</table>
 </td>
 </tr>
 </table>
 
</asp:Content>





