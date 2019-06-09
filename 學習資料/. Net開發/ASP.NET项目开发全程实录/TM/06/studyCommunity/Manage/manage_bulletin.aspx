<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_bulletin.aspx.cs" Inherits="Manage_manageBulletin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    
    <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body style="text-align: left">
    <form id="form1" runat="server">
    <div>
        
            <div style="text-align: left">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 381px; height: 323px" id="TABLE1">
                    <tr>
                        <td style="width: 100px; text-align: center;">
                            <span style="font-size: 16pt; color: #006633"><strong>公告管理</strong></span></td>
                        <td style="width: 100px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; text-align: left" valign="top">
                            <asp:GridView ID="grvBulletin" runat="server" AutoGenerateColumns="False" Height="266px"
                                Width="355px" AllowPaging="True" OnPageIndexChanging="grvBulletin_PageIndexChanging"  PageSize="5" OnRowDeleting="grvBulletin_RowDeleting" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" CssClass="chengse">
                                <Columns>
                                    <asp:HyperLinkField DataTextField="Title" HeaderText="公告标题" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="../bulletinInfo.aspx?ID={0}" Target="_blank" >
                                        <ControlStyle Font-Underline="False" />
                                    </asp:HyperLinkField>
                                    <asp:BoundField DataField="Date" HeaderText="发布日期" />
                                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True">
                                        <ControlStyle Font-Underline="False" />
                                    </asp:CommandField>
                                </Columns>
                                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                               
                            </asp:GridView>
                        </td>
                        <td style="width: 100px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                        </td>
                        <td style="width: 100px">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    
    
    </form>
</body>
</html>
