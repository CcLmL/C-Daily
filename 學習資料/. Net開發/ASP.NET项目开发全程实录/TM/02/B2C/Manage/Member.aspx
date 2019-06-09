<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Member.aspx.cs" Inherits="Manage_Member" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>管理管理员</title>
</head>
<body style ="font-family :宋体; font-size :9pt;">
    <form id="form1" runat="server">
    <div style="background-image: url()">
     <table  cellSpacing="0" cellPadding="0" width="650" align="center" border="0">
				<tr>
					<td  height="25" align="left" style ="font-family :宋体; font-size :9pt;">
                        &nbsp; 管理管理员</td>
					
				<tr>
				<tr>
				<td>
				<table  cellSpacing="0" cellPadding="0" width="95%" align="center" border="0">
				<tr>
					<td style="height: 23px;font-family :宋体; font-size :9pt;">
                        &nbsp;<asp:GridView ID="gvAdminList" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            PageSize="5" DataKeyNames ="AdminID"  Width="100%" HorizontalAlign="Center" CellPadding =3
							HeaderStyle-CssClass="summary-title" OnPageIndexChanging="gvAdminList_PageIndexChanging"  OnRowDeleting="gvAdminList_RowDeleting" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" >
							<HeaderStyle Font-Bold="True" CssClass="summary-title" BackColor="#A55129" ForeColor="White"></HeaderStyle>
                            <Columns>
                                <asp:BoundField DataField="AdminID" HeaderText="代号" ReadOnly="True" >
                                    <ItemStyle HorizontalAlign="Center" Width="40px" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="AdminName" HeaderText="用户名称" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Password" HeaderText="密码" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="RealName" HeaderText="真实名" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Email" HeaderText="Email">
                                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                 <asp:TemplateField  HeaderText="加入日期">
                                <HeaderStyle HorizontalAlign =Center />
                                <ItemStyle HorizontalAlign =Center />
                                <ItemTemplate>
                                <%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "LoadDate").ToString()).ToLongDateString()%>
                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowDeleteButton="True" >
                                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                                </asp:CommandField>
                            </Columns>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        </asp:GridView>
					</td>
				</tr>
			</table>
				</td>
				</tr>
			</table>
			
    </div>
        `
    </form>
</body>
</html>
