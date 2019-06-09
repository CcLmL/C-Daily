<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Bargain.ascx.cs" Inherits="controls_Bargain" %>
<table style="width: 781px">
    <tr>
        <td style="width: 157px">
            客户</td>
        <td>
            <asp:TextBox ID="txtusername" runat="server"></asp:TextBox></td>
        <td style="width: 152px">
            签订人</td>
        <td style="width: 238px">
            <asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 157px">
            备注</td>
        <td>
            <asp:TextBox ID="txtnote" runat="server"></asp:TextBox></td>
        <td style="width: 152px">
        </td>
        <td style="width: 238px">
        </td>
    </tr>
    <tr>
        <td style="width: 157px">
            开始日期</td>
        <td>
            <asp:Calendar ID="Calendar1" runat="server">
            </asp:Calendar>
        </td>
        <td style="width: 152px">
            结束日期</td>
        <td style="width: 238px">
            <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
        </td>
    </tr>
    <tr>
        <td style="width: 157px; height: 26px">
        </td>
        <td style="height: 26px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="存档" Width="70px" /></td>
        <td style="width: 152px; height: 26px">
            <asp:Label ID="Label1" runat="server"></asp:Label></td>
        <td style="width: 238px; height: 26px">
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                OnRowDataBound="GridView1_RowDataBound" Width="711px">
                <Columns>
                    <asp:BoundField DataField="UserName" HeaderText="客户" SortExpression="UserName" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="签订人" SortExpression="EmployeeName" />
                    <asp:BoundField DataField="BargainBeginDate" DataFormatString="{0:d}" HeaderText="开始日期"
                        HtmlEncode="False" SortExpression="BargainBeginDate" />
                    <asp:BoundField DataField="BargainEndDate" DataFormatString="{0:d}" HeaderText="结束日期"
                        HtmlEncode="False" SortExpression="BargainEndDate" />
                    <asp:BoundField DataField="BargainNote" HeaderText="备注" SortExpression="BargainNote" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
                SelectCommand="SELECT Bargain.BargainID, Bargain.EmployeeID, Bargain.UserID, Bargain.BargainBeginDate, Bargain.BargainEndDate, Bargain.BargainNote, EmployeeInfo.EmployeeName, UserInfo.UserName FROM Bargain INNER JOIN EmployeeInfo ON Bargain.EmployeeID = EmployeeInfo.EmployeeID INNER JOIN UserInfo ON Bargain.UserID = UserInfo.UserID">
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
