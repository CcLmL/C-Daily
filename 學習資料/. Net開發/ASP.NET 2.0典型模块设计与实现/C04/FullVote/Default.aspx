<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 385px">
            <tr>
                <td style="height: 21px">
                    当前投票主题<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2"
                        DataTextField="TitleName" DataValueField="TitleID" Width="254px">
                    </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FullVoteConnectionString %>"
                        SelectCommand="SELECT [TitleName], [TitleID] FROM [VoteTitle] WHERE ([IsCurrent] = @IsCurrent)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="true" Name="IsCurrent" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                        Width="348px">
                        <Columns>
                            <asp:BoundField DataField="ItemID" HeaderText="项目ID" InsertVisible="False" ReadOnly="True"
                                SortExpression="ItemID" />
                            <asp:BoundField DataField="ItemName" HeaderText="项目名称" SortExpression="ItemName" />
                            <asp:BoundField DataField="ItemCount" HeaderText="票数" SortExpression="ItemCount" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FullVoteConnectionString %>"
                        SelectCommand="SELECT [ItemName], [ItemCount], [ItemID], [TitleID] FROM [VoteItem] WHERE ([TitleID] = @TitleID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="TitleID" PropertyName="SelectedValue"
                                Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="我要投票" Width="137px" />
                    <asp:Label ID="Label1" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="显示投票结果" Width="133px" /></td>
            </tr>
        </table>
    
    </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Manager/WebManager.aspx">后台管理</asp:HyperLink>
    </form>
</body>
</html>
