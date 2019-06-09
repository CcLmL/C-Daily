<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CategoryList.aspx.cs" Inherits="CategoryList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
             <headertemplate>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
             </headertemplate>
               <itemtemplate>
                       <tr><td><a href="MsgList.aspx?categoryid=<%# Eval("categoryid")%>"><%#Eval("categoryname") %></a></td></tr>  
                       <tr><td><%#Eval("categorydes") %></td></tr>
               </separatortemplate>
              </itemtemplate>
            <footertemplate>
               </table>
            </footertemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BBSConnectionString %>"
            SelectCommand="SELECT * FROM [BBSCategory]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
