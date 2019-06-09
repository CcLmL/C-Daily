<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditCategory.aspx.cs" Inherits="Manager_EditCategory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CategoryID"
            DataSourceID="SqlDataSource1" Height="270px" Width="688px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="CategoryName" HeaderText="论坛类别名称" SortExpression="CategoryName" />
                <asp:BoundField DataField="CategoryDes" HeaderText="类别描述" SortExpression="CategoryDes" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BBSConnectionString %>"
            DeleteCommand="DELETE FROM [BBSCategory] WHERE [CategoryID] = @CategoryID" InsertCommand="INSERT INTO [BBSCategory] ([CategoryName], [CategoryDes]) VALUES (@CategoryName, @CategoryDes)"
            SelectCommand="SELECT [CategoryName], [CategoryID], [CategoryDes] FROM [BBSCategory]"
            UpdateCommand="UPDATE [BBSCategory] SET [CategoryName] = @CategoryName, [CategoryDes] = @CategoryDes WHERE [CategoryID] = @CategoryID">
            <DeleteParameters>
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="CategoryDes" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="CategoryDes" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
