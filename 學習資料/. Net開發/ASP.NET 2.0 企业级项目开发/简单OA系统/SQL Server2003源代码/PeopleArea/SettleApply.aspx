<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SettleApply.aspx.cs" Inherits="PeopleArea_SettleApply" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<table style="width: 691px">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="申报的空缺职位列表" Width="281px"></asp:Label></td>
        </tr>
        <tr>
            <td style="height: 178px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                    Width="683px" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="InviteID" OnRowUpdated="GridView1_RowUpdated">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="DepartName" HeaderText="申请部门" SortExpression="DepartName" />
                        <asp:BoundField DataField="OpeningJob" HeaderText="空缺职位" SortExpression="OpeningJob" />
                        <asp:BoundField DataField="PeopleAmount" HeaderText="人数" SortExpression="PeopleAmount" />
                        <asp:BoundField DataField="Require" HeaderText="要求" SortExpression="Require" />
                        <asp:BoundField DataField="Note" HeaderText="备注" SortExpression="Note" />
                        <asp:CheckBoxField DataField="Finished" HeaderText="是否完成" SortExpression="Finished" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SimpleOAConnectionString %>"
                    DeleteCommand="DELETE FROM [Invite] WHERE [InviteID] = @InviteID" InsertCommand="INSERT INTO [Invite] ([DepartID], [OpeningJob], [PeopleAmount], [Require], [Finished], [Note]) VALUES (@DepartID, @OpeningJob, @PeopleAmount, @Require, @Finished, @Note)"
                    SelectCommand="SELECT Invite.InviteID, Invite.DepartID, Invite.OpeningJob, Invite.PeopleAmount, Invite.Require, Invite.Finished, Invite.Note, Department.DepartName FROM Invite INNER JOIN Department ON Invite.DepartID = Department.DepartID"
                    UpdateCommand="UPDATE Invite SET DepartID = (SELECT departid FROM department WHERE departname= @DepartName), OpeningJob = @OpeningJob, PeopleAmount = @PeopleAmount, Require = @Require, Finished = @Finished, Note = @Note FROM Invite ">
                    <DeleteParameters>
                        <asp:Parameter Name="InviteID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DepartName" />
                        <asp:Parameter Name="OpeningJob" Type="String" />
                        <asp:Parameter Name="PeopleAmount" Type="Int32" />
                        <asp:Parameter Name="Require" Type="String" />
                        <asp:Parameter Name="Finished" Type="Boolean" />
                        <asp:Parameter Name="Note" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="DepartID" Type="Int32" />
                        <asp:Parameter Name="OpeningJob" Type="String" />
                        <asp:Parameter Name="PeopleAmount" Type="Int32" />
                        <asp:Parameter Name="Require" Type="String" />
                        <asp:Parameter Name="Finished" Type="Boolean" />
                        <asp:Parameter Name="Note" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

