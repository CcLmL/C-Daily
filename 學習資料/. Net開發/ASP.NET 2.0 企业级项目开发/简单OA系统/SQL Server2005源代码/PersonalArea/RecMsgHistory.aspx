<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RecMsgHistory.aspx.cs" Inherits="PersonalArea_RecMsgHistory" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 400px">
        <tr>
            <td>
                所有接收到的信息</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataKeyNames="MsgID" DataSourceID="SqlDataSource1" Width="524px">
                    <Columns>
                        <asp:BoundField DataField="Send" HeaderText="发件人" SortExpression="Send" />
                        <asp:BoundField DataField="MsgTitle" HeaderText="主题" SortExpression="MsgTitle" />
                        <asp:BoundField DataField="MsgContent" HeaderText="内容" SortExpression="MsgContent" />
                        <asp:CheckBoxField DataField="IsRead" HeaderText="是否阅读" SortExpression="IsRead" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SimpleOAConnectionString %>"
                    SelectCommand="SELECT * FROM [Message] WHERE ([Receive] = @Receive)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="HiddenField1" Name="Receive" PropertyName="Value"
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:HiddenField ID="HiddenField1" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>

