<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditNotion.ascx.cs" Inherits="controls_EditNotionl" %>
<table style="width: 769px; height: 77px">
    <tr>
        <td>
            投诉列表：</td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="NotionID"
                DataSourceID="SqlDataSource1" Width="676px">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="UserName" HeaderText="客户" SortExpression="UserName" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="员工" SortExpression="EmployeeName" />
                    <asp:BoundField DataField="NotionContent" HeaderText="投诉内容" SortExpression="NotionContent" />
                    <asp:BoundField DataField="HandleContent" HeaderText="处理意见" SortExpression="HandleContent" />
                    <asp:BoundField DataField="NotionDate" DataFormatString="{0:d}" HeaderText="投诉日期"
                        HtmlEncode="False" SortExpression="NotionDate" />
                    <asp:BoundField DataField="HandleDate" DataFormatString="{0:d}" HeaderText="处理日期"
                        HtmlEncode="False" SortExpression="HandleDate" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
                SelectCommand="SELECT Notion.EmployeeID, Notion.UserID, Notion.NotionContent, Notion.HandleContent, Notion.NotionDate, Notion.HandleDate, Notion.NotionID, EmployeeInfo.EmployeeName, UserInfo.UserName FROM Notion INNER JOIN EmployeeInfo ON Notion.EmployeeID = EmployeeInfo.EmployeeID INNER JOIN UserInfo ON Notion.UserID = UserInfo.UserID">
            </asp:SqlDataSource>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="NotionID"
                DataSourceID="SqlDataSource2" Height="50px" Width="675px">
                <Fields>
                    <asp:BoundField DataField="NotionContent" HeaderText="投诉内容" ReadOnly="True" SortExpression="NotionContent" />
                    <asp:BoundField DataField="HandleContent" HeaderText="处理意见" SortExpression="HandleContent" />
                    <asp:CommandField ShowEditButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
                DeleteCommand="DELETE FROM [Notion] WHERE [NotionID] = @NotionID" InsertCommand="INSERT INTO [Notion] ([HandleContent], [NotionContent], [HandleDate]) VALUES (@HandleContent, @NotionContent, @HandleDate)"
                SelectCommand="SELECT [HandleContent], [NotionContent], [HandleDate], [NotionID] FROM [Notion] WHERE ([NotionID] = @NotionID)"
                UpdateCommand="UPDATE Notion SET HandleContent = @HandleContent,HandleDate = GETDATE() WHERE (NotionID = @NotionID)">
                <DeleteParameters>
                    <asp:Parameter Name="NotionID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="HandleContent" Type="String" />
                    <asp:Parameter Name="NotionID" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="NotionID" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="HandleContent" Type="String" />
                    <asp:Parameter Name="NotionContent" Type="String" />
                    <asp:Parameter Name="HandleDate" Type="DateTime" />
                </InsertParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
