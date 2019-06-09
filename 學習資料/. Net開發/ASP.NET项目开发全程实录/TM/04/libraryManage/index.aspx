<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="index.aspx.cs" Inherits="_Default" %>

<%@ Register Src="bottom.ascx" TagName="bottom" TagPrefix="uc2" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="css.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#e5e5e5">
    <form id="form1" runat="server">
    <div align="center" >
        <table  border="0" cellpadding="0" cellspacing="0" style="width: 803px; text-align: center; border-right: #339900 1px solid; border-top: #339900 1px solid; border-left: #339900 1px solid; border-bottom: #339900 1px solid; background-color: #ffffff;">
            <tr>
                <td style="width: 100%; height: 53px" valign="top">
                    <uc1:header ID="Header1" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 100px; height: 9px; text-align: left;">
                    <span style="color: #cc0000">
                        <br />
                        当前位置：首页</span></td>
            </tr>
            <tr>
                <td align="left" style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/main_booksort.gif" Width="815px" /></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 98px" valign="top">
                    <asp:GridView ID="gvBookTaxis" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                        PageSize="5" Width="815px" OnRowDataBound="gvBookTaxis_RowDataBound">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField HeaderText="排名" />
                            <asp:BoundField DataField="bookBarCode" HeaderText="图书条形码" />
                            <asp:BoundField DataField="bookName" HeaderText="图书名称" />
                            <asp:BoundField DataField="bookType" HeaderText="图书类型" />
                            <asp:BoundField DataField="bookcase" HeaderText="图书书架" />
                            <asp:BoundField DataField="bookConcern" HeaderText="出版社" />
                            <asp:BoundField DataField="author" HeaderText="作者" />
                            <asp:BoundField DataField="price" HeaderText="图书定价" />
                            <asp:BoundField DataField="borrowSum" HeaderText="借阅次数" />
                        </Columns>
                        <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#99C89D" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                        <RowStyle BackColor="#EFF3FB" />
                        <EditRowStyle BackColor="#2461BF" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td style="width: 100px; text-align: center;">
                    <uc2:bottom ID="Bottom1" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
