<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bookReturn.aspx.cs" Inherits="bookReturn" %>

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
    <div align="center" style="text-align: center">
        <table border="0" cellpadding="0" cellspacing="0" style="border-right: #669900 1px solid;
            border-top: #669900 1px solid; border-left: #669900 1px solid; border-bottom: #669900 1px solid;
            background-color: #ffffff" width="815">
            <tr>
                <td>
                    <uc1:header ID="Header2" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="height: 25px; text-align: left">
                    <span style="color: #990000">当前位置：图书借还&gt;图书归还</span></td>
            </tr>
            <tr style="color: #000000">
                <td style="text-align: left">
                    &nbsp;<img src="Images/tushuguihuan.GIF" width="815" /></td>
            </tr>
            <tr>
                <td>
                    &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 806px">
                        <tr>
                            <td colspan="1" style="text-align: center">
                            </td>
                            <td colspan="6" style="text-align: center">
                                读者条形码：<asp:TextBox ID="txtReaderBarCode" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtReaderBarCode"
                                    Display="Dynamic" ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                                <asp:Button ID="btnReaderSearch" runat="server" OnClick="btnReaderSearch_Click" Text="查  找" /></td>
                            <td colspan="1" style="text-align: center">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 106px; height: 19px; text-align: center">
                            </td>
                            <td style="width: 106px; height: 19px; text-align: center">
                                姓名：</td>
                            <td style="width: 100px; height: 19px">
                                <asp:TextBox ID="txtReaderName" runat="server" Width="108px"></asp:TextBox></td>
                            <td style="width: 100px; height: 19px; text-align: center">
                                性别：</td>
                            <td style="width: 100px; height: 19px">
                                <asp:TextBox ID="txtReaderSex" runat="server" Width="112px"></asp:TextBox></td>
                            <td style="width: 100px; height: 19px; text-align: center">
                                读者类型：</td>
                            <td style="width: 49px; height: 19px">
                                <asp:TextBox ID="txtReaderType" runat="server" Width="106px"></asp:TextBox></td>
                            <td style="width: 100px; height: 19px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 106px; text-align: center">
                            </td>
                            <td style="width: 106px; text-align: center">
                                证件类型：</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="txtCertificateType" runat="server" Width="108px"></asp:TextBox></td>
                            <td style="width: 100px; text-align: center">
                                证件号码：</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="txtCertificate" runat="server" Width="112px"></asp:TextBox></td>
                            <td style="width: 100px; text-align: center">
                                可借数量：</td>
                            <td style="width: 49px">
                                <asp:TextBox ID="txtNum" runat="server" Width="106px"></asp:TextBox></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 805px">
                        <tr>
                            <td style="width: 209px; height: 19px">
                            </td>
                            <td style="width: 116px; height: 19px">
                                图书条形码：</td>
                            <td colspan="3" style="width: 111px; height: 19px">
                                <asp:TextBox ID="txtBookBarCode" runat="server" Width="178px"></asp:TextBox></td>
                            <td style="width: 191px; height: 19px">
                                <asp:Button ID="btnBookSearch" runat="server" OnClick="btnBookSearch_Click" Text="查　找" /></td>
                            <td style="width: 100px; height: 19px">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;<asp:GridView ID="gvBookReturn" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" GridLines="None" OnSelectedIndexChanging="gvBookReturn_SelectedIndexChanging"
                        PageSize="5" Width="815px">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="bookBarCode" HeaderText="图书条形码" />
                            <asp:BoundField DataField="bookName" HeaderText="图书名称" />
                            <asp:BoundField DataField="borrowTime" DataFormatString="{0:yyy-MM-dd}" HeaderText="借阅时间"
                                HtmlEncode="False" />
                            <asp:BoundField DataField="returnTime" DataFormatString="{0:yyyy-MM-dd}" HeaderText="应还时间"
                                HtmlEncode="False" />
                            <asp:BoundField DataField="readerName" HeaderText="借阅人" />
                            <asp:CommandField HeaderText="归还" SelectText="归还" ShowSelectButton="True" />
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
