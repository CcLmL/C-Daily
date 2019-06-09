<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RoleManager.ascx.cs" Inherits="controls_RoleManager" %>
<asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View1" runat="server">
        <table style="width: 458px">
            <tr>
                <td style="width: 289px">
                    添加角色</td>
                <td style="width: 204px">
                </td>
            </tr>
            <tr>
                <td style="width: 289px">
                    <asp:TextBox ID="txtrolename" runat="server" Width="221px"></asp:TextBox></td>
                <td style="width: 204px">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加" Width="69px" /></td>
            </tr>
            <tr>
                <td style="width: 289px">
                    删除角色</td>
                <td style="width: 204px">
                </td>
            </tr>
            <tr>
                <td style="width: 289px">
                    <asp:DropDownList ID="ddlrole" runat="server" Width="217px">
                    </asp:DropDownList></td>
                <td style="width: 204px">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="删除" Width="69px" /></td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="View2" runat="server">
        <table style="width: 455px">
            <tr>
                <td>
                    添加用户</td>
            </tr>
            <tr>
                <td style="height: 472px">
                    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" ContinueButtonText="完成"
                        OnContinueButtonClick="CreateUserWizard1_ContinueButtonClick">
                        <WizardSteps>
                            <asp:CreateUserWizardStep runat="server">
                            </asp:CreateUserWizardStep>
                            <asp:CompleteWizardStep runat="server">
                            </asp:CompleteWizardStep>
                        </WizardSteps>
                    </asp:CreateUserWizard>
                    &nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    浏览或删除用户</td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserName"
                            DataSourceID="ObjectDataSource1" Width="217px">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                                <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" SortExpression="UserName" />
                            </Columns>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="DeleteUser"
                            SelectMethod="GetUsers" TypeName="UserManager">
                            <DeleteParameters>
                                <asp:Parameter Name="UserName" Type="String" />
                            </DeleteParameters>
                        </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="View3" runat="server">
        <table style="width: 451px">
            <tr>
                <td style="width: 175px">
                    用户名</td>
                <td>
                    角色名</td>
            </tr>
            <tr>
                <td style="width: 175px">
                    <asp:TextBox ID="txtusername" runat="server"></asp:TextBox></td>
                <td>
                    <asp:DropDownList ID="ddlrole1" runat="server" Width="189px">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 175px">
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="添加" Width="75px" /></td>
                <td>
                    <asp:Button ID="Button4" runat="server" Text="移除" Width="75px" OnClick="Button4_Click" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    通过选择角色名称，显示角色中的用户列表</td>
            </tr>
            <tr>
                <td style="width: 175px">
                    <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"
                        Width="152px"></asp:ListBox></td>
                <td>
                    <asp:ListBox ID="ListBox2" runat="server" Width="187px"></asp:ListBox></td>
            </tr>
        </table>
    </asp:View>
</asp:MultiView>
&nbsp;
