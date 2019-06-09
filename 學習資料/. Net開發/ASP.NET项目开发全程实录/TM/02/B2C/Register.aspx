<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register"  MasterPageFile="~/MasterPage.master" Title ="Register" Theme ="SkinFile" %>
<asp:Content ID =Content1 ContentPlaceHolderID =ContentPlaceHolder1 runat =server >
				<table id="tabAddUserInfo" style=" font-size: 9pt; font-family: 宋体; width:574px; height :806px; background-repeat :no-repeat; background-image: url(images/显示页面当前位置.jpg);">	
				<tr>
					<td valign =top >
					<br />
						<table  id="tabAddMenber"  runat =server style ="font-size :9pt">
							<tr>
					             <td  align="left" height="25" colspan="2" style ="font-size :9pt">
                                     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                     &nbsp; &nbsp; &nbsp;&nbsp;
                                     会员注册</td>
				           </tr>
							<tr>
								<td align="right" style="width: 149px;font-size :9pt">用户名：
								</td>
								<td align="left">
								<asp:textbox id="txtName" runat="server"  MaxLength="50"></asp:textbox><FONT color="red">*<asp:RequiredFieldValidator
                                        ID="rfvLoginName" runat="server" ControlToValidate="txtName" Font-Size="9pt"
                                        Height="1px" Width="117px">**</asp:RequiredFieldValidator></FONT></td>
							</tr>
							<tr>
								<td align="right" style="height: 24px; width: 149px;font-size :9pt">
                                    密码：
								</td>
								<td style="height: 24px" align="left"><asp:textbox id="txtPassword" runat="server"  MaxLength="50" TextMode="Password" Width="148px"></asp:textbox><FONT color="red">*<asp:RequiredFieldValidator
                                        ID="rfvPassword" runat="server" ControlToValidate="txtPassword" Font-Size="9pt"
                                        Height="1px" Width="117px">**</asp:RequiredFieldValidator></FONT></td>
							</tr>
							
							<tr>
								<td align="right" style="width: 149px;font-size :9pt">性别：</td>
								<td align="left"><asp:dropdownlist id="ddlSex" runat="server">
                                    <asp:ListItem Selected="True" Value="1">男</asp:ListItem>
                                    <asp:ListItem Value="0">女</asp:ListItem>
                                </asp:dropdownlist></td>
							</tr>
							<tr>
								<td align="right" style="width: 149px;font-size :9pt">
                                    真实姓名：
								</td>
								<td align="left"><asp:textbox id="txtTrueName" runat="server"  MaxLength="50"></asp:textbox><FONT color="red">*<asp:RequiredFieldValidator
                                        ID="rfvTrueName" runat="server" ControlToValidate="txtTrueName" Font-Size="9pt"
                                        Height="1px" Width="117px">**</asp:RequiredFieldValidator></FONT></td>
							</tr>
							
							<tr>
								<td align="right" style="width: 149px;font-size :9pt">
                                    邮编：
								</td>
								<td align="left"><asp:textbox id="txtPostCode" runat="server"  MaxLength="50"></asp:textbox><FONT color="red">*<asp:RegularExpressionValidator
                                        ID="revPostCode" runat="server" ControlToValidate="txtPostCode" Font-Size="9pt"
                                        ValidationExpression="\d{6}" Width="134px">您的邮编输入有误</asp:RegularExpressionValidator></FONT></td>
							</tr>
							<tr>
								<td align="right" style="width: 149px;font-size :9pt">
                                    固定电话：
								</td>
								<td align =left > <asp:textbox id="txtPhone" runat="server"  MaxLength="50"></asp:textbox><FONT color="red">*<asp:RegularExpressionValidator
                                        ID="revPhone" runat="server" ControlToValidate="txtPhone"
                                        Display="Dynamic" ErrorMessage="您输入的电话号码有误" ValidationExpression="(\(\d{3,4}\)|\d{3,4}-)?\d{7,8}$"></asp:RegularExpressionValidator></FONT></td>
							</tr>
                            <tr>
                                <td align="right" style="height: 24px; width: 149px;">
                                    E-mail：</td>
                                <td style="height: 24px" align="left">
                                    <asp:textbox id="txtEmail" runat="server"  MaxLength="80"></asp:textbox><FONT color="red">*</FONT>
                                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                        Font-Size="9pt" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        Width="132px">您输入的E-mail格式不正确</asp:RegularExpressionValidator></td>
                            </tr>
                            <tr>
								<td align="right" style="width: 149px;font-size :9pt">
                                    详细住址：
								</td>
								<td  valign =middle align="left"  ><asp:textbox id="txtAddress" runat="server"  MaxLength="100" Height="115px" Width="206px" TextMode="MultiLine"></asp:textbox><span
                                        style="color: #ff0000">*<asp:RequiredFieldValidator ID="rfvAddress"
                                            runat="server" ControlToValidate="txtAddress" Font-Size="9pt" Height="1px" Width="117px">**</asp:RequiredFieldValidator></span></td>
							</tr>
							<tr>
								<td align="center" colSpan="2"><br>
									<asp:button id="btnSave" runat="server" Text="添加" OnClick="btnSave_Click"></asp:button>
                                    <asp:Button ID="btnReset" runat="server" CausesValidation="False" Text="重置" OnClick="btnReset_Click" /></td>
							</tr>
							
							</table>
							
					</td>
				</tr>
				
			</table>
			

   </asp:Content>

