<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TitleManager.aspx.cs" Inherits="Manager_TitleManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 398px">
            <tr>
                <td colspan="2">
                    <strong>添加投票主题</strong></td>
            </tr>
            <tr>
                <td>
                    主题名称</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server"></asp:Label></td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加主题" Width="102px" />
                </td>
            </tr>
        </table>
    
    </div>
        <hr />
        &nbsp;
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TitleID" DataSourceID="SqlDataSource1" Width="401px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" CausesValidation="False" />
                <asp:BoundField DataField="TitleID" HeaderText="主题ID" InsertVisible="False" ReadOnly="True"
                    SortExpression="TitleID" />
                <asp:BoundField DataField="TitleName" HeaderText="主题名称" SortExpression="TitleName" />
                <asp:CheckBoxField DataField="IsCurrent" HeaderText="是否当前主题" SortExpression="IsCurrent" ReadOnly="True" InsertVisible="False" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FullVoteConnectionString %>"
            DeleteCommand="DELETE FROM [VoteTitle] WHERE [TitleID] = @TitleID" InsertCommand="INSERT INTO [VoteTitle] ([TitleName], [IsCurrent]) VALUES (@TitleName, @IsCurrent)"
            SelectCommand="SELECT [TitleID], [TitleName], [IsCurrent] FROM [VoteTitle]" UpdateCommand="UPDATE VoteTitle SET TitleName = @TitleName WHERE (TitleID = @TitleID)">
            <DeleteParameters>
                <asp:Parameter Name="TitleID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="TitleName" Type="String" />
                <asp:Parameter Name="TitleID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="TitleName" Type="String" />
                <asp:Parameter Name="IsCurrent" Type="Boolean" />
            </InsertParameters>
        </asp:SqlDataSource>
        <hr />
        <table style="width: 479px">
            <tr>
                <td>
                    设置当前主题</td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2"
                        DataTextField="TitleName" DataValueField="TitleID" Width="295px">
                    </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FullVoteConnectionString %>"
                        SelectCommand="SELECT [TitleName], [TitleID] FROM [VoteTitle]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" OnClick="Button2_Click"
                        Text="设置" Width="168px" />
                    <asp:Label ID="Label2" runat="server"></asp:Label></td>
            </tr>
        </table>
    </form>
</body>
</html>
