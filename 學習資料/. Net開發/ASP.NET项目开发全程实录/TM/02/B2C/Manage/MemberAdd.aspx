<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MemberAdd.aspx.cs" Inherits="Manage_MemberAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>添加管理员</title>
</head>
<body style ="font-size :9pt; font-family :宋体;">
    <form id="form1" runat="server">
    <div>
   <table cellSpacing="1" cellPadding="1" width="350" align="center" border="0">
			<tr>
			<td  height="25" align="left" style ="font-size :9pt; font-family :宋体;">
			&nbsp;&nbsp; 添加管理员
			</td>
			</tr>
				<tr>
					<td>
						<table style ="font-size :9pt; font-family :宋体;" cellSpacing="0" cellPadding="0" width="95%" align="center" border="0">
							<tr >
								<td align="left" style="height: 24px ;font-size :9pt; font-family :宋体;">
									用户姓名：
								</td>
								<td style="height: 24px">
									<asp:TextBox id="txtName" runat="server"></asp:TextBox>
									<FONT color="red">*<asp:RequiredFieldValidator
                                        ID="rfvName" runat="server" ControlToValidate="txtName" Font-Size="9pt"
                                        Height="1px" Width="13px">**</asp:RequiredFieldValidator></FONT>
								</td>
							</tr>
                            <tr>
                                <td align="left" style="height: 25px;font-size :9pt; font-family :宋体;">
                                    密码：
                                </td>
                                <td style="height: 25px">
                                    <asp:TextBox ID="txtPassWord" runat="server" TextMode="Password"></asp:TextBox>

                                    <FONT color="red">*<asp:RequiredFieldValidator
                                        ID="rfvPass" runat="server" ControlToValidate="txtPassWord" Font-Size="9pt"
                                        Height="1px" Width="8px">**</asp:RequiredFieldValidator></FONT>
                                </td>
                            </tr>
                            <tr>
								<td align="left" style="height: 24px";font-size :9pt; font-family :宋体;>
									真实姓名：
								</td>
								<td style="height: 24px">
									<asp:TextBox id="txtTrueName" runat="server"></asp:TextBox>
									<FONT color="red">*<asp:RequiredFieldValidator
                                        ID="rfvTrueName" runat="server" ControlToValidate="txtTrueName" Font-Size="9pt"
                                        Height="1px" Width="9px">**</asp:RequiredFieldValidator></FONT>
								</td>
							</tr>
                            <tr>
                                <td align="left" style="height: 25px";font-size :9pt; font-family :宋体;>
                                   Email：
                                </td>
                                <td style="height: 25px">
                                   <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                    <FONT color="red">*<asp:RequiredFieldValidator
                                        ID="rfvEmail" runat="server" ControlToValidate="txtEmail" Font-Size="9pt"
                                        Height="1px" Width="15px">**</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                        Font-Size="9pt" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        Width="5px">**</asp:RegularExpressionValidator>
                                        </FONT>
                                </td>
                            </tr>
							<tr>
								<td align="center" colspan="2"><br>
									<asp:Button id="btnSave" runat="server" Text="保存" OnClick="btnSave_Click" ></asp:Button>
									<asp:Button id="btnCancel" runat="server" Text="取消" OnClick="btnCancel_Click" CausesValidation="False" ></asp:Button></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
    
    
    </div>
    </form>
</body>
</html>
