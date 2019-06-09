<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SenderMail.aspx.cs" Inherits="Mail_SenderMail" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <script language="javascript" type="text/javascript">		
		function addFile()
        {		
            var filebutton = '<br><input type="file" size="50" name="file" class="Button" />';
            document.getElementById('FileList').insertAdjacentHTML("beforeEnd",filebutton);
        }
	</script>
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="smForm" runat="server" />
    <asp:UpdatePanel ID="upForm" runat="server" UpdateMode="Always" RenderMode="Block">
		<ContentTemplate>
			<table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
				<tr>
					<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="发送新邮件" /></td>
				</tr>		
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">
						收件人:</td>
					<td valign="middle"><asp:TextBox ID="tbTo" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="255" Width="300px"></asp:TextBox><asp:RequiredFieldValidator ID="rfTO" runat="server" ControlToValidate="tbTo"	ErrorMessage="不能为空。" Display="Dynamic"></asp:RequiredFieldValidator>
					</td>
				</tr>	
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">
						抄送:</td>
					<td valign="middle"><asp:TextBox ID="tbCC" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="500" Width="300px"></asp:TextBox>
					</td>
				</tr>	
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">
						主题:</td>
					<td valign="middle"><asp:TextBox ID="tbName" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="200" Width="300px"></asp:TextBox><asp:RequiredFieldValidator ID="rfName" runat="server" ControlToValidate="tbName"	ErrorMessage="不能为空。" Display="Dynamic"></asp:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">
						内容:</td>
					<td valign="middle"><asp:TextBox ID="tbBody" CssClass="TextBox" runat="server" SkinID="tbSkin" Width="100%" Height="100px" TextMode="MultiLine"></asp:TextBox><asp:RequiredFieldValidator ID="rfBody" runat="server" ControlToValidate="tbBody"	ErrorMessage="不能为空。" Display="Dynamic"></asp:RequiredFieldValidator>
					</td>
				</tr>		
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">邮件格式:</td>
					<td valign="middle"><input id="cbHtmlFormt" type="checkbox" runat="server" />HTML格式
					</td>
				</tr>		
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">邮件附件列表:</td>
					<td valign="middle"><input type="button" value="增加附件" class="Button" onclick="addFile()" />
					</td>
				</tr>
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right"></td>
					<td valign="middle"><p id="fileList"><input id="file" type="file" runat="server" size="50" name="file" class="Button" /></p>
					</td>
				</tr>
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">
						<asp:Label ID="Label1" runat="server" Width="150px"></asp:Label></td>
					<td valign="middle" width="100%">
						<asp:Button ID="btnSender" runat="server" Text="发   送" CssClass="Button" OnClick="btnSender_Click" SkinID="btnSkin" />&nbsp;&nbsp;&nbsp;
						<asp:Button ID="btnReturn" runat="server" CssClass="Button" Text="返   回" CausesValidation="False" OnClick="btnReturn_Click" SkinID="btnSkin" /></td>
				</tr>
			</table>    
		</ContentTemplate> 
    </asp:UpdatePanel>
    </form>
</body>
</html>
