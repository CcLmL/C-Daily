<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bookBorrow.aspx.cs" Inherits="bookBorrow" %>

<%@ Register Src="bottom.ascx" TagName="bottom" TagPrefix="uc2" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
        <table border="0" cellpadding="0" cellspacing="0" style="border-right: #669900 1px solid;
            border-top: #669900 1px solid; border-left: #669900 1px solid; border-bottom: #669900 1px solid;
            background-color: #ffffff" width="815">
            <tr>
                <td>
                    <uc1:header ID="Header1" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="height: 25px; text-align: left">
                    <span style="color: #990000">当前位置：图书借还&gt;图书借阅&nbsp;</span></td>
            </tr>
            <tr>
                <td style="text-align: left">
                    <img src="Images/tushujieyue.GIF" width="815" />&nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 806px;">
                        <tr>
                            <td colspan="1" style="text-align: center; width: 349px; height: 32px;">
                            </td>
                            <td colspan="6" style="text-align: left; height: 32px;">
                                读者条形码：<asp:TextBox ID="txtReaderBarCode" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtReaderBarCode"
                                    ErrorMessage="不能为空" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:Button ID="btnReaderSearch" runat="server" OnClick="btnReaderSearch_Click" Text="查找读者" /></td>
                            <td colspan="1" style="text-align: center; height: 32px;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 349px; height: 29px; text-align: center">
                            </td>
                            <td style="width: 106px; height: 29px; text-align: right">
                                姓名：</td>
                            <td style="width: 100px; height: 29px">
                                <asp:TextBox ID="txtReaderName" runat="server" Width="108px"></asp:TextBox></td>
                            <td style="width: 100px; height: 29px; text-align: center">
                                性别：</td>
                            <td style="width: 100px; height: 29px">
                                <asp:TextBox ID="txtReaderSex" runat="server" Width="112px"></asp:TextBox></td>
                            <td style="width: 100px; height: 29px; text-align: center">
                                读者类型：</td>
                            <td style="width: 49px; height: 29px">
                                <asp:TextBox ID="txtReaderType" runat="server" Width="106px"></asp:TextBox></td>
                            <td style="width: 100px; height: 29px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 349px; text-align: center; height: 33px;">
                            </td>
                            <td style="width: 106px; text-align: right; height: 33px;">
                                证件类型：</td>
                            <td style="width: 100px; height: 33px;">
                                <asp:TextBox ID="txtCertificateType" runat="server" Width="108px"></asp:TextBox></td>
                            <td style="width: 100px; text-align: center; height: 33px;">
                                证件号码：</td>
                            <td style="width: 100px; height: 33px;">
                                <asp:TextBox ID="txtCertificate" runat="server" Width="112px"></asp:TextBox></td>
                            <td style="width: 100px; text-align: center; height: 33px;">
                                可借数量：</td>
                            <td style="width: 49px; height: 33px;">
                                <asp:TextBox ID="txtNum" runat="server" Width="106px"></asp:TextBox></td>
                            <td style="width: 100px; height: 33px;">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 805px">
                        <tr>
                            <td style="width: 73px; height: 19px">
                            </td>
                            <td style="width: 116px; height: 19px;">
                                图书条形码：</td>
                            <td style="width: 176px; height: 19px;" colspan="3">
                                <asp:TextBox ID="txtBookBarCode" runat="server" Width="178px"></asp:TextBox></td>
                            <td style="width: 191px; height: 19px; text-align: left;">
                                <asp:Button ID="btnBookSearch" runat="server" Text="查找图书" OnClick="btnBookSearch_Click" /></td>
                            <td style="width: 100px; height: 19px">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;<asp:GridView ID="gvBookBorrow" runat="server" CellPadding="4"
                        ForeColor="#333333" GridLines="None" PageSize="5" Width="815px" AutoGenerateColumns="False" OnRowDataBound="gvBookBorrow_RowDataBound" OnSelectedIndexChanging="gvBookBorrow_SelectedIndexChanging">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="bookName" HeaderText="图书名称" />
                            <asp:BoundField DataField="bookType" HeaderText="图书类型" />
                            <asp:BoundField DataField="bookConcern" HeaderText="出版社" />
                            <asp:BoundField DataField="author" HeaderText="作者" />
                            <asp:BoundField DataField="price" HeaderText="图书定价" />
                            <asp:BoundField DataField="bookType" HeaderText="可借天数" />
                            <asp:CommandField HeaderText="借阅" SelectText="借阅" ShowSelectButton="True" />
                        </Columns>
                        <RowStyle BackColor="#EFF3FB" />
                        <EditRowStyle BackColor="#2461BF" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#99C89D" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;<uc2:bottom ID="Bottom1" runat="server" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
