<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bookInfoManage.aspx.cs" Inherits="bookInfoManage" %>

<%@ Register Src="bottom.ascx" TagName="bottom" TagPrefix="uc2" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="css.css" rel="stylesheet" type="text/css" />
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" style="border-right: #669900 1px solid;
            border-top: #669900 1px solid; border-left: #669900 1px solid; width: 662px;
            border-bottom: #669900 1px solid; background-color: #ffffff">
            <tr>
                <td>
                    <uc1:header ID="Header1" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="text-align: left; height: 22px;">
                    <span style="color: #990000">当前位置：图书馆管理&gt;图书档案管理</span></td>
            </tr>
            <tr>
                <td>
                    &nbsp;<img src="Images/tushudangan.GIF" width="815" /></td>
            </tr>
            <tr>
                <td style="text-align: right; height: 16px;">
                    <asp:HyperLink ID="HyperLink1" Target="_blank" runat="server" NavigateUrl="~/bookInfoPrint.aspx">打印图书信息</asp:HyperLink>&nbsp;
                    <a href="#" onclick="window.open('addBookInfo.aspx?ID=add','','width=340,height=371');">添加图书信息</a>&nbsp;</td>
            </tr>
            <tr>
                <td style="height: 234px">
                    <asp:GridView ID="gvBookManage" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="gvBookManage_PageIndexChanging"
                        OnRowDataBound="gvBookManage_RowDataBound" OnRowDeleting="gvBookManage_RowDeleting"
                        Width="815px">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="bookBarCode" HeaderText="图书条形码" />
                            <asp:BoundField DataField="bookName" HeaderText="图书名称" />
                            <asp:BoundField DataField="bookType" HeaderText="图书类型" />
                            <asp:BoundField DataField="bookcase" HeaderText="图书书架" />
                            <asp:BoundField DataField="bookConcern" HeaderText="出版社" />
                            <asp:BoundField DataField="author" HeaderText="作者" />
                            <asp:BoundField DataField="price" HeaderText="图书定价" />
                            <asp:BoundField DataField="borrowSum" HeaderText="借阅次数" />
                            <asp:TemplateField HeaderText="修改">
                                <ItemTemplate>
                                    <a href="#" onclick="window.open('addBookInfo.aspx?ID=<%#Eval("bookBarCode") %>','','width=340,height=371')">修改</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                        </Columns>
                        <RowStyle BackColor="#EFF3FB" />
                        <EditRowStyle BackColor="#2461BF" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#99C89D" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#99C89D" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                    <uc2:bottom ID="Bottom1" runat="server" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
