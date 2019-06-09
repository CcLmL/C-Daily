<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchByKey.aspx.cs" Inherits="Portal_Search_SearchByKey" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">    
    <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td colspan="2"><ucTitle:ModuleTitle ID="ucMsgTitle" runat="server" Title="基于关键字的搜索" /></td>
		</tr>	
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">关键字:</td>
			<td valign="middle"><asp:TextBox ID="tbKey" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="50" Width="300px"></asp:TextBox><asp:RequiredFieldValidator ID="rfKey" runat="server" ControlToValidate="tbKey"	ErrorMessage="不能为空。" Display="Dynamic"></asp:RequiredFieldValidator><asp:Button ID="btnSearch" runat="server" Text="搜索" CssClass="Button" OnClick="btnSearch_Click" SkinID="btnSkin" Width="60px" />
			</td>
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
								<a href='../ViewTitle.aspx?TitleID=<%# Eval("ID") %>'><%# Eval("Name") %></a> 
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField ItemStyle-Width="37%" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left" HeaderText="帖子内容">
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
    </table>    
    </form>
</body>
</html>
