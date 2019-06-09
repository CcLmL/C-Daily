<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewVote.aspx.cs" Inherits="ViewVote" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;<table>
            <tr>
                <td style="width: 140px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                        Width="538px" >
                        <Columns>
                            <asp:BoundField DataField="ItemName" HeaderText="投票项目" SortExpression="ItemName" />
                            <asp:BoundField DataField="ItemCount" HeaderText="票数" SortExpression="ItemCount" />
                             <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" BackColor="Navy" Height="4px" ImageUrl="~/vote.bmp"
                                       Width='<%#FormatVoteImage(FormatVoteCount(DataBinder.Eval(Container.DataItem,"ItemCount").ToString()))%>' />
                                <%# FormatVoteCount(DataBinder.Eval(Container.DataItem, "ItemCount").ToString())%>%
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FullVoteConnectionString %>"
                        SelectCommand="SELECT [ItemName], [ItemID], [ItemCount], [TitleID] FROM [VoteItem] WHERE ([TitleID] = @TitleID)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="TitleID" QueryStringField="titleid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 140px">
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" Text="转到投票界面" Width="327px" OnClick="Button1_Click" /></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
