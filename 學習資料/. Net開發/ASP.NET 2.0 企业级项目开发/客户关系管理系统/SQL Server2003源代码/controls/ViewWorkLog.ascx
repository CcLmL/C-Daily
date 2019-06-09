<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewWorkLog.ascx.cs" Inherits="controls_ViewWorkLog" %>
<table style="width: 686px">
    <tr>
        <td style="width: 122px">
            姓名</td>
        <td>
            <asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
        <td>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="查询" /></td>
    </tr>
    <tr>
        <td style="width: 122px">
            日期</td>
        <td>
            <asp:TextBox ID="txtbegindate" runat="server"></asp:TextBox>－<asp:TextBox ID="txtenddate"
                runat="server"></asp:TextBox></td>
        <td>
            <asp:Button ID="Button2" runat="server" Text="查询" OnClick="Button2_Click" /></td>
    </tr>
    <tr>
        <td style="width: 122px">
            部门</td>
        <td>
            <asp:DropDownList ID="ddldepart" runat="server" DataSourceID="SqlDataSource1"
                DataTextField="DepartName" DataValueField="DepartName" Width="157px">
            </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
                SelectCommand="SELECT [DepartName] FROM [Department]"></asp:SqlDataSource>
        </td>
        <td>
            <asp:Button ID="Button3" runat="server" Text="查询" OnClick="Button3_Click" /></td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LogID"
                DataSourceID="SqlDataSource2" Width="625px">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="姓名" SortExpression="EmployeeName" />
                    <asp:BoundField DataField="DepartName" HeaderText="部门" SortExpression="DepartName" />
                    <asp:BoundField DataField="LogTitle" HeaderText="主题" SortExpression="LogTitle" />
                    <asp:BoundField DataField="LogDate" DataFormatString="{0:d}" HeaderText="日期" HtmlEncode="False"
                        SortExpression="LogDate" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
                SelectCommand="SELECT WorkLog.LogTitle, WorkLog.LogContent, WorkLog.LogDate, WorkLog.LogID, WorkLog.EmployeeID, Department.DepartName, EmployeeInfo.EmployeeName FROM WorkLog INNER JOIN EmployeeInfo ON WorkLog.EmployeeID = EmployeeInfo.EmployeeID INNER JOIN Department ON EmployeeInfo.DepartID = Department.DepartID">
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource3"
    Height="50px" Width="683px">
    <Fields>
        <asp:BoundField DataField="LogContent" HeaderText="日志内容" SortExpression="LogContent" />
    </Fields>
</asp:DetailsView>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
    SelectCommand="SELECT [LogContent] FROM [WorkLog] WHERE ([LogID] = @LogID)">
    <SelectParameters>
        <asp:ControlParameter ControlID="GridView1" Name="LogID" PropertyName="SelectedValue"
            Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
