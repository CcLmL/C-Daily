<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeleteInfo.aspx.cs" Inherits="BackGround_DeleteInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../Css/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div align="right">
        <asp:Label ID="lblPageSum" runat="server" Text="当前页为　1 / 10　页"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="3" ForeColor="#333333" GridLines="None" Height="1px" OnPageIndexChanging="GridView1_PageIndexChanging"
            OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting"
            OnSelectedIndexChanging="GridView1_SelectedIndexChanging" Width="800px" PageSize="24">
            <PagerSettings FirstPageText="第一页" LastPageText="末一页" Mode="NextPreviousFirstLast"
                NextPageText="下一页" PreviousPageText="上一页" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="type" HeaderText="信息类型">
                    <ItemStyle Width="60px" HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="title" HeaderText="信息标题">
                    <ItemStyle Width="100px" HorizontalAlign="Left" />
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="info" HeaderText="信息内容">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="LinkMan" HeaderText="联系人">
                    <ItemStyle Width="60px" HorizontalAlign="Left" />
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="tel" HeaderText="联系电话">
                    <ItemStyle Width="80px" HorizontalAlign="Left" />
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="checkState" HeaderText="审核状态">
                    <ItemStyle Width="60px" HorizontalAlign="Left" />
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:CommandField HeaderText="详细信息" SelectText="详细" ShowSelectButton="True">
                    <ItemStyle HorizontalAlign="Center" Width="60px" />
                </asp:CommandField>
                <asp:CommandField HeaderText="删除信息" ShowDeleteButton="True">
                    <ItemStyle HorizontalAlign="Center" Width="60px" />
                </asp:CommandField>
            </Columns>
            <RowStyle BackColor="#E3EAEB" />
            <EditRowStyle BackColor="#7C6F57" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="False" ForeColor="#333333" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        </div>
    </form>
</body>
</html>
