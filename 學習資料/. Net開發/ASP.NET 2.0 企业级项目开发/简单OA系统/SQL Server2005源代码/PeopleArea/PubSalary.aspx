<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PubSalary.aspx.cs" Inherits="PeopleArea_PubSalary" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 590px">
        <tr>
            <td>
                发放工资人员列表</td>
        </tr>
        <tr>
            <td style="height: 26px">
                如果没有出现表格，请单击按钮<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="刷新数据" /></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataKeyNames="SalaryID" DataSourceID="SqlDataSource1" Width="713px" OnRowUpdated="GridView1_RowUpdated">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="EmployeeName" HeaderText="员工" SortExpression="EmployeeName" />
                        <asp:BoundField DataField="YearSet" HeaderText="年份" SortExpression="YearSet" />
                        <asp:BoundField DataField="MonthSet" HeaderText="月份" SortExpression="MonthSet" />
                        <asp:BoundField DataField="EndSalary" HeaderText="实发工资" SortExpression="EndSalary" ReadOnly="True" />
                        <asp:BoundField DataField="GangWei" HeaderText="岗位" SortExpression="GangWei" />
                        <asp:BoundField DataField="CheBu" HeaderText="车补" SortExpression="CheBu" />
                        <asp:BoundField DataField="FanBu" HeaderText="饭补" SortExpression="FanBu" />
                        <asp:BoundField DataField="Tax" HeaderText="税率" SortExpression="Tax" />
                        <asp:BoundField DataField="Encourage" HeaderText="奖励" SortExpression="Encourage" />
                        <asp:BoundField DataField="Punish" HeaderText="惩罚" SortExpression="Punish" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SimpleOAConnectionString %>"
                    SelectCommand="SELECT * FROM [Salary] WHERE endsalary IS NULL" DeleteCommand="DELETE FROM [Salary] WHERE [SalaryID] = @SalaryID" InsertCommand="INSERT INTO [Salary] ([YearSet], [MonthSet], [EndSalary], [EmployeeName], [GangWei], [CheBu], [FanBu], [Tax], [Encourage], [Punish], [Note]) VALUES (@YearSet, @MonthSet, @EndSalary, @EmployeeName, @GangWei, @CheBu, @FanBu, @Tax, @Encourage, @Punish, @Note)" UpdateCommand="UPDATE [Salary] SET [YearSet] = @YearSet, [MonthSet] = @MonthSet, [EndSalary] = @EndSalary, [EmployeeName] = @EmployeeName, [GangWei] = @GangWei, [CheBu] = @CheBu, [FanBu] = @FanBu, [Tax] = @Tax, [Encourage] = @Encourage, [Punish] = @Punish, [Note] = @Note WHERE [SalaryID] = @SalaryID">
                    <DeleteParameters>
                        <asp:Parameter Name="SalaryID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="YearSet" Type="String" />
                        <asp:Parameter Name="MonthSet" Type="String" />
                        <asp:Parameter Name="EndSalary" Type="Decimal" />
                        <asp:Parameter Name="EmployeeName" Type="String" />
                        <asp:Parameter Name="GangWei" Type="Decimal" />
                        <asp:Parameter Name="CheBu" Type="Decimal" />
                        <asp:Parameter Name="FanBu" Type="Decimal" />
                        <asp:Parameter Name="Tax" Type="Double" />
                        <asp:Parameter Name="Encourage" Type="Decimal" />
                        <asp:Parameter Name="Punish" Type="Decimal" />
                        <asp:Parameter Name="Note" Type="String" />
                        <asp:Parameter Name="SalaryID" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="YearSet" Type="String" />
                        <asp:Parameter Name="MonthSet" Type="String" />
                        <asp:Parameter Name="EndSalary" Type="Decimal" />
                        <asp:Parameter Name="EmployeeName" Type="String" />
                        <asp:Parameter Name="GangWei" Type="Decimal" />
                        <asp:Parameter Name="CheBu" Type="Decimal" />
                        <asp:Parameter Name="FanBu" Type="Decimal" />
                        <asp:Parameter Name="Tax" Type="Double" />
                        <asp:Parameter Name="Encourage" Type="Decimal" />
                        <asp:Parameter Name="Punish" Type="Decimal" />
                        <asp:Parameter Name="Note" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="发放工资" Width="120px" OnClick="Button1_Click" /></td>
        </tr>
    </table>
</asp:Content>

