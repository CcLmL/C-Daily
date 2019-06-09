<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BaseNoticeList.aspx.cs" Inherits="BaseInfo_BaseNoticeList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center" class="css" style="width: 570px; height: 301px" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 390px; height: 34px" align="center">
                        企业公告</td>
                </tr>
                <tr>
                    <td style="width: 390px">
                        <asp:DataList ID="DataList1" runat="server" BackColor="white" BorderColor="White"
                            BorderStyle="none" BorderWidth="1px" CellPadding="2" GridLines="horizontal" OnDeleteCommand="DataList1_DeleteCommand" Width="536px">
                            <ItemTemplate>
                                <table border="0" class="css" style="width: 658px; height: 0px" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="width: 898px">
                                            标题：<%# DataBinder.Eval(Container.DataItem, "noticetitle")%></td>
                                        <td align="center" style="width: 266px">
                                            <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="删除公告" CommandName="delete"
                                                Height="21px" Width="61px" ImageUrl="~/images/delete.gif" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="height: 40px; vertical-align: top;">
                                            <%# DataBinder.Eval(Container.DataItem, "noticecontent")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 898px">
                                            时间：<%# DataBinder.Eval(Container.DataItem, "noticetime", "{0:yyyy-MM-dd}")%></td>
                                        <td style="width: 266px">
                                            发布人：<%# DataBinder.Eval(Container.DataItem, "noticeperson")%></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <AlternatingItemStyle BackColor="#F7F7F7" />
                            <ItemStyle BackColor="White" ForeColor="#4A3C8C" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                        </asp:DataList></td>
                </tr>
                <tr>
                    <td style="width: 390px">
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
