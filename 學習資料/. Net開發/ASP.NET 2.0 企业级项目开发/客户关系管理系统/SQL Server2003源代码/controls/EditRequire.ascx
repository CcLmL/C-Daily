<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditRequire.ascx.cs" Inherits="controls_EditRequire" %>
<table style="width: 733px">
    <tr>
        <td>
            需求列表</td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RequirementID"
                DataSourceID="SqlDataSource1" Width="628px">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="UserName" HeaderText="客户" SortExpression="UserName" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="负责人" SortExpression="EmployeeName" />
                    <asp:BoundField DataField="RequirementContent" HeaderText="需求内容" SortExpression="RequirementContent" />
                    <asp:BoundField DataField="HandleContent" HeaderText="处理意见" SortExpression="HandleContent" />
                    <asp:BoundField DataField="RequirementDate" DataFormatString="{0:d}" HeaderText="新需求日期"
                        HtmlEncode="False" SortExpression="RequirementDate" />
                    <asp:BoundField DataField="HandleDate" DataFormatString="{0:d}" HeaderText="处理日期"
                        HtmlEncode="False" SortExpression="HandleDate" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
                SelectCommand="SELECT Requirement.RequirementID, Requirement.EmployeeID, Requirement.UserID, Requirement.RequirementContent, Requirement.HandleContent, Requirement.RequirementDate, Requirement.HandleDate, EmployeeInfo.EmployeeName, UserInfo.UserName FROM Requirement INNER JOIN EmployeeInfo ON Requirement.EmployeeID = EmployeeInfo.EmployeeID INNER JOIN UserInfo ON Requirement.UserID = UserInfo.UserID">
            </asp:SqlDataSource>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="RequirementID"
                DataSourceID="SqlDataSource2" Height="50px" Width="539px">
                <Fields>
                    <asp:BoundField DataField="RequirementContent" HeaderText="需求内容" ReadOnly="True"
                        SortExpression="RequirementContent" />
                    <asp:BoundField DataField="HandleContent" HeaderText="处理意见" SortExpression="HandleContent" />
                    <asp:CommandField ShowEditButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
                DeleteCommand="DELETE FROM [Requirement] WHERE [RequirementID] = @RequirementID"
                InsertCommand="INSERT INTO [Requirement] ([RequirementContent], [HandleContent]) VALUES (@RequirementContent, @HandleContent)"
                SelectCommand="SELECT RequirementID, RequirementContent, HandleContent, HandleDate FROM Requirement"
                UpdateCommand="SP_UPDATEREQUIRE" UpdateCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="RequirementID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="HandleContent" Type="String" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="RequirementContent" Type="String" />
                    <asp:Parameter Name="HandleContent" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
