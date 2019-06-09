<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bookInfoSearch.aspx.cs" Inherits="bookSearch" %>

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
                <td style="text-align: left; height: 16px;">
                    &nbsp;<span style="color: #cc0000">当前位置：系统查询&gt;图书档案查询</span></td>
            </tr>
            <tr>
                <td style="height: 16px; text-align: left">
                    <img src="Images/danganchaxun.GIF" width="815" /></td>
            </tr>
            <tr>
                <td style="background-color: #99c89d">
                    &nbsp;选择查询条件：<asp:DropDownList ID="ddlCondition" runat="server" Width="81px" AutoPostBack="True" OnSelectedIndexChanged="ddlCondition_SelectedIndexChanged">
                        <asp:ListItem Value="bookBarCode">条形码</asp:ListItem>
                        <asp:ListItem Value="bookName">书名</asp:ListItem>
                        <asp:ListItem Value="bookType">图书类别</asp:ListItem>
                        <asp:ListItem Value="bookConcern">出版社</asp:ListItem>
                        <asp:ListItem Value="author">作者</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;&nbsp;<asp:DropDownList ID="ddlBookType" runat="server" Visible="False">
                    </asp:DropDownList>
                    &nbsp;<asp:TextBox ID="txtKey" runat="server"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtKey"
                        ErrorMessage="*"></asp:RequiredFieldValidator>&nbsp;
                    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="搜" Width="23px" /></td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="gvBookInfo" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        CellPadding="4" ForeColor="#333333" GridLines="None" Width="815px" OnRowDataBound="gvBookInfo_RowDataBound" OnPageIndexChanging="gvBookInfo_PageIndexChanging" PageSize="5">
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
                    <uc2:bottom ID="Bottom1" runat="server" />
                    &nbsp;
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
