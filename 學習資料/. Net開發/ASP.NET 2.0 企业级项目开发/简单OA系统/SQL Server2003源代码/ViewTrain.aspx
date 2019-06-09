<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewTrain.aspx.cs" Inherits="PeopleArea_ViewTrain" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 578px">
        <tr>
            <td style="width: 212px">
                培训日期</td>
            <td style="width: 260px">
                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            </td>
            <td style="width: 3px">
                <asp:Button ID="Button1" runat="server" Text="查询" Width="53px" /></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                    Width="477px">
                    <Columns>
                        <asp:BoundField DataField="TrainTitle" HeaderText="培训主题" SortExpression="TrainTitle" />
                        <asp:BoundField DataField="TrainContent" HeaderText="培训内容" SortExpression="TrainContent" />
                        <asp:BoundField DataField="TrainDate" DataFormatString="{0:d}" HeaderText="培训日期"
                            HtmlEncode="False" SortExpression="TrainDate" />
                        <asp:BoundField DataField="TrainPeople" HeaderText="培训人员" SortExpression="TrainPeople" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SimpleOAConnectionString %>"
                    SelectCommand="SELECT * FROM [Train] WHERE ([TrainDate] = @TrainDate)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Calendar1" Name="TrainDate" PropertyName="SelectedDate"
                            Type="DateTime" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

