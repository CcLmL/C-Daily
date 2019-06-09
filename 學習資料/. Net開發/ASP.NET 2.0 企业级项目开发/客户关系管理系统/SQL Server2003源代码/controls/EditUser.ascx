<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditUser.ascx.cs" Inherits="controls_EditUser" %>
<%@ Register Src="UserTypeUC.ascx" TagName="UserTypeUC" TagPrefix="uc3" %>
<%@ Register Src="UserStateUC.ascx" TagName="UserStateUC" TagPrefix="uc2" %>
<%@ Register Src="UserGradeUC.ascx" TagName="UserGradeUC" TagPrefix="uc1" %>
<table style="width: 765px">
    <tr>
        <td>
            修改客户资料</td>
    </tr>
    <tr>
        <td>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
                DeleteCommand="DELETE FROM [UserInfo] WHERE [UserID] = @UserID" InsertCommand="INSERT INTO [UserInfo] ([CityID], [GradeID], [StateID], [TypeID], [UserName], [UserAddress], [UserLinkman], [SoftVersion], [UserPhone], [EMail], [PeopleAmount], [Fax], [QQ]) VALUES (@CityID, @GradeID, @StateID, @TypeID, @UserName, @UserAddress, @UserLinkman, @SoftVersion, @UserPhone, @EMail, @PeopleAmount, @Fax, @QQ)"
                SelectCommand="SELECT UserInfo.UserID, City.CityName, UserGrade.GradeName, UserState.StateName, UserType.TypeName, UserInfo.UserName, UserInfo.UserAddress, UserInfo.UserLinkman, UserInfo.SoftVersion, UserInfo.UserPhone, UserInfo.EMail, UserInfo.PeopleAmount, UserInfo.Fax, UserInfo.QQ FROM UserInfo INNER JOIN City ON UserInfo.CityID = City.CityID INNER JOIN UserState ON UserInfo.StateID = UserState.StateID INNER JOIN UserType ON UserInfo.TypeID = UserType.TypeID INNER JOIN UserGrade ON UserInfo.GradeID = UserGrade.GradeID"
                UpdateCommand="UPDATE UserInfo SET CityID = (SELECT CityID FROM City WHERE (CityName = @cityname)), GradeID = (SELECT GradeID FROM UserGrade WHERE (gradename = @gradename)), StateID = (SELECT StateID FROM UserState WHERE (StateName = @statename)), TypeID = (SELECT TypeID FROM UserType WHERE (TypeName = @typename)), UserName = @UserName, UserAddress = @UserAddress, UserLinkman = @UserLinkman, SoftVersion = @SoftVersion, UserPhone = @UserPhone, EMail = @EMail, PeopleAmount = @PeopleAmount, Fax = @Fax, QQ = @QQ FROM UserInfo INNER JOIN City AS City_1 ON UserInfo.CityID = City_1.CityID INNER JOIN UserType AS UserType_1 ON UserInfo.TypeID = UserType_1.TypeID INNER JOIN UserState AS UserState_1 ON UserInfo.StateID = UserState_1.StateID INNER JOIN UserGrade AS UserGrade_1 ON UserInfo.GradeID = UserGrade_1.GradeID WHERE (UserInfo.UserID = @UserID)">
                <DeleteParameters>
                    <asp:Parameter Name="UserID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="cityname" />
                    <asp:Parameter Name="gradename" />
                    <asp:Parameter Name="statename" />
                    <asp:Parameter Name="typename" />
                    <asp:Parameter Name="UserName" Type="String" />
                    <asp:Parameter Name="UserAddress" Type="String" />
                    <asp:Parameter Name="UserLinkman" Type="String" />
                    <asp:Parameter Name="SoftVersion" Type="String" />
                    <asp:Parameter Name="UserPhone" Type="String" />
                    <asp:Parameter Name="EMail" Type="String" />
                    <asp:Parameter Name="PeopleAmount" Type="Int32" />
                    <asp:Parameter Name="Fax" Type="String" />
                    <asp:Parameter Name="QQ" Type="String" />
                    <asp:Parameter Name="UserID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="CityID" Type="Int32" />
                    <asp:Parameter Name="GradeID" Type="Int32" />
                    <asp:Parameter Name="StateID" Type="Int32" />
                    <asp:Parameter Name="TypeID" Type="Int32" />
                    <asp:Parameter Name="UserName" Type="String" />
                    <asp:Parameter Name="UserAddress" Type="String" />
                    <asp:Parameter Name="UserLinkman" Type="String" />
                    <asp:Parameter Name="SoftVersion" Type="String" />
                    <asp:Parameter Name="UserPhone" Type="String" />
                    <asp:Parameter Name="EMail" Type="String" />
                    <asp:Parameter Name="PeopleAmount" Type="Int32" />
                    <asp:Parameter Name="Fax" Type="String" />
                    <asp:Parameter Name="QQ" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                DataKeyNames="UserID" DataSourceID="SqlDataSource1" Width="751px">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="CityName" HeaderText="城市" SortExpression="CityName" />
                    <asp:TemplateField HeaderText="等级" SortExpression="GradeName">
                        <EditItemTemplate>
                            <uc1:UserGradeUC ID="UserGradeUC1" runat="server" SelectValue='<%# Bind("GradeName") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("GradeName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="状态" SortExpression="StateName">
                        <EditItemTemplate>
                            &nbsp;<uc2:UserStateUC ID="UserStateUC1" runat="server" SelectValue='<%# Bind("StateName") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("StateName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="业务类型" SortExpression="TypeName">
                        <EditItemTemplate>
                            <uc3:UserTypeUC ID="UserTypeUC1" runat="server"　SelectValue='<%# Bind("TypeName") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("TypeName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="UserName" HeaderText="客户名" SortExpression="UserName" />
                    <asp:BoundField DataField="UserAddress" HeaderText="地址" SortExpression="UserAddress" />
                    <asp:BoundField DataField="UserLinkman" HeaderText="联系人" SortExpression="UserLinkman" />
                    <asp:BoundField DataField="SoftVersion" HeaderText="软件版本" SortExpression="SoftVersion" />
                    <asp:BoundField DataField="UserPhone" HeaderText="电话" SortExpression="UserPhone" />
                    <asp:BoundField DataField="PeopleAmount" HeaderText="公司人数" SortExpression="PeopleAmount" />
                    <asp:BoundField DataField="Fax" HeaderText="传真" SortExpression="Fax" />
                    <asp:BoundField DataField="EMail" HeaderText="EMail" SortExpression="EMail" />
                    <asp:BoundField DataField="QQ" HeaderText="QQ" SortExpression="QQ" />
                </Columns>
            </asp:GridView>
        </td>
    </tr>
</table>
