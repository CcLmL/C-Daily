<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 599px">
            <tr>
                <td colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                        ShowHeader="False" Width="588px" DataKeyNames="ItemID">
                        <Columns>
                            <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" SortExpression="ItemID" />
                            <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VoteConnectionString %>"
                        SelectCommand="SELECT [ItemName], [ItemID] FROM [VoteItem]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="我要投票" Width="209px" /></td>
                <td>
                    <asp:Button ID="Button2" runat="server" Text="查看投票" Width="200px" OnClick="Button2_Click" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server"></asp:Label></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
