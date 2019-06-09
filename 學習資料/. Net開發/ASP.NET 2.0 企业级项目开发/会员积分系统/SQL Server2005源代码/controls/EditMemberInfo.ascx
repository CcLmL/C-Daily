<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditMemberInfo.ascx.cs" Inherits="controls_EditMemberInfo" %>
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
    DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="MemberID">
    <Columns>
        <asp:CommandField ShowEditButton="True" />
        <asp:BoundField DataField="CardNum" HeaderText="会员卡号" ReadOnly="True" SortExpression="CardNum" />
        <asp:BoundField DataField="CustName" HeaderText="会员姓名" SortExpression="CustName" />
        <asp:BoundField DataField="custIdentity" HeaderText="身份证号" ReadOnly="True" SortExpression="custIdentity" />
        <asp:BoundField DataField="CustAddress" HeaderText="会员地址" SortExpression="CustAddress" />
        <asp:BoundField DataField="CustPhone" HeaderText="会员电话" SortExpression="CustPhone" />
        <asp:BoundField DataField="CardDate" DataFormatString="{0:d}" HeaderText="办卡日期" SortExpression="CardDate" HtmlEncode="False" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MemberCardConnectionString %>"
    DeleteCommand="DELETE FROM [MemberInfo] WHERE [MemberID] = @MemberID" InsertCommand="INSERT INTO [MemberInfo] ([CardNum], [CustName], [custIdentity], [CardDate], [CustAddress], [CustPhone]) VALUES (@CardNum, @CustName, @custIdentity, @CardDate, @CustAddress, @CustPhone)"
    SelectCommand="SELECT [MemberID], [CardNum], [CustName], [custIdentity], [CardDate], [CustAddress], [CustPhone] FROM [MemberInfo]"
    UpdateCommand="UPDATE [MemberInfo] SET [CustName] = @CustName, [CardDate] = @CardDate, [CustAddress] = @CustAddress, [CustPhone] = @CustPhone WHERE [MemberID] = @MemberID">
    <DeleteParameters>
        <asp:Parameter Name="MemberID" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="CustName" Type="String" />
        <asp:Parameter Name="CardDate" Type="DateTime" />
        <asp:Parameter Name="CustAddress" Type="String" />
        <asp:Parameter Name="CustPhone" Type="String" />
        <asp:Parameter Name="MemberID" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="CardNum" Type="String" />
        <asp:Parameter Name="CustName" Type="String" />
        <asp:Parameter Name="custIdentity" Type="String" />
        <asp:Parameter Name="CardDate" Type="DateTime" />
        <asp:Parameter Name="CustAddress" Type="String" />
        <asp:Parameter Name="CustPhone" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>
