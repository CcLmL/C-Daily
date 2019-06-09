<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manager.aspx.cs" Inherits="Manger_Manager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>管理会员</title>
</head>
<body style ="font-family :宋体; font-size :9pt;">
    <form id="form1" runat="server">
    <div style="background-image: url()">
     <table class="tableBorder" cellSpacing="0" cellPadding="0" width="650" align="center" border="0">
				<tr>
					<th class="tableHeaderText" height="25" align="left">
                        管理会员</th>
					
				<tr>
				</tr>
			</table>
			<table class="tableBorder" cellSpacing="0" cellPadding="0" width="650" align="center" border="0">
				<tr>
					<td height="23" >
                       <asp:GridView ID="gvMemberList" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            PageSize="5" DataKeyNames ="MemberID"  Width="100%" HorizontalAlign="Center"
							HeaderStyle-CssClass="summary-title" OnPageIndexChanging="gvMemberList_PageIndexChanging" OnRowDeleting="gvMemberList_RowDeleting" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
							<HeaderStyle Font-Bold="True" CssClass="summary-title" BackColor="Tan"></HeaderStyle>
                            <Columns>
                                <asp:BoundField DataField="MemberID" HeaderText="代号" ReadOnly="True" >
                                    <ItemStyle HorizontalAlign="Center" Width="40px" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="RealName" HeaderText="真实姓名" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Phonecode" HeaderText="电话号码" >
                                    <ItemStyle HorizontalAlign="Center"  />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Email" HeaderText="会员Email" >
                                    <ItemStyle HorizontalAlign="Center"  />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Address" HeaderText="详细地址" >
                                    <ItemStyle HorizontalAlign="Center"  Width="100px" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="PostCode" HeaderText="邮编号码">
                                    <ItemStyle HorizontalAlign="Center"  />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:TemplateField  HeaderText="加入日期">
                                <HeaderStyle HorizontalAlign =Center />
                                <ItemStyle HorizontalAlign =Center />
                                <ItemTemplate>
                                <%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "LoadDate").ToString()).ToLongDateString()%>
                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowDeleteButton="True" />
                            </Columns>
                           <FooterStyle BackColor="Tan" />
                           <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                           <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                           <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        </asp:GridView>
					</td>
				</tr>
			</table>
    </div>
    </form>
</body>
</html>
