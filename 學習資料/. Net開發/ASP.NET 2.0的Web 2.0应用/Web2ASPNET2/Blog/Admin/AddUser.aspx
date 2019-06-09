<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddUser.aspx.cs" Inherits="Admin_AddUser" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">    
    <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="注册新用户" /></td>
		</tr>
		<tr>
			<td colspan="2"><font color="red"> 以下内容是必填内容：</font></td>
		</tr>
		<tr>
			<td colspan="4" width="80%"></td>
		</tr>
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				用户名称:</td>
			<td valign="middle"><asp:TextBox ID="tbUserName" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="50" Width="150px"></asp:TextBox><asp:RequiredFieldValidator ID="rfUN" runat="server" ControlToValidate="tbUserName"
					ErrorMessage="不能为空。" Display="Dynamic"></asp:RequiredFieldValidator><asp:Button ID="btnCheckUser" runat="server" Text="检查我的用户名？" SkinID="btnSkin" CausesValidation="False" OnClick="btnCheckUser_Click" /><asp:Label ID="lbUserNameMsg" runat="server"></asp:Label>
				<br />
				用户名称即为登录名称，整个网站唯一；一旦注册之后，不能更改。
				<br />
				用户名称最大长度为32。请<font color="red">尽量不要使用中文名称</font>，谢谢！
			</td>
		</tr>
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				用户密码:</td>
			<td valign="middle"><asp:TextBox ID="tbPassword" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="255" Width="150px" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="rfPwd" runat="server" ControlToValidate="tbPassword"
					ErrorMessage="不能为空。" Display="Dynamic"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="rePwd" runat="server" ControlToValidate="tbPassword" Display="Dynamic" ErrorMessage="密码最小长度为6。" ValidationExpression="\S{6,}"></asp:RegularExpressionValidator>
				<br />
				密码长度至少为6，且至少包含一个非字母字符。
			</td>
		</tr>
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				确认密码:</td>
			<td valign="middle"><asp:TextBox ID="tbPasswordStr" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="255" Width="150px" TextMode="Password"></asp:TextBox>
				<asp:CompareValidator ID="cvPwd" runat="server" ControlToCompare="tbPassword" ControlToValidate="tbPasswordStr"
					Display="Dynamic" ErrorMessage="两次输入的密码不相同！"></asp:CompareValidator></td>
		</tr>
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				电子邮件:</td>
			<td valign="middle"><asp:TextBox ID="tbEmail" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="255" Width="300px"></asp:TextBox><asp:RequiredFieldValidator ID="rfEmail" runat="server" ControlToValidate="tbEmail"
					ErrorMessage="不能为空。" Display="Dynamic"></asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ID="reEmail" runat="server" ControlToValidate="tbEmail"
					ErrorMessage="电子邮件格式不正确。" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator></td>
		</tr>	
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				<asp:Label ID="Label1" runat="server" Width="150px"></asp:Label></td>
			<td valign="middle" width="100%">
				<asp:Button ID="btnAdd" runat="server" Text="保存，并再添加" CssClass="Button" OnClick="btnAdd_Click" SkinID="btnSkin" />&nbsp;&nbsp;&nbsp;
				<asp:Button ID="btnAddAndReturn" runat="server" CssClass="Button" Text="保存，并返回管理页面" OnClick="btnAddAndReturn_Click" SkinID="btnSkin" />&nbsp;&nbsp;&nbsp;
				<asp:Button ID="btnReturn" runat="server" CssClass="Button" Text="返回管理页面" CausesValidation="False" OnClick="btnReturn_Click" SkinID="btnSkin" /></td>
		</tr>
    </table>    
    </form>
</body>
</html>