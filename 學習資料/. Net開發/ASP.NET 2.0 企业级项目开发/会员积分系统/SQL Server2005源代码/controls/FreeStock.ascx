<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FreeStock.ascx.cs" Inherits="controls_FreeStock" %>
<table style="width: 275px">
    <tr>
        <td style="width: 98px; height: 26px">
            <asp:Label ID="Label1" runat="server" Text="输入卡号" Width="152px"></asp:Label></td>
        <td style="height: 26px">
            <asp:TextBox ID="txtcardnum" runat="server"></asp:TextBox></td>
        <td style="width: 74px; height: 26px;">
            <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" /></td>
    </tr>
    <tr>
    <td style="width: 98px" >
        <asp:Label ID="Label3" runat="server" Text="您的积分是：" Width="151px"></asp:Label>
        </td>
        <td colspan="2"><asp:TextBox ID="txttotal" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RuleID" DataSourceID="SqlDataSource1" Width="377px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="StockID" HeaderText="商品编码" SortExpression="StockID" />
                    <asp:BoundField DataField="StockName" HeaderText="商品名称" SortExpression="StockName" />
                    <asp:BoundField DataField="CardCount" HeaderText="所需积分" SortExpression="CardCount" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MemberCardConnectionString %>"
               SelectCommand= "SELECT GiftRule.StockID, Stock.StockName, GiftRule.CardCount, GiftRule.RuleID FROM GiftRule INNER JOIN Stock ON GiftRule.StockID = Stock.StockID  WHERE (GiftRule .CardCount <= @CardCount)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txttotal" DefaultValue="0" Name="CardCount" PropertyName="Text"
                        Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
    <td style="width: 98px">
        <asp:Label ID="Label4" runat="server" Text="您选择的商品编码是" Width="230px"></asp:Label></td>
    <td  colspan="2">
        <asp:TextBox ID="txtstock" runat="server" Width="136px"></asp:TextBox></td>
    </tr>
        <tr>
    <td style="width: 98px">
        <asp:Label ID="Label5" runat="server" Text="您需要消费的积分是" Width="228px"></asp:Label></td>
    <td  colspan="2">
        <asp:TextBox ID="txtcount" runat="server" Width="132px"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 98px">
            <asp:Button ID="Button2" runat="server" Text="确定" OnClick="Button2_Click" /></td>
        <td>
            <asp:Label ID="Label2" runat="server" Width="151px"></asp:Label></td>
        <td style="width: 74px">
        </td>
    </tr>
</table>
