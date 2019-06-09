<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SendMsgHistory.aspx.cs" Inherits="PersonalArea_SendMsgHistory" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 546px">
        <tr>
            <td>
                您所发送的信息列表：</td>
        </tr>
        <tr>
            <td style="height: 154px">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataKeyNames="MsgID" DataSourceID="SqlDataSource1" Width="499px">
                    <Columns>
                        <asp:BoundField DataField="Receive" HeaderText="收件人" SortExpression="Receive" />
                        <asp:BoundField DataField="MsgTitle" HeaderText="主题" SortExpression="MsgTitle" />
                        <asp:BoundField DataField="MsgContent" HeaderText="内容" SortExpression="MsgContent" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SimpleOAConnectionString %>"
                    SelectCommand="SELECT * FROM [Message] WHERE ([Send] = @Send)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="HiddenField1" Name="Send" PropertyName="Value" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:HiddenField ID="HiddenField1" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>

