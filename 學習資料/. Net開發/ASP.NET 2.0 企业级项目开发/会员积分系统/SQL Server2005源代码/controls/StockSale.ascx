<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StockSale.ascx.cs" Inherits="controls_StockSale" %>
<table style="width: 599px">
    <tr>
        <td style="width: 112px">
            <asp:Label ID="Label1" runat="server" Text="请选择操作类型" Width="211px"></asp:Label></td>
        <td style="width: 311px">
            <asp:DropDownList ID="ddltype" runat="server">
                <asp:ListItem Selected="True" Value="0">销售</asp:ListItem>
                <asp:ListItem Value="1">退货</asp:ListItem>
            </asp:DropDownList></td>
    </tr>
    <tr>
        <td style="width: 112px">
            <asp:Label ID="Label2" runat="server" Text="请输入商品编码" Width="207px"></asp:Label></td>
        <td style="width: 311px">
            <asp:TextBox ID="txtstockid" runat="server" Width="99px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="商商品编码只能是数字" ControlToValidate="txtstockid" ValidationExpression="^-?\d+$"></asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td style="width: 112px; height: 44px;">
            <asp:Label ID="Label3" runat="server" Text="请输入商品数量" Width="208px"></asp:Label></td>
        <td style="width: 311px; height: 44px;">
            <asp:TextBox ID="txtcount" runat="server" Width="99px">1</asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="数量只能为数字" ControlToValidate="txtcount" ValidationExpression="^-?\d+$"></asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td style="width: 112px">
            <asp:Button ID="Button1" runat="server" Text="添加" Width="71px" OnClick="Button1_Click" /></td>
        <td style="width: 311px">
        </td>
    </tr>

    <tr>
        <td colspan="2">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" Width="453px">
                <Columns>
                    <asp:BoundField DataField="StockName" HeaderText="商品名称" SortExpression="StockName" />
                    <asp:BoundField DataField="StockPrice" DataFormatString="{0:C}" HeaderText="价格" SortExpression="StockPrice" />
                    <asp:BoundField DataField="StockCount" HeaderText="数量" SortExpression="StockCount" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetStockByID"
                TypeName="StockDA">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtstockid" DefaultValue="0" Name="stockid" PropertyName="Text"
                        Type="String" />
                    <asp:ControlParameter ControlID="txtcount" DefaultValue="1" Name="count" PropertyName="Text"
                        Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            &nbsp; &nbsp;
        </td>
    </tr>
        <tr>
        <td style="width: 112px">
            <asp:Button ID="Button2" runat="server" Text="确定" Width="78px" OnClick="Button2_Click" /></td>
        <td style="width: 311px">
            <asp:Label ID="Label4" runat="server" Width="138px"></asp:Label></td>
    </tr>
</table>
