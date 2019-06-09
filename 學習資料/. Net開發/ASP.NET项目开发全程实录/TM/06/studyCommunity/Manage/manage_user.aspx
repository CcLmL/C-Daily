<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_user.aspx.cs" Inherits="Manage_manage_user" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
        <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <span style="font-size: 16pt; color: #ff00ff"></span>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" OnRowDeleting="GridView1_RowDeleting" CssClass="chengse">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="用户名" />
                <asp:TemplateField HeaderText="状态">
                    <ItemTemplate>
                        <asp:Image ID="Image1" ImageUrl='<%#ImgUrl(Convert.ToString(Eval("ID")))%>' runat="server" />

                    </ItemTemplate>
                </asp:TemplateField>              
                <asp:BoundField DataField="LoginDate" HeaderText="注册时间" />
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                    <a href="change.aspx?id=<%# Convert.ToString(Eval("ID"))%>"><%#BtnText(Convert.ToString(Eval("ID")))%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True">
                    <ControlStyle Font-Underline="False" />
                </asp:CommandField>
            </Columns>
            <EmptyDataTemplate>
               
            </EmptyDataTemplate>
            <PagerTemplate>
                
            </PagerTemplate>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />            
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
