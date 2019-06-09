<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Manger_Product" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>商品管理</title>
</head>
<body style ="font-family :宋体; font-size :9pt;">
    <form id="form1" runat="server">
    <div style="background-image: url()">
            <table cellSpacing="0" cellPadding="0" width="640" align="center" border="0" style ="font-family :宋体; font-size :9pt;">
				<tr>
					<td style="font-family :宋体; font-size :9pt; height: 25px;" align="left">
						&nbsp;&nbsp; 商品管理</td>
					
				<tr>
				<tr>
				<td>
				 <table cellSpacing="0" cellPadding="0" width="640" align="center" border="0">
			 <tr>
					
					<td align="center" style ="font-family :宋体; font-size :9pt;">
                        请输入关键字：&nbsp;
						 <asp:TextBox ID="txtKey" runat="server"></asp:TextBox>&nbsp;
						<asp:Button id="btnSearch" runat="server" Text="搜索" OnClick="btnSearch_Click"></asp:Button>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    </td>
				</tr>
          
            <tr>
                <td style ="font-family :宋体; font-size :9pt;" >
                    <br />
                    <asp:GridView ID="gvGoodsInfo" runat="server" CellPadding="2" Width="95%" HorizontalAlign="Center" 
							HeaderStyle-CssClass="summary-title" AutoGenerateColumns="False" OnPageIndexChanging="gvGoodsInfo_PageIndexChanging" OnRowDeleting="gvGoodsInfo_RowDeleting" AllowPaging="True" PageSize="5" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" GridLines="None" ForeColor="Black" >
                       <HeaderStyle Font-Bold="True"  Font-Size =Small BackColor="Tan" CssClass="summary-title"></HeaderStyle>
                        <Columns>
                            <asp:BoundField DataField="BookID" HeaderText="商品ID"  >
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="BookName" HeaderText="商品名称">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText ="所属类别">
                            <HeaderStyle HorizontalAlign =Center />
                            <ItemStyle HorizontalAlign =Center />
                            <ItemTemplate >
                            <%# GetClassName(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "ClassID").ToString())) %>
                            </ItemTemplate>
                            </asp:TemplateField> 
                            <asp:BoundField DataField="Author" HeaderText="编注">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Company" HeaderText="商城">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                             <asp:TemplateField HeaderText ="热门价">
                            <HeaderStyle HorizontalAlign =Center />
                            <ItemStyle HorizontalAlign =Center />
                            <ItemTemplate >
                            <%# GetVarStr(DataBinder.Eval(Container.DataItem, "HotPrice").ToString())%>￥
                            </ItemTemplate>
                            </asp:TemplateField> 
                            <asp:HyperLinkField HeaderText="详细信息" Text="详细信息" DataNavigateUrlFields="BookID" DataNavigateUrlFormatString="EditProduct.aspx?BookID={0}" >
                                <ControlStyle Font-Underline="False" ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:HyperLinkField>
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" >
                                <ControlStyle Font-Underline="False" ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                        </Columns>
                        <FooterStyle BackColor="Tan" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    </asp:GridView>
                </td>
            </tr>
        </table>				
				</td>
				</tr>
			</table>	
    </div>
    </form>
</body>
</html>
