<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReplyManage.aspx.cs" Inherits="Portal_ReplyManage" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">    
    <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="回复管理" /></td>
		</tr>
		<tr>
			<td>
				<asp:GridView ID="gvReply" runat="server" AutoGenerateColumns="False" Font-Names="Tahoma" Width="100%" SkinID="gvSkin" DataKeyNames="ID" OnRowCommand="gvReply_RowCommand" OnRowDataBound="gvReply_RowDataBound">
					<HeaderStyle Font-Names="Tahoma" HorizontalAlign="Center" />
					<EmptyDataTemplate>
						回复列表为空。
					</EmptyDataTemplate>					
					<EmptyDataRowStyle ForeColor="Blue" />
					<RowStyle BorderColor="#DAEEEE" BorderStyle="Ridge" BorderWidth="1px" HorizontalAlign="Center" />
					<Columns>
						<asp:TemplateField ItemStyle-Width="65%" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left" HeaderText="回复">
							<ItemTemplate>
								<a href='ViewReply.aspx?ReplyID=<%# Eval("ID") %>'><%# Eval("Body").ToString().Length > 60 ? Eval("Body").ToString().Substring(0,60) + "..." : Eval("Body") %></a> 
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="CreateDate"  ItemStyle-Width="18%" DataFormatString="{0:d}" HeaderText="创建时间" HtmlEncode="false"/>
						<asp:TemplateField HeaderText="操作" ItemStyle-Width="7%">
							<ItemTemplate>
								<asp:ImageButton ID="ibtDelete" runat="server" CommandName="del" ImageUrl="../App_Themes/Web2ASPNET2/Images/delete.gif" AlternateText="删除该回复" CommandArgument='<%# Eval("ID") %>' />
							</ItemTemplate>
						</asp:TemplateField>						
					</Columns>
				</asp:GridView>
			</td>
		</tr>
    </table>    
    </form>
</body>
</html>