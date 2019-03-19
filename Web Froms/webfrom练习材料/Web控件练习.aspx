<!DOCTYPE html>
<%--<script runat="server">
    Sub Page_Load(Sender As Object, e As EventArgs)
        If Not Page.IsPostBack Then
            Man.Visible = False
            Woman.Visible = False
            Result.Visible = False
        End If
    End Sub

    Sub btnMan_Click(Sender As Object, e As EventArgs)
        panel1.Visible = False
        Man.Visible = True
    End Sub

    Sub btnWoman_Click(Sender As Object, e As EventArgs)
        panel1.Visible = False
        Woman.Visible = True
    End Sub

    Sub ShowMan(Sender As Object, e As EventArgs)
        Man.Visible = False
        Result.Visible = True
        lblBody.Text = CInt(（CInt(txtMan.Text) - 80) * 0.7）
    End Sub

    Sub ShowWoman(Sender As Object, e As EventArgs)
        Woman.Visible = False
        Result.Visible = True
        lblBody.Text = CInt(（CInt(txtWoman.Text) - 70) * 0.6）
    End Sub
</script>--%>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title></title> 
    <%--<script runat="server" id="ScriptAccessKey">
        Sub Button_Click1(Sender As Object, e As EventArgs)
            label1.Text = "You press the button!"
            Button1.BorderStyle = BorderStyle.Inset
        End Sub
    </script>--%>
    <script runat="server">
        Sub Page_Load()
            If Not Page.IsPostBack Then
                Label1.Text = "Not Checked"
            End If
        End Sub

        Sub Check_Clicked(Sender As Object, e As EventArgs)
            If CheckBox1.Checked Then
                Label1.Text = "Checked"
            Else
                Label1.Text = "Not Checked"
            End If
        End Sub
    </script>
</head>
<body>
    <form id="form1" runat="server">   
        <%--<asp:Button ID="Button1" Text="请按我" runat="server" AccessKey="A" OnClick="Button_Click1" BorderStyle="Outset" />
        <asp:Label ID="label1" runat="server" BorderWidth="1px"/>
        <ASP:Button Id="B1" Text="TabIndex=3" TabIndex="2" Runat="Server"/> 
        <ASP:Button Id="B2" Text="TabIndex=2" TabIndex="3" Runat="Server"/> 
        <ASP:Button Id="B3" Text="TabIndex=1" TabIndex="1" Runat="Server"/> 
        <asp:Image id="image1" runat="server" ImageUrl="111" AlternateText="图片显示失败" ImageAlign="Middle" />
        <asp:HyperLink ID="hlink1" runat="server" ImageUrl="111" NavigateUrl="~/Web控件.aspx" Text="Microsoft" Target="_blank" />
        <asp:LinkButton runat="server" text="文字按钮" OnClick="Button_Click1" />--%>
        <%--<asp:Panel runat="server" ID="panel1" Visible="true">
            标准体重计算程序<hr />
            依你的性别进入不同的计算方法
            <asp:Button id="btnMan" Text="我是男生" OnClick="btnMan_Click" runat="server" />
            <asp:Button id="btnWoman" Text="我是女生" OnClick="btnWoman_Click" runat="server" />
        </asp:Panel>

        <asp:Panel runat="server" Id="Man" Visible="true"><!--查看男生身高-->
            输入你的身高：<asp:TextBox ID="txtMan" runat="server" />
            <asp:Button ID="ShowResult1" Text="查看结果" OnClick="ShowMan" runat="server"/>
        </asp:Panel>

        <asp:Panel runat="server" Id="Woman" Visible="true"><!--查看女生身高-->
            输入你的身高：<asp:TextBox ID="txtWoman" runat="server" />
            <asp:Button ID="ShowResult2" Text="查看结果" OnClick="ShowWoman" runat="server"/>
        </asp:Panel>

        <asp:Panel runat="server" ID="Result" Visible="true"><!--配置显示标准体重的panel-->
            你的标准体重为：<asp:Label ID="lblBody" runat="server" >公斤</asp:Label>
        </asp:Panel>--%>
        <asp:CheckBox runat="server" ID="CheckBox1" AutoPostBack="true" OnCheckedChanged="Check_Clicked"/>
        <asp:Label runat="server" ID="Label1" />
    </form>
</body>
</html>
