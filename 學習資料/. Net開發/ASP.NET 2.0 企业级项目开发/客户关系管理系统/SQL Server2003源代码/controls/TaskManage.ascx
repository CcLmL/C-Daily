<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TaskManage.ascx.cs" Inherits="controls_TaskManage" %>
<asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View1" runat="server">
        <table style="width: 737px">
            <tr>
                <td>
                    姓名</td>
                <td>
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
                <td>
                    客户名称</td>
                <td>
                    <asp:TextBox ID="txtusername" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    主题 &nbsp;</td>
                <td colspan="3">
                    <asp:TextBox ID="txttitle" runat="server" Width="439px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    开始日期</td>
                <td>
                    <asp:Calendar ID="Calendar1" runat="server" Width="153px"></asp:Calendar>
                </td>
                <td>
                    结束日期</td>
                <td>
                    <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="登记计划" /></td>
                <td>
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Width="193px"></asp:Label></td>
                <td>
                </td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="View2" runat="server">
        <table style="width: 744px">
            <tr>
                <td style="height: 12px">
                    姓名</td>
                <td style="height: 12px">
                    <asp:TextBox ID="txtname1" runat="server"></asp:TextBox></td>
                <td style="width: 11px; height: 12px">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="查询" Width="64px" /></td>
            </tr>
            <tr>
                <td style="height: 21px">
                    日期</td>
                <td style="height: 21px">
                    <asp:TextBox ID="txtbegindate1" runat="server"></asp:TextBox>
                    －<asp:TextBox ID="txtenddate1" runat="server"></asp:TextBox></td>
                <td style="width: 11px; height: 21px">
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="查询" Width="66px" /></td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                        Width="638px">
                        <Columns>
                            <asp:BoundField DataField="EmployeeName" HeaderText="姓名" SortExpression="EmployeeName" />
                            <asp:BoundField DataField="TaskTitle" HeaderText="主题" SortExpression="TaskTitle" />
                            <asp:BoundField DataField="UserName" HeaderText="客户" SortExpression="UserName" />
                            <asp:BoundField DataField="TaskBeginDate" DataFormatString="{0:d}" HeaderText="开始日期"
                                HtmlEncode="False" SortExpression="TaskBeginDate" />
                            <asp:BoundField DataField="TaskEndDate" DataFormatString="{0:d}" HeaderText="结束日期"
                                HtmlEncode="False" SortExpression="TaskEndDate" />
                            <asp:BoundField DataField="TaskNote" HeaderText="备注" SortExpression="TaskNote" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
                        SelectCommand="SELECT Task.TaskID, Task.EmployeeID, Task.UserID, Task.TaskTitle, Task.TaskBeginDate, Task.TaskEndDate, Task.TaskNote, EmployeeInfo.EmployeeName, UserInfo.UserName FROM Task INNER JOIN EmployeeInfo ON Task.EmployeeID = EmployeeInfo.EmployeeID INNER JOIN UserInfo ON Task.UserID = UserInfo.UserID">
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </asp:View>
</asp:MultiView>&nbsp;
