<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditLinkman.ascx.cs" Inherits="controls_EditLinkmanl" %>
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
    DeleteCommand="DELETE FROM [Linkman] WHERE [LinkmanID] = @LinkmanID" InsertCommand="INSERT INTO [Linkman] ([LinkmanName], [LinkmanPhone], [LinkmanEMail], [note], [LinkmanSex], [LinkmanLike], [LinkmanBirthday], [LinkmanQQ]) VALUES (@LinkmanName, @LinkmanPhone, @LinkmanEMail, @note, @LinkmanSex, @LinkmanLike, @LinkmanBirthday, @LinkmanQQ)"
    SelectCommand="SELECT [LinkmanID], [LinkmanName], [LinkmanPhone], [LinkmanEMail], [note], [LinkmanSex], [LinkmanLike], [LinkmanBirthday], [LinkmanQQ] FROM [Linkman]"
    UpdateCommand="UPDATE [Linkman] SET [LinkmanName] = @LinkmanName, [LinkmanPhone] = @LinkmanPhone, [LinkmanEMail] = @LinkmanEMail, [note] = @note, [LinkmanSex] = @LinkmanSex, [LinkmanLike] = @LinkmanLike, [LinkmanBirthday] = @LinkmanBirthday, [LinkmanQQ] = @LinkmanQQ WHERE [LinkmanID] = @LinkmanID">
    <DeleteParameters>
        <asp:Parameter Name="LinkmanID" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="LinkmanName" Type="String" />
        <asp:Parameter Name="LinkmanPhone" Type="String" />
        <asp:Parameter Name="LinkmanEMail" Type="String" />
        <asp:Parameter Name="note" Type="String" />
        <asp:Parameter Name="LinkmanSex" Type="Boolean" />
        <asp:Parameter Name="LinkmanLike" Type="String" />
        <asp:Parameter Name="LinkmanBirthday" Type="DateTime" />
        <asp:Parameter Name="LinkmanQQ" Type="String" />
        <asp:Parameter Name="LinkmanID" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="LinkmanName" Type="String" />
        <asp:Parameter Name="LinkmanPhone" Type="String" />
        <asp:Parameter Name="LinkmanEMail" Type="String" />
        <asp:Parameter Name="note" Type="String" />
        <asp:Parameter Name="LinkmanSex" Type="Boolean" />
        <asp:Parameter Name="LinkmanLike" Type="String" />
        <asp:Parameter Name="LinkmanBirthday" Type="DateTime" />
        <asp:Parameter Name="LinkmanQQ" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>
<table style="width: 513px">
    <tr>
        <td>
            姓名：</td>
        <td>
            <asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
        <td>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="查询" Width="55px" /></td>
    </tr>
    <tr>
        <td>
            爱好</td>
        <td>
            <asp:TextBox ID="txtlike" runat="server"></asp:TextBox></td>
        <td>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="查询" Width="57px" /></td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td colspan="3">
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
    DataKeyNames="LinkmanID" DataSourceID="SqlDataSource1" Width="641px">
    <Columns>
        <asp:CommandField ShowEditButton="True" />
        <asp:BoundField DataField="LinkmanName" HeaderText="姓名" SortExpression="LinkmanName" />
        <asp:CheckBoxField DataField="LinkmanSex" HeaderText="性别" SortExpression="LinkmanSex" />
        <asp:BoundField DataField="LinkmanPhone" HeaderText="电话" SortExpression="LinkmanPhone" />
        <asp:BoundField DataField="LinkmanEMail" HeaderText="Mail" SortExpression="LinkmanEMail" />
        <asp:BoundField DataField="LinkmanQQ" HeaderText="QQ" SortExpression="LinkmanQQ" />
        <asp:BoundField DataField="LinkmanLike" HeaderText="爱好" SortExpression="LinkmanLike" />
        <asp:BoundField DataField="LinkmanBirthday" DataFormatString="{0:d}" HeaderText="生日"
            HtmlEncode="False" SortExpression="LinkmanBirthday" />
        <asp:BoundField DataField="note" HeaderText="备注" SortExpression="note" />
    </Columns>
</asp:GridView>
        </td>
    </tr>
    <tr>
        <td style="height: 21px">
            今周要过生日的联系人：</td>
        <td style="height: 21px">
        </td>
        <td style="height: 21px">
        </td>
    </tr>
    <tr>
        <td colspan="3" style="height: 21px">
            <asp:ListBox ID="ListBox1" runat="server" DataSourceID="ObjectDataSource1" DataTextField="linkmanname"
                DataValueField="linkmanname" Width="457px"></asp:ListBox><asp:ObjectDataSource ID="ObjectDataSource1"
                    runat="server" SelectMethod="GetBirthdayMan" TypeName="LinkmanDA"></asp:ObjectDataSource>
            &nbsp;
        </td>
    </tr>
</table>
