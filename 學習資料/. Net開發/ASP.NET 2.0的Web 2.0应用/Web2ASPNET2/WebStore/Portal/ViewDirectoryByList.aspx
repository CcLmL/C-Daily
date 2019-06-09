<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewDirectoryByList.aspx.cs" Inherits="Portal_ViewDirectoryByList" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">    
    <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="以列表形式查看目录及其文档" /></td>
		</tr>		
		<tr>
			<td colspan="2" valign="top">当前目录:<asp:DropDownList ID="ddlDirectory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DirList_SelectedIndexChanged" SkinID="ddlSkin"></asp:DropDownList>&nbsp;<a href="AddDirectory.aspx">[新建文件夹]</a></td>
		</tr>	
		<tr>
			<td colspan="2" valign="top">
				<asp:GridView ID="gvDirectory" runat="server" AutoGenerateColumns="False" CssClass="Text"	Width="100%" DataKeyNames="ID" SkinID="gvSkin" OnRowCommand="gvDirectory_RowCommand" OnRowDataBound="gvDirectory_RowDataBound">
					<Columns>
						<asp:TemplateField>
							<ItemTemplate>
								<asp:CheckBox ID="cbDirectory" runat="server" Checked="false" />
							</ItemTemplate>
							<ItemStyle HorizontalAlign="Center" />
							<HeaderStyle Width="5%" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="目录名称">
							<ItemTemplate>
								<asp:Image ID="imgDirectory" runat="server" ImageUrl='<%# FormatImageUrl((int)Eval("Flag"),Eval("Type").ToString()) %>' />&nbsp;
								<a href='<%# FormatHerf((int)Eval("ID"),(int)Eval("ParentID"),(int)Eval("Flag"))%>'><%#Eval("Name") %></a>
							</ItemTemplate>
							<ItemStyle HorizontalAlign="Left" />
							<HeaderStyle Width="45%" />
						</asp:TemplateField>
						<asp:TemplateField  HeaderText="创建时间">
							<ItemTemplate>
								<%# Eval("CreateDate","{0:d}") %>
							</ItemTemplate>
							<ItemStyle HorizontalAlign="Center" />
							<HeaderStyle Width="15%" HorizontalAlign="Center" />
						</asp:TemplateField>
						<asp:TemplateField  HeaderText="目录/文件大小">
							<ItemTemplate>
								<%# (int)Eval("Contain")/1024 %>KB
							</ItemTemplate>
							<ItemStyle HorizontalAlign="Center" />
							<HeaderStyle Width="15%" HorizontalAlign="Center" />
						</asp:TemplateField>	
						<asp:TemplateField  HeaderText="Web服务">
							<ItemTemplate>
								<asp:Button ID="btnGetFileByIDService" Width="100" Visible='<%# (int)Eval("Flag") > 0 ? true : false %>' CommandArgument='<%# Eval("ID") %>' CommandName='<%# (int)Eval("Flag") == 1 ? "byurlservice" : "byidservice" %>' runat="server" Text='<%# (int)Eval("Flag") == 1 ? "根据Url获取文件" : "根据ID获取文件" %>' SkinID="btnSkin" />
							</ItemTemplate>
							<ItemStyle HorizontalAlign="Center" />
							<HeaderStyle Width="10%" HorizontalAlign="Center" />
						</asp:TemplateField>					
						<asp:TemplateField HeaderText="操作">
							<ItemTemplate>
								<a href='<%# (int)Eval("Flag") == 0 ? "UpdateDirectory.aspx?ParentID=" + Eval("ParentID") + "&DirectoryID" : "UpdateFile.aspx?DirectoryID=" + Eval("ParentID") + "&FileID" %>=<%#Eval("ID") %>'><asp:Image ID="imgHr" runat="server" ImageUrl="~/App_Themes/Web2ASPNET2/Images/update.gif" /></a>&nbsp;															
								<asp:HyperLink ID="hlDownload"  Target="_blank" runat="server" ImageUrl="../App_Themes/Web2ASPNET2/Images/down.gif" Visible='<%# (int)Eval("Flag") == 0 ? false : true  %>' NavigateUrl='<%# FormatDownloadUrl(Eval("Url").ToString(),(int)Eval("ID")) %>'></asp:HyperLink>
								<asp:HyperLink ID="hlUpload" Target="Desktop" runat="server" Visible='<%#(int)Eval("Flag") == 0 ? true : false %>' NavigateUrl='<%# "AddFile.aspx?DirectoryID=" + Eval("ID") + "&ParentID=" + Eval("ParentID") %>'><asp:Image ID="Image1" runat="server" ImageUrl="~/App_Themes/Web2ASPNET2/Images/up.gif" /></asp:HyperLink>&nbsp;
								<asp:ImageButton ID="ibtDelete" runat="server" CommandName="delete" Visible='<%# (int)Eval("Flag") > 0 ? true : (false || ((int)Eval("SubDirCount") + (int)Eval("FileCount")) > 0 ? false : true) %>' ImageUrl="../App_Themes/Web2ASPNET2/Images/delete.gif" AlternateText="删除该数据项" CommandArgument='<%# Eval("ID") %>' />
							</ItemTemplate>
							<ItemStyle HorizontalAlign="Left" />
							<HeaderStyle Width="16%" HorizontalAlign="Center" />
						</asp:TemplateField>					
					</Columns>
					<AlternatingRowStyle BorderColor="CornflowerBlue" BackColor="White" BorderStyle="Solid" BorderWidth="1px" />
					<PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
					<EditRowStyle BorderColor="CornflowerBlue" BorderWidth="1px" />
				</asp:GridView>
			</td>			
		</tr>
		<tr>
			<td colspan="2"><asp:Button ID="btnReturn" runat="server" Text="返回上级目录" Width="100px" CssClass="Button" OnClick="ReturnBtn_Click" SkinID="btnSkin" /></td>
		</tr>
    </table>    
    </form>
</body>
</html>