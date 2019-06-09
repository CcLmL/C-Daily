<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="checkOut.aspx.cs" Inherits="checkOut" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
			<table style=" font-size: 9pt; font-family: 宋体; width:574px; height :806px; background-repeat :no-repeat; background-image: url(images/显示页面当前位置.jpg);">
			<tr>
			<td valign =top >
			<table  cellSpacing="1" cellPadding="1" width="574" align="center" border="0">
			<tr style =" font :9pt; font-family :宋体;">
					<td  align="center" colspan="2px" style="font-size :9pt; height: 25px;">
					<br />
                        商品销售服务台</td>
                <tr style="font: 9pt 宋体">
                    <td align="left" colspan="2px" style="font-size: 9pt; height: 25px">
                        </td>
                </tr>
				<tr>
				<tr style =" font :9pt; font-family :宋体;">
					<td>
					<table cellSpacing="0" cellPadding="0" width="95%" align="center" border="0" style="FONT-SIZE: 9pt">
						     <tr>
						     <td align="left" style="FONT-SIZE: 9pt; height: 14px;">
						      <asp:Label ID="labMessage" runat="server" Visible="False"></asp:Label>
                             </td>
							</tr>
							 <tr>
						     <td align="left" style="FONT-SIZE: 9pt; height: 14px;" bgcolor="#c0c0c0">
						      您的购物车：
                             </td>
							</tr>
							<tr style =" font :9pt; font-family :宋体;">
							<td align="left" style="height: 135px" valign =top >
							    <br />
							 <asp:GridView ID="gvShopCart"  runat="server"  AutoGenerateColumns="False" >
                                 <Columns>
                                     <asp:BoundField DataField="No" HeaderText="序号" ReadOnly="True">
                                         <ItemStyle HorizontalAlign="Center" />
                                         <HeaderStyle HorizontalAlign="Center" />
                                     </asp:BoundField>  
                                      <asp:BoundField DataField="BookID" HeaderText="商品ID" ReadOnly="True">
                                         <ItemStyle HorizontalAlign="Center" />
                                         <HeaderStyle HorizontalAlign="Center" />
                                     </asp:BoundField>                                    
                                     <asp:BoundField DataField="BookName" HeaderText="商品名称" ReadOnly="True">
                                      <ItemStyle HorizontalAlign="Center" />
                                      <HeaderStyle HorizontalAlign="Center" />
                                     </asp:BoundField>  
                                      <asp:BoundField DataField="Num" HeaderText="数量" ReadOnly="True">
                                      <ItemStyle HorizontalAlign="Center" />
                                      <HeaderStyle HorizontalAlign="Center" />
                                     </asp:BoundField>  
                                     <asp:BoundField DataField="price" HeaderText="单价(￥)" ReadOnly="True">
                                      <ItemStyle HorizontalAlign="Center" />
                                      <HeaderStyle HorizontalAlign="Center" />
                                     </asp:BoundField>  
                                     <asp:BoundField DataField="totalPrice" HeaderText="总价(￥)" ReadOnly="True">
                                      <ItemStyle HorizontalAlign="Center" />
                                      <HeaderStyle HorizontalAlign="Center" />
                                     </asp:BoundField>  
                                 </Columns>
                                </asp:GridView>
                                <p align =left > 
                                 总价为： <asp:Label ID="labTotalPrice" runat="server" Text="0.00" ></asp:Label>￥ 商品数为：<asp:Label ID="labTotalNum" runat="server" Text="0 "></asp:Label>个
                                </p>
                                 <li>如果需要修改，请到购物车处修改</li><li>如果已确认，请正确填写下面的信息</li><p>
                                </p>
							</td>
							</tr>
							<tr>
							<td align="left"  >
                         
                            </td>
							</tr>
						</table>
						</td></tr>
						<tr style =" font :9pt; font-family :宋体;">
					    <td>
						<table class="tableBorder" cellSpacing="0" cellPadding="0" width="95%" align="center" border="0">
                            <tr style="font: 9pt 宋体">
                                <td align="left" colspan="4" bgcolor="#c0c0c0" style =" font :9pt; font-family :宋体;">
                                收货人详细地址：
                                </td>
                            </tr>
						<tr style =" font :9pt; font-family :宋体;">
						
								<td align="right">
								
                                    配送及运费：
								</td>
								<td colSpan="3" align =left >
								<asp:DropDownList id="ddlShipType" runat="server" AutoPostBack="True" >
								<asp:ListItem>请选择配送方式及运输费用</asp:ListItem>
                                    <asp:ListItem Value="10">邮局邮寄普通包裹（10元/本）</asp:ListItem>
                                    <asp:ListItem Value="30">邮局邮寄快递包裹（30元/本）</asp:ListItem>
                                    <asp:ListItem Value="0">免费送货（长春）</asp:ListItem>
                                </asp:DropDownList></td>
							</tr>
							<tr style =" font :9pt; font-family :宋体;">
								<td align="right" width="100" style="height: 28px">
                                    收货人姓名：</td>
								
								<td style="width: 359px; height: 28px;" align =left >
								<asp:textbox id="txtReciverName" runat="server" Width="195px"></asp:textbox>
								<FONT color="red">*<asp:RequiredFieldValidator ID="rfvReciverName" runat="server" ControlToValidate="txtReciverName" Font-Size="9pt"
                                        Height="1px" Width="1px">**</asp:RequiredFieldValidator></FONT></td>	
							</tr>
							<tr style =" font :9pt; font-family :宋体;">
								<td align="right" style="height: 24px">
                                    联系电话：
								</td>
								<td style="width: 359px; height: 24px;"  align =left >
								<asp:textbox id="txtReceiverPhone" runat="server" Width="195px"></asp:textbox>
								<font color="red">*<asp:RequiredFieldValidator ID="rfvReceiverPhone" runat="server" ControlToValidate="txtReceiverPhone" Font-Size="9pt"
                                        Height="1px" Width="1px">**</asp:RequiredFieldValidator></font></td>
							</tr>
							<tr style =" font :9pt; font-family :宋体;">
								<td align="right" height="17">
                                    电子信箱：
								</td>
								<td height="17" style="width: 359px" align =left >
								<asp:textbox id="txtReceiverEmails" runat="server" Width="195px"></asp:textbox>
								<font color="red">*<asp:RequiredFieldValidator ID="rfvReceiverEmails" runat="server" ControlToValidate="txtReceiverEmails" Font-Size="9pt"
                                        Height="1px" Width="1px">**</asp:RequiredFieldValidator></font>
								</td>
							</tr>
							<tr style =" font :9pt; font-family :宋体;">
								<td align="right">
                                    邮编：
								</td>
								<td style="width: 359px" align =left ><asp:textbox id="txtReceiverPostCode" runat="server" Width="195px"></asp:textbox>
								<font color="red">*<asp:RequiredFieldValidator ID="rfvReceiverPostCode" runat="server" ControlToValidate="txtReceiverPostCode" Font-Size="9pt"
                                        Height="1px" Width="1px">**</asp:RequiredFieldValidator></font></td>
							</tr>
							<tr style =" font :9pt; font-family :宋体;">
								<td align="right" style="height: 73px">
                                    收货人详细地址：
								</td>
								<td style="width: 359px; height: 73px;" align =left >
									<asp:textbox id="txtReceiverAddress" runat="server" Width="259px" Height="53px" TextMode="MultiLine"></asp:textbox>
									<span style="color: #ff0000">*<asp:RequiredFieldValidator ID="rfvAddress"
                                       
                                            runat="server" ControlToValidate="txtReceiverAddress" Font-Size="9pt" Height="1px" Width="1px">**</asp:RequiredFieldValidator></span></td>
							</tr>
							
							
							<tr style =" font :9pt; font-family :宋体;">
								<td align="right" height="19">
                                    备注：
								</td>
								<td colSpan="3" height="19" align =left >
                                    <asp:TextBox ID="txtRemark" runat="server" Height="89px" MaxLength="200" Width="259px"></asp:TextBox>
                                    <br /><FONT  color=#ff3333>您有什么要求，请在备注中注明。</FONT>
     
								</td>
							</tr>
							
							<tr style =" font :9pt; font-family :宋体;">
								<td align="center" colSpan="4"><br>
									<asp:button id="btnConfirm" runat="server" Text="提交订单" OnClick="btnConfirm_Click"  ></asp:button>
                                    </td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			</td>
			</tr>
			</table>
</asp:Content>

