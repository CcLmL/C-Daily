<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductAdd.aspx.cs" Inherits="Manger_ProductAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>添加商品</title>
</head>
<body  style="font-family :宋体; font-size: 9pt;">
<form id="Form1" method="post" runat="server">
			<table  cellSpacing="1" cellPadding="1" width="480" align="center" border="0" id="tabAddProduct">
				<tr>
					<td  align="left" height="25" colspan="2" style="font-family :宋体; font-size: 9pt;">
						&nbsp;&nbsp;
						<asp:label id="labTitleInfo" Runat="server">商品添加</asp:label>
					</td>
				<tr>
				<tr>
					<td style="width: 478px">
						<table  cellSpacing="0" cellPadding="0" width="95%" align="center" border="0">
							<tr>
								<td align="left" style="font-family :宋体; font-size: 9pt;">
                                    所属类别：
								</td>
								<td style="width: 359px">
									<asp:DropDownList id="ddlCategory" runat="server" AutoPostBack="True"></asp:DropDownList>
								</td>
							</tr>
							<tr>
								<td align="left" width="80" style="font-family :宋体; font-size: 9pt;">
                                    商品名称：</td>
								
								<td style="width: 359px"><asp:textbox id="txtName" runat="server"></asp:textbox><FONT color="red">*<asp:RequiredFieldValidator
                                        ID="rfvName" runat="server" ControlToValidate="txtName" Font-Size="9pt"
                                        Height="1px" Width="14px"></asp:RequiredFieldValidator></FONT></td>	
							</tr>
							<tr>
								<td align="left" style="height: 24px;font-family :宋体; font-size: 9pt;" >
                                    编注：
								</td>
								<td style="width: 359px; height: 24px;"><asp:textbox id="txtAuthor" runat="server"></asp:textbox><FONT color="red">*<asp:RequiredFieldValidator
                                        ID="rfvAuthor" runat="server" ControlToValidate="txtAuthor" Font-Size="9pt"
                                        Height="1px" Width="14px"></asp:RequiredFieldValidator>
                                        </FONT></td>
							</tr>
							
							<tr>
								<td align="left" style="font-family :宋体; font-size: 9pt;">商城：
								</td>
								<td style="width: 359px"><asp:textbox id="txtCompany" runat="server"></asp:textbox><FONT color="red">*<asp:RequiredFieldValidator
                                        ID="rfvCompany" runat="server" ControlToValidate="txtCompany" Font-Size="9pt"
                                        Height="1px" Width="14px"></asp:RequiredFieldValidator></FONT></td>
							</tr>
							<tr>
								<td align="left" height="19" style="font-family :宋体; font-size: 9pt;">市场价格：
								</td>
								<td colSpan="3" height="19"><asp:textbox id="txtMarketPrice" runat="server">0</asp:textbox><FONT color="red">*<asp:RegularExpressionValidator
                                        ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMarketPrice"
                                        ErrorMessage="请正确输入（格式：1.00）" ValidationExpression="^[0-9]+(.[0-9]{2})?$"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator
                                        ID="rfv" runat="server" ControlToValidate="txtMarketPrice" Font-Size="9pt"
                                        Height="1px" Width="14px"></asp:RequiredFieldValidator></FONT>
                                        </td>
							</tr>
							<tr>
								<td align="left" style="font-family :宋体; font-size: 9pt;">热门价：
								</td>
								<td colSpan="3"><asp:textbox id="txtHotPrice" runat="server">0</asp:textbox><FONT color="red">*<asp:RegularExpressionValidator
                                        ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtHotPrice"
                                        ErrorMessage="请正确输入（格式：1.00）" ValidationExpression="^[0-9]+(.[0-9]{2})?$"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator
                                        ID="rfvHotPrice" runat="server" ControlToValidate="txtHotPrice" Font-Size="9pt"
                                        Height="1px" Width="14px"></asp:RequiredFieldValidator>
                                        </FONT></td>
							</tr>
							<tr>
								<td align="left" style="height: 22px;font-family :宋体; font-size: 9pt;" >
                                    图像：
								</td>
								<td colSpan="3" style="height: 22px">
                                    <asp:DropDownList ID="ddlUrl" runat="server" OnSelectedIndexChanged="ddlUrl_SelectedIndexChanged" AutoPostBack="True">
                                    </asp:DropDownList></td>
							</tr>
                            <tr>
                                <td align="left" style="height: 22px">
                                </td>
                                <td colspan="3" style="height: 22px">
                                    <asp:ImageMap ID="ImageMapPhoto" runat="server" >
                                    </asp:ImageMap></td>
                            </tr>
							<tr>
								<td align="left" style="height: 20px">是否为推荐：
								</td>
								<td colSpan="3" style="height: 20px"><asp:checkbox id="cbxCommend" runat="server" Checked="True" AutoPostBack="True"></asp:checkbox></td>
							</tr>
							
							<tr>
								<td align="left" style="font-family :宋体; font-size: 9pt;">
                                    是否为热门：
								</td>
								<td colSpan="3"><asp:checkbox id="cbxHot" runat="server" Checked="True" AutoPostBack="True"></asp:checkbox></td>
							</tr>
							<tr>
								<td align="left" style="font-family :宋体; font-size: 9pt;">
                                    是否为最新：
								</td>
								<td colSpan="3"><asp:checkbox id="cbxDiscount" runat="server" Checked="True" AutoPostBack="True"></asp:checkbox></td>
							</tr>
							<tr>
								<td align="left" style="font-family :宋体; font-size: 9pt;">
                                    简单描述：
								</td>
								<td style="width: 359px"><asp:textbox id="txtShortDesc" runat="server" Width="307px" Height="89px" TextMode="MultiLine"></asp:textbox><span
                                        style="color: #ff0000">*<asp:RequiredFieldValidator
                                        ID="rfvShortDesc" runat="server" ControlToValidate="txtShortDesc" Font-Size="9pt"
                                        Height="1px" Width="14px"></asp:RequiredFieldValidator></span></td>
							</tr>
							<tr>
								<td align="center" colSpan="4"><br>
									<asp:button id="btnSave" runat="server" Text="保存" OnClick="btnSave_Click"></asp:button>
									<asp:button id="btnReset" runat="server" Text="重置"  OnClick="btnReset_Click"></asp:button></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
		</form>
	</body>

</html>
