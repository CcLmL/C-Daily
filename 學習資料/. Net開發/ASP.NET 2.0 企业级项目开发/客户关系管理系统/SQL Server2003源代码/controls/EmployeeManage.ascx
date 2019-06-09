<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmployeeManage.ascx.cs" Inherits="controls_EmployeeManage" %>
<table style="width: 765px; height: 81px">
    <tr>
        <td style="width: 95px">
            姓名</td>
        <td style="width: 111px">
            <asp:TextBox ID="txtname" runat="server" Width="197px"></asp:TextBox></td>
        <td style="width: 107px">
            性别</td>
        <td style="width: 75px">
            <asp:DropDownList ID="ddlsex" runat="server" Width="73px">
                <asp:ListItem Value="0">男</asp:ListItem>
                <asp:ListItem Value="1">女</asp:ListItem>
            </asp:DropDownList></td>
    </tr>
    <tr>
        <td style="width: 95px">
            电话</td>
        <td style="width: 111px">
            <asp:TextBox ID="txtphone" runat="server" Width="195px"></asp:TextBox></td>
        <td style="width: 107px">
            MAIL</td>
        <td style="width: 75px">
            <asp:TextBox ID="txtmail" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 95px">
            部门</td>
        <td style="width: 111px">
            <asp:DropDownList ID="ddldepart" runat="server" DataSourceID="SqlDataSource1" DataTextField="DepartName"
                DataValueField="DepartName" Width="196px">
            </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
                SelectCommand="SELECT [DepartName] FROM [Department]"></asp:SqlDataSource>
        </td>
        <td style="width: 107px">
            备注</td>
        <td style="width: 75px">
            <asp:TextBox ID="txtnode" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 95px; height: 21px">
            生日</td>
        <td style="width: 111px; height: 21px">
            <asp:Calendar ID="Calendar1" runat="server" Height="131px" Width="187px"></asp:Calendar>
        </td>
        <td style="width: 107px; height: 21px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加" Width="127px" /></td>
        <td style="width: 75px; height: 21px">
            <asp:Label ID="Label1" runat="server" Width="173px"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname"
                ErrorMessage="必须填写姓名" Width="168px"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtmail"
                ErrorMessage="mail格式不正确" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                Width="171px"></asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td colspan="4" style="height: 212px">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                DataKeyNames="EmployeeID" DataSourceID="SqlDataSource2" Width="735px" PageSize="5">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="姓名" SortExpression="EmployeeName" />
                    <asp:TemplateField HeaderText="部门" SortExpression="DepartName">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                                DataTextField="DepartName" DataValueField="DepartName" SelectedValue='<%# Bind("DepartName") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("DepartName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EmployeePhone" HeaderText="电话" SortExpression="EmployeePhone" />
                    <asp:BoundField DataField="EmployeeEMail" HeaderText="EMail" SortExpression="EmployeeEMail" />
                    <asp:CheckBoxField DataField="EmployeeSex" HeaderText="性别" SortExpression="EmployeeSex" />
                    <asp:BoundField DataField="EmployeeBirthday" DataFormatString="{0:d}" HeaderText="生日"
                        HtmlEncode="False" SortExpression="EmployeeBirthday" />
                    <asp:BoundField DataField="Note" HeaderText="备注" SortExpression="Note" />
                </Columns>
            </asp:GridView>
            &nbsp;
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
                DeleteCommand="DELETE FROM [EmployeeInfo] WHERE [EmployeeID] = @EmployeeID" InsertCommand="INSERT INTO [EmployeeInfo] ([DepartID], [EmployeeName], [EmployeePhone], [EmployeeEMail], [Note], [EmployeeSex], [EmployeeBirthday]) VALUES (@DepartID, @EmployeeName, @EmployeePhone, @EmployeeEMail, @Note, @EmployeeSex, @EmployeeBirthday)"
                SelectCommand="SELECT EmployeeInfo.EmployeeName, EmployeeInfo.EmployeePhone, EmployeeInfo.EmployeeEMail, EmployeeInfo.Note, EmployeeInfo.EmployeeSex, EmployeeInfo.EmployeeBirthday, EmployeeInfo.EmployeeID, Department.DepartName FROM EmployeeInfo INNER JOIN Department ON EmployeeInfo.DepartID = Department.DepartID"
                UpdateCommand="UPDATE EmployeeInfo SET DepartID = (SELECT DepartID FROM Department WHERE (DepartName = @departname)), EmployeeName = @EmployeeName, EmployeePhone = @EmployeePhone, EmployeeEMail = @EmployeeEMail, Note = @Note, EmployeeSex = @EmployeeSex, EmployeeBirthday = @EmployeeBirthday FROM EmployeeInfo INNER JOIN Department AS Department_1 ON EmployeeInfo.DepartID = Department_1.DepartID WHERE (EmployeeInfo.EmployeeID = @EmployeeID)">
                <DeleteParameters>
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="departname" />
                    <asp:Parameter Name="EmployeeName" Type="String" />
                    <asp:Parameter Name="EmployeePhone" Type="String" />
                    <asp:Parameter Name="EmployeeEMail" Type="String" />
                    <asp:Parameter Name="Note" Type="String" />
                    <asp:Parameter Name="EmployeeSex" Type="Boolean" />
                    <asp:Parameter Name="EmployeeBirthday" Type="DateTime" />
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="DepartID" Type="Int32" />
                    <asp:Parameter Name="EmployeeName" Type="String" />
                    <asp:Parameter Name="EmployeePhone" Type="String" />
                    <asp:Parameter Name="EmployeeEMail" Type="String" />
                    <asp:Parameter Name="Note" Type="String" />
                    <asp:Parameter Name="EmployeeSex" Type="Boolean" />
                    <asp:Parameter Name="EmployeeBirthday" Type="DateTime" />
                </InsertParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
