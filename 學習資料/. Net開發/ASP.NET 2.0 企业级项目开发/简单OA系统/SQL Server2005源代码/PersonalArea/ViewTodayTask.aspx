<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewTodayTask.aspx.cs" Inherits="PersonalArea_ViewTodayTask" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 471px">
        <tr>
            <td>
                您今天的任务有：</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CalendarID"
                    DataSourceID="SqlDataSource1" Width="460px">
                    <Columns>
                        <asp:BoundField DataField="CalendarTitle" HeaderText="日程主题" SortExpression="CalendarTitle" />
                        <asp:BoundField DataField="CalendarContent" HeaderText="日程内容" SortExpression="CalendarContent" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SimpleOAConnectionString %>"
                    SelectCommand="SELECT * FROM [Calendar] WHERE ([EmployeeName] = @EmployeeName) AND (datediff (day,[CalendarDate],getdate())=0)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="HiddenField1" Name="EmployeeName" PropertyName="Value"
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:HiddenField ID="HiddenField1" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>

