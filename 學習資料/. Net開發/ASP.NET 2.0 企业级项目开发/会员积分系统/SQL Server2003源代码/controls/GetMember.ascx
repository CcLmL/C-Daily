<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GetMember.ascx.cs" Inherits="controls_GetMember" %>
&nbsp;<table style="width: 557px">
    <tr>
        <td style="height: 42px; width: 7px;">
            <asp:Label ID="Label1" runat="server" Text="会员卡号" Width="87px"></asp:Label></td>
        <td style="width: 15px; height: 42px">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
        <td style="width: 23px; height: 42px">
            <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" /></td>
    </tr>
    <tr>
        <td style="width: 7px; height: 35px">
            &nbsp;<asp:Label ID="Label3" runat="server" Text="会员姓名" Width="84px"></asp:Label></td>
        <td style="width: 15px; height: 35px;">
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </td>
        <td style="width: 23px; height: 35px;">
            <asp:Button ID="Button2" runat="server" Text="查询" OnClick="Button2_Click" /></td>
    </tr>
    <tr>
        <td style=>
            <asp:Label ID="Label2" runat="server" Text="身份证号" Width="87px"></asp:Label></td>
        <td >
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="身份证号输入有误" ControlToValidate="TextBox3" ValidationExpression="\d{17}[\d|X]|\d{15}"></asp:RegularExpressionValidator></td>
        <td >
            <asp:Button ID="Button3" runat="server" Text="查询" OnClick="Button3_Click" /></td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" PageSize="5" Width="547px">
                <Columns>
                    <asp:BoundField DataField="CustName" HeaderText="会员姓名" SortExpression="CustName" />
                    <asp:BoundField DataField="CardNum" HeaderText="会员卡号" SortExpression="CardNum" />
                    <asp:BoundField DataField="CustIdentity" HeaderText="身份证号" SortExpression="CustIdentity" />
                    <asp:BoundField DataField="CustAdress" HeaderText="会员地址" SortExpression="CustAdress" />
                    <asp:BoundField DataField="CustPhone" HeaderText="会员电话" SortExpression="CustPhone" />
                    <asp:BoundField DataField="CardDate" DataFormatString="{0:d}" HeaderText="办卡日期" HtmlEncode="False"
                        SortExpression="CardDate" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetMemberInfoByCardNum"
                TypeName="MemberInfoDA">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" DefaultValue="0" Name="cardnum" PropertyName="Text"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        </td>
    </tr>
</table>
