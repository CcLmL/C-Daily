<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewBoard.aspx.cs" Inherits="Portal_ViewBoard" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/SearchUC.ascx" TagName="SearchUC" TagPrefix="ucSearchStat" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">    
    <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="帖子管理" /></td>
		</tr>		
		<tr>
			<td colspan="2"><ucSearchStat:SearchUC ID="SearchUC1" runat="server" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<asp:GridView ID="gvTitle" runat="server" AutoGenerateColumns="False" Font-Names="Tahoma" Width="100%" SkinID="gvSkin" DataKeyNames="ID">
					<HeaderStyle Font-Names="Tahoma" HorizontalAlign="Center" />
					<EmptyDataTemplate>
						帖子列表为空。
					</EmptyDataTemplate>					
					<EmptyDataRowStyle ForeColor="Blue" />
					<RowStyle BorderColor="#DAEEEE" BorderStyle="Ridge" BorderWidth="1px" HorizontalAlign="Center" />
					<Columns>
						<asp:TemplateField ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="帖子标题">
							<ItemTemplate>
								<a href='ViewTitle.aspx?TitleID=<%# Eval("ID") %>'><%# Eval("Name") %></a> 
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField ItemStyle-Width="47%" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left" HeaderText="帖子内容">
							<ItemTemplate>
								<%# Eval("Body").ToString().Length > 60 ? Eval("Body").ToString().Substring(0,60) + "..." : Eval("Body") %>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField ItemStyle-Width="8%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="帖子状态">
							<ItemTemplate>
								<%# FormatState(byte.Parse(Eval("State").ToString())) %>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField ItemStyle-Width="8%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="访问次数">
							<ItemTemplate>
								<%# Eval("VisitNum") %>次
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField ItemStyle-Width="8%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="回复次数">
							<ItemTemplate>
								<%# Eval("ReplyNum") %>次
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="CreateDate"  ItemStyle-Width="18%" DataFormatString="{0:d}" HeaderText="创建时间" HtmlEncode="false"/>
					</Columns>
				</asp:GridView>
			</td>
		</tr>
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				<asp:Label ID="Label1" runat="server" Width="150px"></asp:Label></td>
			<td valign="middle" width="100%">
				<asp:Button ID="btnAdd" runat="server" CssClass="Button" Text="发布新的帖子" SkinID="btnSkin" OnClick="btnAdd_Click" /></td>
		</tr>
    </table>    
    </form>
</body>
</html>
