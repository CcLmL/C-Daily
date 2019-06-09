<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditNews.aspx.cs" Inherits="Manager_EditNews" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="602px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="NewsTitle" HeaderText="新闻主题" SortExpression="NewsTitle" />
                <asp:BoundField DataField="NewsData" HeaderText="内容" SortExpression="NewsData" />
                <asp:BoundField DataField="NewsDate" HeaderText="发布时间" SortExpression="NewsDate" />
                <asp:BoundField DataField="NewsImageUrl" HeaderText="图片地址" SortExpression="NewsImageUrl" />
                <asp:BoundField DataField="NewsCategory" HeaderText="新闻类别" SortExpression="NewsCategory" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewsConnectionString %>"
            DeleteCommand="delete from newsinfo where newsid=@newsid" SelectCommand="SELECT * FROM [NewsInfo]"
            UpdateCommand="update newsinfo set newstitle=@newstitle,newsdata=@newsdata,newsdate=@newsdate,newsimageurl=@newsimageurl,newscategory=@newscategory where newsID=@newsID">
            <DeleteParameters>
                <asp:Parameter Name="newsid" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="newstitle" />
                <asp:Parameter Name="newsdata" />
                <asp:Parameter Name="newsdate" />
                <asp:Parameter Name="newsimageurl" />
                <asp:Parameter Name="newscategory" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
