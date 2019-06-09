<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LeaguerInfo.aspx.cs" Inherits="BackGround_LeaguerInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../Css/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-position: center center; background-image: url(images/htbj.JPG); background-repeat: no-repeat">
    <form id="form1" runat="server">
    <div>
        <table style="width: 621px; height: 51px; position:absolute; left: 168px; top: 122px;" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 83px; height: 17px">
                    信息类型：</td>
                <td style="width: 399px; height: 17px">
                    <asp:DropDownList ID="ddlType" runat="server" Width="151px">
                        <asp:ListItem>招聘信息</asp:ListItem>
                        <asp:ListItem>求职信息</asp:ListItem>
                        <asp:ListItem>培训信息</asp:ListItem>
                        <asp:ListItem>家教信息</asp:ListItem>
                        <asp:ListItem>公寓信息</asp:ListItem>
                        <asp:ListItem>物品求购</asp:ListItem>
                        <asp:ListItem>物品出售</asp:ListItem>
                        <asp:ListItem>求兑出兑</asp:ListItem>
                        <asp:ListItem>车辆信息</asp:ListItem>
                        <asp:ListItem>寻求合作</asp:ListItem>
                        <asp:ListItem>企业广告</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:CheckBox ID="chkRecommend" runat="server" Text="是否为推荐信息" /></td>
                <td style="height: 17px">
                </td>
            </tr>
            <tr>
                <td style="width: 83px; height: 15px">
                    信息标题：</td>
                <td style="width: 399px; height: 15px">
                    <asp:TextBox ID="txtTitle" runat="server" Width="390px"></asp:TextBox></td>
                <td style="height: 15px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTitle"
                        ErrorMessage="* 必填项"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 83px; height: 49px">
                    信息内容：</td>
                <td style="width: 399px; height: 49px">
                    <asp:TextBox ID="txtInfo" runat="server" Height="138px" TextMode="MultiLine" Width="391px"></asp:TextBox></td>
                <td style="height: 49px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtInfo"
                        ErrorMessage="* 必填项"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 83px; height: 4px">
                    联系人：</td>
                <td style="width: 399px; height: 4px">
                    <asp:TextBox ID="txtLinkMan" runat="server"></asp:TextBox></td>
                <td style="height: 4px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtLinkMan"
                        ErrorMessage="* 必填项"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 83px; height: 21px">
                    联系电话：</td>
                <td style="width: 399px; height: 21px">
                    <asp:TextBox ID="txtTel" runat="server"></asp:TextBox></td>
                <td style="height: 21px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtTel"
                        ErrorMessage="* 必填项"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 83px; height: 21px">
                    有效天数：</td>
                <td style="width: 399px; height: 21px">
                    <asp:TextBox ID="txtDay" runat="server"></asp:TextBox></td>
                <td style="height: 21px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtDay"
                        ErrorMessage="* 必填项"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtDay"
                        ErrorMessage="(只能输入整数)" MaximumValue="100" MinimumValue="1" Type="Integer"></asp:RangeValidator></td>
            </tr>
            <tr>
                <td style="width: 83px; height: 70px">
                </td>
                <td style="width: 399px; height: 70px" align="center">
                    <asp:ImageButton ID="imgBtnAdd" runat="server" AlternateText="信息发布" Height="46px"
                        OnClick="imgBtnAdd_Click" Width="145px" ImageUrl="~/images/kaishifa.jpg" /></td>
                <td style="height: 70px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
