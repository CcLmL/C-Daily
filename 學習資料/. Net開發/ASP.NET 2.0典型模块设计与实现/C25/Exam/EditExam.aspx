<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditExam.aspx.cs" Inherits="EditExam" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ExamID"
            DataSourceID="SqlDataSource1" Height="186px" Width="644px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ExamTitle" HeaderText="考题" SortExpression="ExamTitle" />
                <asp:BoundField DataField="Option1" HeaderText="选择1" SortExpression="Option1" />
                <asp:BoundField DataField="Option2" HeaderText="选择2" SortExpression="Option2" />
                <asp:BoundField DataField="Option3" HeaderText="选择3" SortExpression="Option3" />
                <asp:BoundField DataField="Result" HeaderText="答案" SortExpression="Result" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExamConnectionString %>"
            DeleteCommand="delete from optionexam  where examid=@examid" SelectCommand="SELECT * FROM [OptionExam]"
            UpdateCommand="update optionexam set examtitle=@examtitle,option1=@option1,option2=@option2,option3=@option3,result=@result&#13;&#10; where examid=@examid">
            <DeleteParameters>
                <asp:Parameter Name="examid" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="examtitle" />
                <asp:Parameter Name="option1" />
                <asp:Parameter Name="option2" />
                <asp:Parameter Name="option3" />
                <asp:Parameter Name="result" />
                <asp:Parameter Name="examid" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
