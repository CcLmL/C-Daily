<!DOCTYPE html>
<script runat="server">

    Sub Page_Load(sender As Object, e As EventArgs)
        If Page.IsPostBack Then
            Return '如果不是第一次加载就不执行
        End If
        Dim shtI As Short
        Dim liA As ListItem

        For shtI = Year(Now()) To Year(Now()) + 5
            liA = New ListItem(shtI)
            D1.Items.Add(shtI)
        Next

        For shtI = 1 To 12 '月份
            liA = New ListItem(shtI)
            D2.Items.Add(shtI)
        Next
        D2.Items(Month(Now()) - 1).Selected = True '将选择到的项目显示为现在的月份

        For shtI = 1 To Day(DateSerial(Year(Now()), Month(Now()) + 1, 1 - 1))
            liA = New ListItem(shtI)
            D3.Items.Add(shtI)
        Next
        D3.Items(Day(Now()) - 1).Selected = True '将选择到的项目显示为现在的日

    End Sub

    Sub DayChg(Sender As Object, e As EventArgs)

    End Sub

</script>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title></title>    
</head>
<body>
    你觉得英雄联盟还能火多久？
    <form id="form1" runat="server">  
        <asp:DropDownList runat="server" ID="D1" AutoPostBack="true" OnSelectedIndexChanged="DayChg" />年
        <asp:DropDownList runat="server" ID="D2" AutoPostBack="true" OnSelectedIndexChanged="DayChg" />月
        <asp:DropDownList runat="server" ID="D3" AutoPostBack="true" OnSelectedIndexChanged="DayChg" />日
    </form>
    <asp:Label runat="server" ID="Label1" />
</body>
</html>
