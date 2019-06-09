<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ItemManager.aspx.cs" Inherits="Manager_ItemManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 442px">
            <tr>
                <td style="width: 371px; height: 20px">
                    添加投票主题</td>
            </tr>
            <tr>
                <td style="width: 371px; height: 68px">
                    &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                        DataTextField="TitleName" DataValueField="TitleID" Width="317px">
                    </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FullVoteConnectionString %>"
                        SelectCommand="SELECT [TitleID], [TitleName] FROM [VoteTitle]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 371px">
                    &nbsp;添加投票项目</td>
            </tr>
            <tr>
                <td style="width: 371px">
                    项目名称：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 371px; height: 26px">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加项目" Width="130px" />
                    <asp:Label ID="Label1" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 371px; height: 26px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemID"
                        DataSourceID="SqlDataSource2" Width="387px">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="ItemName" HeaderText="项目名称" SortExpression="ItemName" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FullVoteConnectionString %>"
                        SelectCommand="SELECT [ItemID], [TitleID], [ItemName], [ItemCount] FROM [VoteItem] WHERE ([TitleID] = @TitleID)" 
                        DeleteCommand="DELETE FROM [VoteItem] WHERE [ItemID] = @ItemID"
                         InsertCommand="INSERT INTO [VoteItem] ([TitleID], [ItemName], [ItemCount]) VALUES (@TitleID, @ItemName, @ItemCount)" 
                         UpdateCommand="UPDATE [VoteItem] SET [TitleID] = @TitleID, [ItemName] = @ItemName, [ItemCount] = 0 WHERE [ItemID] = @ItemID">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="TitleID" PropertyName="SelectedValue"
                                Type="Int32" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="ItemID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="TitleID" Type="Int32" />
                            <asp:Parameter Name="ItemName" Type="String" />
                            <asp:Parameter Name="ItemCount" Type="Int32" />
                            <asp:Parameter Name="ItemID" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="TitleID" Type="Int32" />
                            <asp:Parameter Name="ItemName" Type="String" />
                            <asp:Parameter Name="ItemCount" Type="Int32" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
