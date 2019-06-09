<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewLinkRecord.ascx.cs" Inherits="controls_ViewLinkRecord" %>
<table style="width: 552px">
    <tr>
        <td>
            姓名</td>
        <td style="width: 403px">
            <asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
        <td style="width: 60px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="查询" Width="48px" /></td>
    </tr>
    <tr>
        <td>
            日期</td>
        <td style="width: 403px">
            <asp:TextBox ID="txtbegindate" runat="server"></asp:TextBox>
            －<asp:TextBox ID="txtenddate" runat="server"></asp:TextBox></td>
        <td style="width: 60px">
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="查询" Width="46px" /></td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                Width="543px">
                <Columns>
                    <asp:BoundField DataField="EmployeeName" HeaderText="姓名" SortExpression="EmployeeName" />
                    <asp:BoundField DataField="UserName" HeaderText="客户名称" SortExpression="UserName" />
                    <asp:BoundField DataField="LinkDate" DataFormatString="{0:d}" HeaderText="联系日期" HtmlEncode="False"
                        SortExpression="LinkDate" />
                    <asp:BoundField DataField="LinkNote" HeaderText="备注" SortExpression="LinkNote" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
                SelectCommand="SELECT LinkRecord.LinkRecordID, LinkRecord.EmployeeID, LinkRecord.UserID, LinkRecord.LinkDate, LinkRecord.LinkNote, UserInfo.UserName, EmployeeInfo.EmployeeName FROM LinkRecord INNER JOIN EmployeeInfo ON LinkRecord.EmployeeID = EmployeeInfo.EmployeeID INNER JOIN UserInfo ON LinkRecord.UserID = UserInfo.UserID">
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
