<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchByDate.aspx.cs" Inherits="Portal_Search_SearchByDate" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">    
    <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td colspan="2"><ucTitle:ModuleTitle ID="ucMsgTitle" runat="server" Title="搜索用户的帖子" /></td>
		</tr>	
		<tr>
			<td width="150" valign="middle" class="LeftTD" align="right">选择时间:</td>
			<td valign="middle" width="85%">
				<table class="Table">
					<tr>
						<td width="220">
							<asp:Calendar ID="cDate" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px"
								CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
								ForeColor="#003399" Height="200px" Width="220px">
								<SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
								<TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
								<SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
								<WeekendDayStyle BackColor="#CCCCFF" />
								<OtherMonthDayStyle ForeColor="#999999" />
								<NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
								<DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
								<TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True"
									Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
							</asp:Calendar>
						</td>
						<td valign="bottom"><asp:Button ID="btnSearch" runat="server" Text="搜索" CssClass="Button" OnClick="btnSearch_Click" SkinID="btnSkin" Width="60px" /></td>
					</tr>
				</table>			
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