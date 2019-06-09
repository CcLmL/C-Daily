<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bookType.aspx.cs" Inherits="bookType" %>

<%@ Register Src="bottom.ascx" TagName="bottom" TagPrefix="uc1" %>
<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="css.css" rel="stylesheet" type="text/css" />
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" style="border-right: #669900 1px solid;
            border-top: #669900 1px solid; border-left: #669900 1px solid; width: 696px;
            border-bottom: #669900 1px solid; background-color: #ffffff">
            <tr>
                <td style="height: 15px">
                    <uc2:header ID="Header1" runat="server" />
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: left; height: 14px;">
                    &nbsp;<span style="color: #cc0000">当前位置：图书管理&gt;图书类型设置</span></td>
            </tr>
            <tr>
                <td>
                    &nbsp;<img src="Images/tushuleixingshezhi.GIF" width="815" /></td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;<table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 100px; height: 15px; text-align: right;" align="right">
                            <a href="#" onclick="window.open('addBookType.aspx?bookTypeID=add','','width=300,height=180');">
                                添加图书类型信息</a>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                    <asp:GridView ID="gvBookType"　ForeColor="#333333" runat="server" AutoGenerateColumns="False" Width="590px" AllowPaging="True" OnRowDeleting="gvBookType_RowDeleting">
                        <Columns>
                            <asp:BoundField HeaderText="图书类型名称" DataField="typeName" />
                            <asp:BoundField DataField="borrowDay" HeaderText="可借天数" />
                            <asp:TemplateField HeaderText="修改">
                                <ItemTemplate>
                                   <a href="#" class="huise1" onclick="window.open('addBookType.aspx?bookTypeID=<%#Eval("typeID") %>','','width=300,height=180')">修改</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" >
                                <ControlStyle Font-Underline="False" />
                            </asp:CommandField>
                        </Columns>
                        <RowStyle BackColor="#EFF3FB" />
                        <EditRowStyle BackColor="#2461BF" />
                        <SelectedRowStyle BackColor="#D1DDF1"　 Font-Bold="True"  />
                        <PagerStyle BackColor="#99C89D"　ForeColor="White"  HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#99C89D" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White"　 />
                    </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                    <uc1:bottom ID="Bottom1" runat="server" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
