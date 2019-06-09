<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AreaSet.ascx.cs" Inherits="controls_AreaSet" %>
<table style="width: 714px; height: 191px">
    <tr>
        <td style="width: 169px; height: 41px">
            <asp:Label ID="Label1" runat="server" Text="区域名称" Width="155px"></asp:Label></td>
        <td style="height: 41px">
            &nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                ErrorMessage="请填写区域名称" Width="254px"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 169px; height: 19px">
        </td>
        <td style="height: 19px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加" Width="76px" />
            <asp:Label ID="Label3" runat="server" Width="240px"></asp:Label></td>
    </tr>
    <tr>
        <td style="width: 169px; height: 94px">
            <asp:Label ID="Label2" runat="server" Text="区域列表" Width="151px"></asp:Label></td>
        <td style="height: 94px">
            &nbsp;
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Both">
                <ItemTemplate>
                    区域名称:
                    <asp:Label ID="AreaNameLabel" runat="server" Text='<%# Eval("AreaName") %>'></asp:Label><br />
                    <br />
                </ItemTemplate>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <ItemStyle ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            </asp:DataList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
                SelectCommand="SELECT [AreaName] FROM [Area]"></asp:SqlDataSource>
        </td>
    </tr>
</table>
&nbsp;
