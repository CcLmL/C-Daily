<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userManage.aspx.cs" Inherits="userManage" %>

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
            border-top: #669900 1px solid; border-left: #669900 1px solid; width: 696px;
            border-bottom: #669900 1px solid; background-color: #ffffff">
            <tr>
                <td>
                    <uc1:header ID="Header1" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                    &nbsp;<span style="color: #cc0000">当前位置：系统设置&gt;管理员设置</span></td>
            </tr>
            <tr>
                <td>
                    &nbsp;<img src="Images/guanliyuanshezhi.GIF" width="815" /></td>
            </tr>
            <tr>
                <td style="text-align: right">
                    &nbsp;<span style="color: #0000ff; text-decoration: underline"><a href="#" onclick="window.open('addUser.aspx','','width=292,height=176');"  >添加管理员</a></td>
            </tr>
            <tr>
                <td>
                    &nbsp;<asp:GridView ID="gvAdmSet" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                        Width="815px" OnRowDeleting="gvAdmSet_RowDeleting">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="userName" HeaderText="管理员名称" />
                            <asp:CheckBoxField DataField="systemSet" HeaderText="系统设置" ReadOnly="True" />
                            <asp:CheckBoxField DataField="readerManage" HeaderText="读者管理" />
                            <asp:CheckBoxField DataField="bookManage" HeaderText="图书管理" />
                            <asp:CheckBoxField DataField="bookBorrow" HeaderText="图书借还" />
                            <asp:CheckBoxField DataField="systemSearch" HeaderText="系统查询" />
                            <asp:TemplateField HeaderText="权限设置">
                                <ItemTemplate>
                               <a href="#" onclick="window.open('admSet.aspx?userName=<%#Eval("userName")%>','','width=292,height=176');" >
                                   权限设置</a>                                
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowDeleteButton="True" HeaderText="删除" />
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
                <td>
                    &nbsp;<uc2:bottom ID="Bottom1" runat="server" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
