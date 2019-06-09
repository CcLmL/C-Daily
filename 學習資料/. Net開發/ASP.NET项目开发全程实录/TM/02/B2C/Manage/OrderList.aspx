<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderList.aspx.cs" Inherits="Manage_OrderList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>订单管理</title>
</head>
<body  style ="font-family :宋体; font-size :9pt;">
    <form id="form1" runat="server">
    <div>
    <table cellSpacing="0" cellPadding="0" width="100%" align="center"border="0" style ="font-family :宋体; font-size :9pt;">
				
				<tr>
					<td  align="left" height="25" style ="font-family :宋体; font-size :9pt;">
						&nbsp;&nbsp; 订单管理<asp:Label id="labTitleInfo" runat="server"></asp:Label></td>
					
				<tr>
				</tr>
			</table>
			<table  cellSpacing="0" cellPadding="0" width="100%" align="center"border="0" style="font-family :宋体; font-size :9pt; background-image: url();">
				
				<tr>
					<td align="center" style="height: 106px">
						<table cellSpacing="0" cellPadding="0" width="95%" align="center" style ="font-family :宋体; font-size :9pt;">
							<tr>
								<td align="right">
                                    订单号：</td>
								<td align =left >
                                    <asp:textbox id="txtKeyword" runat="server"></asp:textbox>
                                    <asp:RegularExpressionValidator ID="revInt" runat="server" ControlToValidate="txtKeyword"
                                        ErrorMessage="请输入整数" ValidationExpression="[0-9]*$"></asp:RegularExpressionValidator></td>         
							</tr>
							<tr>
							<td align =right >
							收货人：</td>
							<td align =left >
                                <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
							</tr>
							<tr>
								<td align="right">订单状态：</td>
								<td align =left ><asp:dropdownlist id="ddlConfirmed" Runat="server">
								        <asp:ListItem Value="0">未确认</asp:ListItem>
										<asp:ListItem Value="1">已确认</asp:ListItem>
									</asp:dropdownlist><asp:dropdownlist id="ddlShipped" Runat="server">
										<asp:ListItem Value="0">未发货</asp:ListItem>
										<asp:ListItem Value="1">已发货</asp:ListItem>
									</asp:dropdownlist><asp:dropdownlist id="ddlFinished" Runat="server">
										<asp:ListItem Value="0">未归档</asp:ListItem>
										<asp:ListItem Value="1">已归档</asp:ListItem>
									</asp:dropdownlist></td>
							</tr>
							
							<tr>
								<td ></td>
								<td align="left">
                                    &nbsp;<asp:button id="btnSearch" runat="server" Text="搜索" OnClick="btnSearch_Click"></asp:button></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="height: 23px;font-size :9pt;">
				
                        <asp:GridView ID="gvOrderList" runat="server"   HorizontalAlign =Center  Width =100% DataKeyNames ="OrderID" AutoGenerateColumns =False PageSize="5" AllowPaging="True" OnPageIndexChanging="gvOrderList_PageIndexChanging" OnRowDeleting="gvOrderList_RowDeleting" Font-Size =10pt BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
                        <HeaderStyle Font-Bold =True Font-Size =Small BackColor="Tan"  />
                        
                        <Columns >
                        <asp:TemplateField  HeaderText ="跟单员">
                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
									<ItemStyle HorizontalAlign="Left" ></ItemStyle>
									<ItemTemplate>
										<%#GetAdminName(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "OrderID").ToString())) %>
									</ItemTemplate>                                
                        </asp:TemplateField>
                        <asp:BoundField DataField="OrderID" HeaderText="单号">
                                <ItemStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>   
                        <asp:TemplateField  HeaderText ="下订时间">
                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
									<ItemStyle HorizontalAlign="Left"></ItemStyle>
									<ItemTemplate>
									    <%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "OrderDate").ToString()).ToLongDateString()%>
									</ItemTemplate>                                
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="货品总额">
                                   <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
									<ItemStyle HorizontalAlign="Left" ></ItemStyle>
									<ItemTemplate>
										<%#GetVarGF(DataBinder.Eval(Container.DataItem, "BooksFee").ToString()) %>
									</ItemTemplate>                              
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="运费">
                                  <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
									<ItemStyle HorizontalAlign="Center" ></ItemStyle>
									<ItemTemplate>
										<%# GetVarSF(DataBinder.Eval(Container.DataItem, "ShipFee").ToString()) %>
									</ItemTemplate>                             
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="总金额">
                                  <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
									<ItemStyle HorizontalAlign="Center" ></ItemStyle>
									<ItemTemplate>
										<%# GetVarTP(DataBinder.Eval(Container.DataItem, "TotalPrice").ToString()) %>
									</ItemTemplate>                         
                        </asp:TemplateField>
                            <asp:BoundField DataField="ShipType" HeaderText="配送方式">
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>  
                          <asp:BoundField DataField="ReceiverName" HeaderText="收货人">
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>                 
                         <asp:BoundField DataField="ReceiverPhone" HeaderText="联系电话">
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>   
                         
                        <asp:TemplateField HeaderText="订单状态">
                              <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
									<ItemStyle HorizontalAlign="Center" ></ItemStyle>
									<ItemTemplate>
										<%# GetStatus(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "OrderID").ToString()))%>
									</ItemTemplate>                
                        </asp:TemplateField >
                        <asp:TemplateField HeaderText="管理">
                             <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
									<ItemStyle HorizontalAlign="Center" ></ItemStyle>
									<ItemTemplate>
										<a href='OrderModify.aspx?OrderID=<%# DataBinder.Eval(Container.DataItem, "OrderID") %>'>
											管理</a>
									</ItemTemplate>            
                        </asp:TemplateField>
                            <asp:CommandField ShowDeleteButton="True"  HeaderText="删除" />
                        
                        </Columns>
                            <EditRowStyle Font-Size="Small" />
                            <FooterStyle BackColor="Tan" />
                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                            <PagerStyle ForeColor="DarkSlateBlue" HorizontalAlign="Center" BackColor="PaleGoldenrod" />
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        </asp:GridView>
					</td>
				</tr>
			</table>

    </div>
    </form>
</body>
</html>
