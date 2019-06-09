<%@ Page Language="C#" AutoEventWireup="true" CodeFile="readerInfo.aspx.cs" Inherits="readerInfo" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>
<%@ Register Src="bottom.ascx" TagName="bottom" TagPrefix="uc2" %>

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
                    <uc1:header ID="Header1" runat="server" />
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: left">
                    &nbsp;<span style="color: #cc0000">当前位置：读者管理&gt;读者档案管理</span></td>
            </tr>
            <tr>
                <td>
                    &nbsp;<img src="Images/duzhedangan.GIF" width="815" /></td>
            </tr>
            <tr>
                <td align="right" valign="top">
                <a href="#" onclick="window.open('addReaderInfo.aspx?readerBarCode=add','','width=340,height=371');">添加读者信息</a>
                
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <asp:GridView ID="gvReaderInfo"　ForeColor="#333333" runat="server" AutoGenerateColumns="False" Width="818px" AllowPaging="True" OnRowDeleting="gvReaderInfo_RowDeleting">
                        <Columns>
                            <asp:BoundField HeaderText="读者姓名" DataField="readerName" />
                            <asp:BoundField HeaderText="读者性别" DataField="sex" />
                            <asp:BoundField HeaderText="读者类型" DataField="type" />
                            <asp:BoundField HeaderText="证件类型" DataField="certificateType" />
                            <asp:BoundField HeaderText="证件号码" DataField="certificate" />
                            <asp:BoundField HeaderText="联系电话" DataField="tel" />
                            <asp:BoundField DataField="email" HeaderText="E-mail" />
                            <asp:BoundField HeaderText="备注" DataField="remark" />
                            <asp:TemplateField HeaderText="修改">
                                <ItemTemplate>
                                   <a href="#"  onclick="window.open('addReaderInfo.aspx?readerBarCode=<%#Eval("readerBarCode") %>','','width=340,height=371')">修改</a>
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
