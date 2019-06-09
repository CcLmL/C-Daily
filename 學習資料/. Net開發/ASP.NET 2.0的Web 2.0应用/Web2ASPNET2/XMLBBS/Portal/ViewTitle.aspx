<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewTitle.aspx.cs" Inherits="Portal_ViewTitle" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">    
    <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title='<%=Name %>' /></td>
		</tr>	
		<tr>
			<td valign="middle" align="left"><a href="AddReply.aspx?TitleID=<%= titleID.ToString() %>">[回复文章]</a>
			</td>
		</tr>	
		<tr>
			<td valign="middle" align="left"><br />　　<%= Body.Replace("\n","<br>") %> <br /><br />
			</td>
		</tr>		
		<tr>
			<td valign="middle" align="center">
				<asp:GridView ID="gvTitle" runat="server" AutoGenerateColumns="False" Font-Names="Tahoma" Width="100%" SkinID="gvSkin" DataKeyNames="ID" ShowHeader="False">
					<HeaderStyle Font-Names="Tahoma" HorizontalAlign="Center" />
					<RowStyle BorderColor="#DAEEEE" BorderStyle="Ridge" BorderWidth="1px" HorizontalAlign="Center" />
					<Columns>
						<asp:TemplateField>
							<ItemTemplate>
								<table class="Table" width="100%" border="0">
										<tr>
											<td bgcolor="#5a7dd1"><font color="white"><a href="AddReply.aspx?TitleID=<%# Eval("TitleID") %>"><font color="white">[回复文章]</font></a>
											<font color="white">[本篇作者：<%# Eval("UserName") %>]</font>
											</td>
										</tr>
										<tr>
											<td>发帖人：<%# Eval("UserName") %>，所属区域：<%# Eval("BoardName")%>
											</td>
										</tr>
										<tr>
											<td>标  &nbsp;&nbsp;题：回复：<%=Name %>
											</td>
										</tr>
										<tr>
											<td>发信站：Web2ASPNET2-XMLBBS(<%# Eval("CreateDate") %>)，站内
											</td>
										</tr>
										<tr>
											<td><br />　　<%# Eval("Body").ToString().Replace("\n","<br>") %><br />
											</td>
										</tr>
										<tr>
											<td><hr size="1" width="98%" /></td>
										</tr>																				
									</table>
							</ItemTemplate>
							<ItemStyle Width="100%" />
						</asp:TemplateField>										
					</Columns>
				</asp:GridView>
			</td>
		</tr>	
		<tr>
			<td valign="middle" align="center">
			</td>
		</tr>		
    </table>    
    </form>
</body>
</html>
