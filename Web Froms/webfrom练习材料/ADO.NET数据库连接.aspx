<%@import Namespace="System.Data.OleDb"  %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title></title>
    <script runat="server">
        Sub Page_Load()
            Dim dbconn
            dbconn = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;data source=" & Server.MapPath("northwind.mdb"))
            dbconn.Open()
        End Sub
    </script>
</head>
<body>
    <form id="form1" runat="server">   
    </form>
</body>
</html>
