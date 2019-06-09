<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewUser.ascx.cs" Inherits="controls_ViewUser" %>
<table style="width: 809px">
    <tr>
        <td style="width: 146px">
            客户名称</td>
        <td style="width: 12px">
            <asp:TextBox ID="txtusername" runat="server" Width="225px"></asp:TextBox></td>
        <td style="width: 191px">
            <asp:Button ID="Button1" runat="server" Text="查询" Width="85px" OnClick="Button1_Click" /></td>
    </tr>
    <tr>
        <td style="width: 146px">
            城市名称</td>
        <td style="width: 12px">
            <asp:TextBox ID="txtcity" runat="server" Width="221px"></asp:TextBox></td>
        <td style="width: 191px">
            <asp:Button ID="Button2" runat="server" Text="查询" Width="84px" OnClick="Button2_Click" /></td>
    </tr>
    <tr>
        <td style="width: 146px">
            软件版本</td>
        <td style="width: 12px">
            <asp:TextBox ID="txtsoftversion" runat="server" Width="223px"></asp:TextBox>
        </td>
        <td style="width: 191px">
            <asp:Button ID="Button3" runat="server" Text="查询" Width="84px" OnClick="Button3_Click" /></td>
    </tr>
    <tr>
        <td style="width: 146px">
            分类查询<br />
            <br />
            名称</td>
        <td style="width: 12px">
            按
            <asp:DropDownList ID="DropDownList1" runat="server" Width="116px">
                <asp:ListItem>等级</asp:ListItem>
                <asp:ListItem Selected="True">状态</asp:ListItem>
                <asp:ListItem>业务类型</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtseek" runat="server"></asp:TextBox></td>
        <td style="width: 191px">
            <asp:Button ID="Button4" runat="server" Text="分类" Width="82px" OnClick="Button4_Click" /></td>
    </tr>
    <tr>
        <td colspan="3" style="height: 293px">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID"
                DataSourceID="SqlDataSource1" Width="821px">
                <Columns>
                    <asp:BoundField DataField="UserName" HeaderText="客户名称" SortExpression="UserName" />
                    <asp:BoundField DataField="SoftVersion" HeaderText="软件版本" SortExpression="SoftVersion" />
                    <asp:BoundField DataField="CityName" HeaderText="城市" SortExpression="CityName" />
                    <asp:BoundField DataField="GradeName" HeaderText="等级" SortExpression="GradeName" />
                    <asp:BoundField DataField="StateName" HeaderText="状态" SortExpression="StateName" />
                    <asp:BoundField DataField="TypeName" HeaderText="业务类型" SortExpression="TypeName" />
                    <asp:BoundField DataField="UserAddress" HeaderText="地址" SortExpression="UserAddress" />
                    <asp:BoundField DataField="UserLinkman" HeaderText="联系人" SortExpression="UserLinkman" />
                    <asp:BoundField DataField="UserPhone" HeaderText="电话" SortExpression="UserPhone" />
                    <asp:BoundField DataField="EMail" HeaderText="EMail" SortExpression="EMail" />
                    <asp:BoundField DataField="PeopleAmount" HeaderText="公司人数" SortExpression="PeopleAmount" />
                    <asp:BoundField DataField="Fax" HeaderText="传真" SortExpression="Fax" />
                    <asp:BoundField DataField="QQ" HeaderText="QQ" SortExpression="QQ" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
               SelectCommand="SELECT UserInfo.UserID, City.CityName, UserGrade.GradeName, UserState.StateName, UserType.TypeName, UserInfo.UserName, UserInfo.UserAddress, UserInfo.UserLinkman, UserInfo.SoftVersion, UserInfo.UserPhone, UserInfo.EMail, UserInfo.PeopleAmount, UserInfo.Fax, UserInfo.QQ FROM UserInfo INNER JOIN City ON UserInfo.CityID = City.CityID INNER JOIN UserState ON UserInfo.StateID = UserState.StateID INNER JOIN UserType ON UserInfo.TypeID = UserType.TypeID INNER JOIN UserGrade ON UserInfo.GradeID = UserGrade.GradeID">
               </asp:SqlDataSource>
            &nbsp;&nbsp;&nbsp; &nbsp;
        </td>
    </tr>
</table>
