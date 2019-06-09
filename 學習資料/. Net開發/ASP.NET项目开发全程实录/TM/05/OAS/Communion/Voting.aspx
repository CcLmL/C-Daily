<%@ Page Language="c#" AutoEventWireup="true" CodeFile="Voting.aspx.cs" Inherits="communion_vote" %>

<!doctype html public "-//w3c//dtd xhtml 1.0 transitional//en" "http://www.w3.org/tr/xhtml1/dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            <table style="width: 520px; height: 191px" class="css" align="center" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 663px; height: 32px" align="center">
                        活动投票</td>
                </tr>
                <tr>
                    <td style="width: 663px; height: 133px">
                        <asp:DataList ID="DataList1" runat="server" BackColor="White" Width="590px" OnItemCommand="DataList1_ItemCommand" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                            <ItemTemplate>
                                <table border="0" style="width: 595px; height: 60px" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="width: 97px; height: 5px">
                                            活动：</td>
                                        <td style="width: 413px; height: 5px" align="center">
                                            <%# DataBinder.Eval(Container.DataItem,"votetitle") %>
                                        </td>
                                        <td style="height: 5px">
                                            <asp:LinkButton ID="linkbutton1" runat="server" CommandName="select">投　票</asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 97px">
                                            活动描述：</td>
                                        <td colspan="2">
                                            <%#DataBinder.Eval(Container.DataItem, "votecontent")%>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <FooterStyle BackColor="White" ForeColor="#333333" />
                            <SelectedItemStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                            <ItemStyle BackColor="White" ForeColor="#333333" />
                            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        </asp:DataList></td>
                </tr>
                <tr>
                    <td style="width: 663px">
                        &nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
