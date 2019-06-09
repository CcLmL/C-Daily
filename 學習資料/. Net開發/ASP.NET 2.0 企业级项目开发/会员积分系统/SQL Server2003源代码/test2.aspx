<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test2.aspx.cs" Inherits="test2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <table><tr><td>
     <table id="tb2" runat="server"> 
        <tr><td style="width: 300px; height: 76px"> <asp:textbox id="TextBox1" runat="server"></asp:textbox></td></tr>
        </table>
    </td></tr>
    <tr><td>   <table id="tb1" runat="server" style="width: 416px">
    <tr>
        <td style="height: 186px">
       <asp:button id="Button1" runat="server" text="Button" Width="99px" /><br />
            <asp:Label ID="Label2" runat="server" Text="Label" Width="154px"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="StockID"
                DataSourceID="SqlDataSource3" OnPageIndexChanging="GridView1_PageIndexChanging"
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="StockCount" DataFormatString="{0:#,###}" HeaderText="StockCount"
                        HtmlEncode="False" SortExpression="StockCount" />
                    <asp:BoundField DataField="StockPrice" DataFormatString="{0:C}" HeaderText="StockPrice"
                        HtmlEncode="False" SortExpression="StockPrice" />
                    <asp:BoundField DataField="StockName" HeaderText="StockName" SortExpression="StockName" />
                    <asp:BoundField DataField="StockID" HeaderText="StockID" ReadOnly="True" SortExpression="StockID" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MemberCardConnectionString2 %>"
                SelectCommand="SELECT [BackID] FROM [BackStock]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
            <asp:SqlDataSource  ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MemberCardConnectionString %>"
                SelectCommand="SELECT [StockCount], [StockPrice], [StockName], [StockID] FROM [Stock]" 
                DeleteCommand="DELETE FROM [Stock] WHERE [StockID] = @StockID" 
                InsertCommand="INSERT INTO [Stock] ([StockCount], [StockPrice], [StockName], [StockID]) VALUES (@StockCount, @StockPrice, @StockName, @StockID)" 
                UpdateCommand="UPDATE [Stock] SET [StockCount] = @StockCount, [StockPrice] = @StockPrice, [StockName] = @StockName WHERE [StockID] = @StockID" OnInserted="SqlDataSource1_Inserted" OnInserting="SqlDataSource1_Inserting">
                <DeleteParameters>
                    <asp:Parameter Name="StockID" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="StockCount" Type="Int32" />
                    <asp:Parameter Name="StockPrice" Type="Double" />
                    <asp:Parameter Name="StockName" Type="String" />
                    <asp:Parameter Name="StockID" Type="String" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="StockCount" Type="Int32" />
                    <asp:Parameter Name="StockPrice" Type="Double" />
                    <asp:Parameter Name="StockName" Type="String" />
                    <asp:Parameter Name="StockID" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
        </td>
    </tr></table>
    </td></tr>
    <tr><td style="height: 91px">  <table id="tb3" runat="server">
        <tr><td style="width: 110px; height: 21px"><asp:label id="Label1" runat="server" text="Label"></asp:label> </td></tr>
        </table>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:DropDownList ID="DropDownList2" runat="server">
        </asp:DropDownList></td></tr>
    </table>


   
  

    </form>
</body>
</html>
