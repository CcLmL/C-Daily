<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bookBorrowSearch.aspx.cs" Inherits="bookBorrowSearch" %>

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
                <td style="height: 15px">
                    <uc1:header ID="Header1" runat="server" />
                    </td>
            </tr>
            <tr>
                <td style="text-align: left; height: 16px;">
                    &nbsp;<span style="color: #cc0000">当前位置：系统查询&gt;图书借阅查询</span></td>
            </tr>
            <tr>
                <td style="height: 16px; text-align: left">
                    <img src="Images/tsjycx.GIF" width="815" /></td>
            </tr>
            <tr>
                <td style="background-color: #99c89d; height: 25px;">
                    &nbsp;选择查询条件：<asp:DropDownList ID="ddlCondition" runat="server" Width="92px" >
                        <asp:ListItem Value="bookBarCode">图书条形码</asp:ListItem>
                        <asp:ListItem Value="bookName">书名</asp:ListItem>
                        <asp:ListItem Value="readerBarCode">读者条形码</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;&nbsp;<asp:TextBox ID="txtKey" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtKey"
                        ErrorMessage="*"></asp:RequiredFieldValidator>&nbsp;
                    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="搜" Width="23px" />
                    &nbsp; &nbsp;
                </td>
            </tr>
            <tr>
                <td style="background-color: #99c89d; height: 20px;">
                    <asp:RadioButton ID="rdibtnSy" runat="server" Checked="True" GroupName="borrow"
                        Text="所有信息" />
                    <asp:RadioButton ID="rdibtn1" runat="server" GroupName="borrow" Text="已还信息" />
                    <asp:RadioButton ID="rdibtn0" runat="server" GroupName="borrow" Text="未还信息" /></td>
            </tr>
            <tr>
                <td style="height: 122px">
                    <asp:GridView ID="gvBookBorrow" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        CellPadding="4" ForeColor="#333333" GridLines="None" Width="815px" OnPageIndexChanging="gvBookBorrow_PageIndexChanging" PageSize="5">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="bookBarCode" HeaderText="图书条形码" />
                            <asp:BoundField DataField="bookName" HeaderText="图书名称" />
                            <asp:BoundField DataField="borrowTime" DataFormatString="{0:yy-MM-dd}" HeaderText="借阅日期"
                                HtmlEncode="False" />
                            <asp:BoundField DataField="returnTime" DataFormatString="{0:yy-MM-dd}" HeaderText="应还日期" />
                            <asp:BoundField DataField="readerBarCode" HeaderText="读者条形码" />
                            <asp:BoundField DataField="readerName" HeaderText="读者名称" />
                            <asp:CheckBoxField DataField="isReturn" HeaderText="是否归还" ReadOnly="True" />
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
