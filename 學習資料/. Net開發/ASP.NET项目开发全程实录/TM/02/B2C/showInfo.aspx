<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="showInfo.aspx.cs" Inherits="showInfo" Title="详细信息页" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style=" font-size: 9pt; font-family: 宋体; width:574px; height :806px; background-repeat :no-repeat; background-image: url(images/显示页面当前位置.jpg);">

<tr>
<td valign =top >
<br />
<table  cellSpacing="1" cellPadding="1" width="480" align="center" border="0" id="tabAddProduct">
				<tr>
					<td  align="left" height="25" colspan="2" style ="font-family :宋体; font-size :9pt;">
						&nbsp;&nbsp;
						<asp:label id="labTitleInfo" Runat="server">商品详细信息</asp:label>
					</td>
				</tr>
				<tr>
					<td style="width: 478px">
						<table  cellSpacing="0" cellPadding="0" width="95%" align="center" border="0">
							<tr>
								<td align="left" style ="font-family :宋体; font-size :9pt;">
                                    所属类别：
								</td>
								<td style="width: 359px" align="left">
                                    <asp:TextBox ID="txtCategory" runat="server"></asp:TextBox>
								</td>
							</tr>
							<tr>
								<td align="left" width="80" style ="font-family :宋体; font-size :9pt;">
                                    商品名称：</td>
								
								<td style="width: 359px" align="left"><asp:textbox id="txtName" runat="server"></asp:textbox></td>	
							</tr>
							<tr>
								<td align="left" style="font-family :宋体; font-size :9pt;height: 24px">
                                    备注：
								</td>
								<td style="width: 359px; height: 24px;" align="left"><asp:textbox id="txtAuthor" runat="server"></asp:textbox></td>
							</tr>
							
							<tr>
								<td align="left" style ="font-family :宋体; font-size :9pt;">商城：
								</td>
								<td style="width: 359px" align="left"><asp:textbox id="txtCompany" runat="server"></asp:textbox></td>
							</tr>
							<tr>
								<td align="left" height="19" style ="font-family :宋体; font-size :9pt;">市场价格：
								</td>
								<td colSpan="3" height="19" align="left"><asp:textbox id="txtMarketPrice" runat="server">0</asp:textbox>
                                        </td>
							</tr>
							<tr>
								<td align="left" style ="font-family :宋体; font-size :9pt;">热门价：
								</td>
								<td colSpan="3" align="left"><asp:textbox id="txtHotPrice" runat="server">0</asp:textbox></td>
							</tr>
							<tr>
								<td align="left" style="font-family :宋体; font-size :9pt;height: 22px">
                                    图像：
								</td>
								<td colSpan="3" style="height: 22px" align="left">
                                    <asp:ImageMap ID="ImageMapPhoto" runat="server" ImageUrl="" >
                                    </asp:ImageMap></td>
							</tr>
							<tr>
								<td align="left" style="font-family :宋体; font-size :9pt;height: 20px ">是否为推荐：
								</td>
								<td colSpan="3" style="height: 20px" align="left"><asp:checkbox id="cbxCommend" runat="server" Checked="True" AutoPostBack="True"></asp:checkbox></td>
							</tr>
							
							<tr>
								<td align="left" style ="font-family :宋体; font-size :9pt;">
                                    是否为热门：
								</td>
								<td colSpan="3" align="left"><asp:checkbox id="cbxHot" runat="server" Checked="True" AutoPostBack="True"></asp:checkbox></td>
							</tr>
							<tr>
								<td align="left">是否为最新：
								</td>
								<td colSpan="3" align="left"><asp:checkbox id="cbxDiscount" runat="server" Checked="True" AutoPostBack="True"></asp:checkbox></td>
							</tr>
							<tr>
								<td align="left">
                                    简单描述：
								</td>
								<td style="width: 359px" align="left"><asp:textbox id="txtShortDesc" runat="server" Width="307px" Height="89px" TextMode="MultiLine"></asp:textbox></td>
							</tr>
							<tr>
								<td align="center" colSpan="4"><br>
									<asp:button id="btnBack" runat="server" Text="返回" OnClick="btnBack_Click" ></asp:button></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
</td>
</tr>
</table>
			
</asp:Content>

