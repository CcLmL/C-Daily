<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GetHistory.ascx.cs" Inherits="controls_GetHistory" %>
<asp:Label ID="Label1" runat="server" Text="请输入会员卡号"></asp:Label>
<asp:TextBox ID="txtcardnum" runat="server"></asp:TextBox>
<asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" />
<asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True">
    <Columns>
        <asp:BoundField DataField="cardnum" HeaderText="会员卡号" />
        <asp:BoundField DataField="handledate" DataFormatString="{0:d}" HeaderText="积分日期"
            HtmlEncode="False" />
        <asp:BoundField DataField="operationtype" HeaderText="积分类型" />
        <asp:BoundField DataField="point" HeaderText="所获积分" />
    </Columns>
</asp:GridView>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetHistroy"
    TypeName="CardCountInfo">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtcardnum" DefaultValue="0" Name="cardnum" PropertyName="Text"
            Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
