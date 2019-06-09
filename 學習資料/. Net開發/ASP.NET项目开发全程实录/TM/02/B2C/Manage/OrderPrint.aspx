<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderPrint.aspx.cs" Inherits="Manage_OrderPrint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>订单打印</title>
    <SCRIPT language="JavaScript">
		function printPage() 
		{
			eval("printOrder" + ".style.display=\"none\";");
			window.print(); 
		}
		</SCRIPT>
</head>
<body style =" font-family :宋体; font-size :9pt;">
    <form id="form1" runat="server">
    <div>
  
    <TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" bgColor="#ffffff" border="0">
				<TBODY>
					<TR>
						<TD vAlign="middle" width="3%"><STRONG><BR>
							</STRONG>
						</TD>
						<TD vAlign="middle" align="center" width="30%"></TD>
						<TD class="body-shoptitle" vAlign="middle" align="center" width="67%">订单号码：<%=order.OrderNo%><br>
							下单日期：<%=order.OrderTime%>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" bgColor="#ffffff" border="0">
				<TBODY>
					<TR>
						<TD>&nbsp;</TD>
					</TR>
				</TBODY>
			</TABLE>
			<TABLE id="Table3" cellSpacing="0" cellPadding="1" width="100%" bgColor="#ffffff" border="0">
				<TBODY>
					<TR>
						<TD><STRONG>订单信息</STRONG>
							<HR noShade SIZE="1">
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<TABLE id="Table4" cellSpacing="3" cellPadding="3" width="100%" bgColor="#ffffff" border="0">
				<TBODY>
					<TR>
						<TD style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; height: 24px; width: 50px;"
							align="center">商品代号</TD>
						<TD style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; height: 24px; width: 49px;"
							align="left"  valign=middle>商品名称<BR>
						</TD>
						<TD style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; height: 24px; width: 46px;"
							align="center">数量</TD>
						<TD style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; height: 24px; width: 37px;"
							align="center">热门价<BR>
						</TD>
						<TD style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; height: 24px; width: 27px;"
							align="center">小计<BR>
						</TD>
						<td style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; height: 24px;"
							align="center" width="130px">备注</td>
					</TR>
					<asp:repeater id="rptOrderItems" Runat="server">
						<ItemTemplate>
							<TR>
								<TD align="left" width="64" height="20"><%# DataBinder.Eval(Container.DataItem, "BookID")%></TD>
								<TD align="left" width="64" height="20"><%# DataBinder.Eval(Container.DataItem, "BookName")%></TD>
								<TD align="left" width="99" height="20"><%#DataBinder.Eval(Container.DataItem, "Num")%></TD>
								<TD align="left" width="98" height="20"><%# GetHotPrice(DataBinder.Eval(Container.DataItem, "HotPrice").ToString())%>￥</TD>
								<TD align="left" width="104" height="20"><%# GetTotailPrice(DataBinder.Eval(Container.DataItem, "TotailPrice").ToString())%>￥</TD>
								<TD width="80"align="center"><%# DataBinder.Eval(Container.DataItem, "Remark")%></TD>
							</TR>
						</ItemTemplate>
					</asp:repeater>
					<TR>
						<TD align="center" style="width: 50px">&nbsp;</TD>
						<TD style="width: 49px">&nbsp;</TD>
						<TD style="width: 46px">&nbsp;</TD>
						<TD style="width: 37px">&nbsp;</TD>
						<TD style="width: 27px">&nbsp;</TD>
						<TD width="104">&nbsp;</TD>
					</TR>
				</TBODY>
			</TABLE>
			<TABLE id="Table5" cellSpacing="0" cellPadding="2" width="100%" bgColor="#ffffff" border="0">
				<tr>
					<td vAlign="top" width="50%">
						<table id="Table6" width="100%">
							<tr>
								<td style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid"
									align="left" width="30%">定单状态：</td>
									<td width="5%"></td>
									<td><%=GetStatus(Convert.ToInt32((order.OrderNo).ToString()))%></td>
							</tr>
							<tr>
								<td style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid"
									align="left" width="30%">配送方式：</td>
									<td width="5%"></td>
									<td><%=order.ShipType%></td>
							</tr>
						</table>
					</td>
					<td width="50%">
						<table id="Table7" width="100%">
							<tr>
								<td style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid"
									align="left" width="30%">商品总金额：</td>
								<td width="5%"></td>
								<td><%=string.Format("{0:f}",order.ProductPrice)%>￥ </td>
							</tr>
							
							<tr>
								<td style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid"
									align="left" width="30%">商品运费：</td>
								<td width="5%"></td>
								<td><%=string.Format("{0:f}",order.ShipPrice)%>￥</td>
							</tr>
							<tr>
								<td style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid"
									align="left" width="30%">订单总金额：</td>
								<td width="5%"></td>
								<td><%=string.Format("{0:f}",order.TotalPrice)%>￥</td>
							</tr>
						</table>
					</td>
				</tr>
			</TABLE>
			<TABLE id="Table8" cellSpacing="3" cellPadding="3" width="100%" bgColor="#ffffff" border="0">
				<tr>
					
					<td><STRONG>收货人信息</STRONG>
					<HR noShade SIZE="1">
					</td>
				</tr>
				<tr>
					
					<td style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid"
						width="50%">
						<table id="Table10"  width="100%">
							<tr>
								<td align="right" style="width: 80px">收货人姓名：</td>
								<td ><%=order.ReceiverName%></td>
							</tr>
							<tr>
								<td align="right" style="width: 80px">联系电话：</td>
								<td ><%=order.ReceiverPhone%></td>
							</tr>
							<tr>
								<td align="right" style="width: 80px">Email地址：</td>
								<td ><%=order.ReceiverEmail%></td>
							</tr>
							<tr>
								<td align="right" style="width: 80px">收货人地址：</td>
								<td><%=order.ReceiverAddress%></td>
							</tr>
							<tr>
								<td align="right" style="width: 80px">邮政编码：</td>
								<td><%=order.ReceiverPostcode%></td>
							</tr>
							<tr>
								<td align="right" style="width: 80px"></td>
								<td></td>
							</tr>
						</table>
					</td>
				</tr>
			    <tr>
					<td height="20" align="center" valign="middle">
					<SPAN id="printOrder"><input type="button" onclick="printPage()" value="打 印" style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; WIDTH: 69px; BORDER-BOTTOM: #000000 1px solid; HEIGHT: 22px" id="Button1"></SPAN></td>
				</tr>
			</TABLE>
				
			
    </div>
    </form>
</body>
</html>
