<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CategoryAdd.aspx.cs" Inherits="Manage_CategoryAdd" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>添加商品类别</title>
</head>
<body style="font-family :宋体; font-size :9pt; background-image: url(images/);" >
    <form id="Form1" method="post" runat="server">
    <div>
			<table cellSpacing="1" cellPadding="1" width="400" align="center" border="0">
			<tr>
			<td  height="25" align="left" style ="font-family :宋体; font-size :9pt;" >
			&nbsp;&nbsp; 商品类别添加
			</td>
			</tr>
				<tr>
					<td>
						<table style ="font-family :宋体; font-size :9pt;"  cellSpacing="0" cellPadding="0" width="95%" align="center" border="0">
							<tr>
								<td align="left" style="height: 24px;font-family :宋体; font-size :9pt;">
                                    类别名：
								</td>
								<td style="height: 24px">
									<asp:TextBox id="txtName" runat="server"></asp:TextBox>
								</td>
							</tr>
							<tr>
								<td align="left" style="height: 22px;font-family :宋体; font-size :9pt;">
                                    图像：
								</td>
								<td colSpan="3" style="height: 22px">
                                    <asp:DropDownList ID="ddlUrl" runat="server" OnSelectedIndexChanged="ddlUrl_SelectedIndexChanged" AutoPostBack="True">
                                    </asp:DropDownList></td>
							</tr>
                            <tr>
                                <td align="left" style="height: 22px;font-family :宋体; font-size :9pt;">
                                </td>
                                <td colspan="3" style="height: 22px">
                                    <asp:ImageMap ID="ImageMapPhoto" runat="server" ImageUrl="~/Images/ftp/图商品.gif">
                                    </asp:ImageMap></td>
                            </tr>
							<tr>
								<td align="center" colspan="2"><br>
									<asp:Button id="btnSave" runat="server" Text="保存" OnClick="btnSave_Click"></asp:Button>
									</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

    </div>
    </form>
</body>
</html>
