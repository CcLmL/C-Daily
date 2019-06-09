<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CardTypeSet.ascx.cs" Inherits="controls_CardTypeSet" %>
<table>
    <tr>
        <td colspan="3" >
            <table id="TABLE1" runat="server">
                <tr>
                <td >
                    <asp:Label ID="Label1" runat="server" Text="卡类型名称" ></asp:Label>
                </td>
                <td >
                    <asp:TextBox ID="txttype" runat="server" ></asp:TextBox>
                    <asp:Label ID="Label12" runat="server" ></asp:Label></td></tr>
                 <tr>
                <td >
                    <asp:Label ID="Label2" runat="server" Text="卡积分规则"></asp:Label>
                </td>
                <td >
                    <asp:TextBox ID="txtrule" runat="server" ></asp:TextBox>
                    <asp:Label ID="Label3" runat="server" Text="分/元" Width="58px" ></asp:Label></td>
                </tr>
                <tr> <td colspan="2" align="center" > 
                <asp:Button ID="Button1" runat="server" Text="添加" OnClick="Button1_Click" />
                </td> </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="3" >
            <table id="TABLE2" runat="server">
                <tr> <td >
                    <asp:Label ID="Label4" runat="server" Text="原卡类型名称"></asp:Label> </td>
                  <td ><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> </td>            
                </tr>
                <tr>
                  <td ><asp:Label ID="Label5" runat="server" Text="新卡类型名称"></asp:Label>
                  </td>
                  <td ><asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
                  </td>
                </tr>
                <tr>
                  <td colspan="2" align="center">
                  <asp:Button ID="Button2" runat="server" Text="修改" OnClick="Button2_Click"/>
                  </td> </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="3" >
            <table id="TABLE3" runat="server">
                <tr>
                <td >
                    <asp:Label ID="Label6" runat="server" Text="卡类型名称" ></asp:Label></td>
                <td ><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <asp:Label ID="Label13" runat="server"></asp:Label></td> </tr> 
                <tr><td ><asp:Label ID="Label7" runat="server" Text="新积分规则" ></asp:Label></td>
                <td ><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <asp:Label ID="Label8" runat="server" Text="分/元" Width="59px" ></asp:Label></td></tr>
                <tr><td colspan="2" align="center" >
                <asp:Button ID="Button3" runat="server" Text="修改" OnClick="Button3_Click" />
                </td></tr>
            </table> 
        </td>
    </tr>
        <tr>
        <td colspan="3" >
            <table id="TABLE4" runat="server"><tr>
            <td ><asp:Label ID="Label9" runat="server" Text="卡类型名称"></asp:Label>
            </td><td ><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                <asp:Label ID="Label14" runat="server"></asp:Label></td>
            </tr><tr><td >
            <asp:Label ID="Label10" runat="server" Text="卡积分规则"></asp:Label>
            </td><td ><asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <asp:Label ID="Label11" runat="server" Text="分/元" Width="58px"></asp:Label>
            </td></tr><tr><td colspan="2" align="center"> 
            <asp:Button ID="Button4" runat="server" Text="获取" OnClick="Button4_Click" /></td></tr>
            </table> 
        </td>
    </tr>
</table>
