<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ExamView.aspx.cs" Inherits="ExamView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;<table style="width: 777px">
            <tr>
                <td>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="571px" OnItemDataBound="DataList1_ItemDataBound">
        <HeaderTemplate><b>欢迎您参考今年的考试</b><br /><br /><br />
                           您抽到的题目是：<br /><br /> 
        </HeaderTemplate>
       
            <ItemTemplate>
            <%count=count+1; %>
                第<%Response.Write(count); %>题：
                <asp:Label ID="ExamTitleLabel" runat="server" Text='<%# Eval("ExamTitle") %>'></asp:Label><br />
                选项1:     
                <asp:Label ID="Option1Label" runat="server" Text='<%# Eval("Option1") %>'></asp:Label>
                &nbsp;&nbsp;
                选项2:    
                <asp:Label ID="Option2Label" runat="server" Text='<%# Eval("Option2") %>'></asp:Label>
                &nbsp; &nbsp;
                选项3:
                <asp:Label ID="Option3Label" runat="server" Text='<%# Eval("Option3") %>'></asp:Label><br />
                <asp:Label ID="ResultLabel" runat="server" Visible="false" Text='<%# Eval("Result") %>'></asp:Label><br />
                <b>答案:</b>
                <asp:TextBox ID ="txtresult" runat="server" > </asp:TextBox>
                <br />
                
            </ItemTemplate>
        </asp:DataList></td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExamConnectionString %>"
            SelectCommand="select top 5 * from optionexam order by newid()"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" Font-Bold="True" Text="提交答案" Width="139px" OnClick="Button1_Click" /></td>
            </tr>
        </table>
        &nbsp;
    
    </div>
    </form>
</body>
</html>
