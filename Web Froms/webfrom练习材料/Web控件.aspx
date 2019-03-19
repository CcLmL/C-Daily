<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title></title>
    <script runat="server">
        Sub Page_load()  
            link1.HRef = "http://www.w3school.com.cn"
        End Sub

        Sub sumbit(Source As Object, e As EventArgs)
            button1.Text = "Click~~"
        End Sub
    </script>
</head>
<body style="background-color:#e5eecc; text-align:center;">
    <h2>Hello W3School</h2>
    <p><%Response.Write(now())%></p>  <!--classic ASP的写法-->
    <form runat="server">  <!--html服务器控件-->
        <a id="link1" runat="server">Visit W3School</a>
        <asp:Button id="button1" Text="Click here" runat="server" OnClick="sumbit" />  <!--Web服务器控件-->
    </form>
</body>
</html>