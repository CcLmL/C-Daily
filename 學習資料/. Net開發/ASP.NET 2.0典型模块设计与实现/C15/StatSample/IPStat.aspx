<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IPStat.aspx.cs" Inherits="IPStat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <table style="width: 698px">
            <tr>
                <td>
                    IP访问总量</td>
                <td>
                    <asp:TextBox ID="iptotal" runat="server"></asp:TextBox></td>
                <td>
                    今日IP访问量</td>
                <td>
                    <asp:TextBox ID="iptoday" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    本月IP访问量</td>
                <td>
                    <asp:TextBox ID="ipmonth" runat="server"></asp:TextBox></td>
                <td>
                    昨日IP访问量</td>
                <td>
                    <asp:TextBox ID="ipyesterday" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="4" style="height: 21px">
                    今日最近10条访问记录</td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" Width="641px" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="IP_Address" HeaderText="IP地址" SortExpression="IP_Address" />
                            <asp:BoundField DataField="IP_Src" HeaderText="IP来源" SortExpression="IP_Src" />
                            <asp:BoundField DataField="IP_DateTime" HeaderText="IP访问日期" SortExpression="IP_DateTime" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StatConnectionString %>"
                        SelectCommand="SELECT top 10 [IP_ID], [IP_Address], [IP_DateTime], [IP_Src] FROM [IPStat] ORDER BY [IP_DateTime] DESC">
                    </asp:SqlDataSource>
                    &nbsp; &nbsp;
                </td>
            </tr>
        </table>
    </div>
        <table style="width: 539px">
            <tr>
                <td style="width: 163px; height: 21px">
                    目前本网页的访问量</td>
                <td style="height: 21px">
                    <asp:Literal ID="Literal1" runat="server" Mode="PassThrough"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 163px">
                    目前在线人数</td>
                <td>
                    <asp:Literal ID="Literal2" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 163px">
                </td>
                <td>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
