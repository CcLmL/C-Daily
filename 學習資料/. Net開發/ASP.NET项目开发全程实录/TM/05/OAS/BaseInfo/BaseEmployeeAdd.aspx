<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BaseEmployeeAdd.aspx.cs" Inherits="BaseInfo_BaseEmployeeAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" border="0" cellspacing="0" class="css" style="width: 616px;
            height: 1px">
            <tr>
                <td align="center" class="csstitle" colspan="2">
                    －＝注册员工基本信息＝－</td>
            </tr>
            <tr>
                <td align="right" style="width: 177px; height: 3px">
                    员工姓名：</td>
                <td style="width: 566px; height: 3px">
                    <asp:TextBox ID="txtName" runat="server" CssClass="inputcss" Width="140px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="requiredfieldvalidator1" runat="server" ControlToValidate="txtName"
                        ErrorMessage="**　必填项"></asp:RequiredFieldValidator></td>
            </tr>
            <tr style="color: #000000">
                <td align="right" style="width: 177px; height: 37px; vertical-align: bottom;">
                    员工性别：</td>
                <td style="width: 566px; height: 37px; vertical-align: bottom;">
                    <asp:DropDownList ID="dlSex" runat="server" CssClass="inputcss" Width="60px">
                        <asp:ListItem>男性</asp:ListItem>
                        <asp:ListItem>女性</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <asp:Image ID="Image1" runat="server" AlternateText="相 片" Width="76px" />
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 177px">
                    相片路径：</td>
                <td style="width: 566px">
                    <input id="File1" runat="server" class="inputcss" style="width: 335px" type="file" />&nbsp;
                    <asp:ImageButton ID="ImageButton3" runat="server" AlternateText="上传图片" OnClick="ImageButton3_Click" ImageUrl="~/images/shangchuan.gif" /></td>
            </tr>
            <tr>
                <td align="right" style="width: 177px">
                    出生日期：</td>
                <td style="width: 566px">
                    <asp:TextBox ID="txtBirthday" runat="server" CssClass="inputcss" Width="140px"></asp:TextBox>(例:2006-01-01)
                    <asp:CompareValidator ID="comparevalidator1" runat="server" ControlToValidate="txtBirthday"
                        ErrorMessage="(格式:yyyy-mm-dd)" Operator="datatypecheck" Type="date" Width="113px"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" ControlToValidate="txtBirthday"
                        ErrorMessage="**　必填项"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="right" style="width: 177px; height: 2px">
                    学 历：</td>
                <td style="width: 566px; height: 2px">
                    <asp:TextBox ID="txtLearn" runat="server" CssClass="inputcss" Width="140px"></asp:TextBox>
                    <asp:CustomValidator ID="customvalidator1" runat="server" ControlToValidate="txtLearn"
                        ErrorMessage="**　必填项"></asp:CustomValidator></td>
            </tr>
            <tr style="color: #000000">
                <td align="right" style="width: 177px; height: 25px">
                    员工职称：</td>
                <td style="width: 566px; height: 25px">
                    <asp:TextBox ID="txtPost" runat="server" CssClass="inputcss" Width="140px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="requiredfieldvalidator2" runat="server" ControlToValidate="txtpost"
                        ErrorMessage="**　必填项"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="right" style="width: 177px">
                    部门：</td>
                <td style="width: 566px">
                    <asp:DropDownList ID="dlDepartment" runat="server" DataTextField="name" DataValueField="name"
                        Width="140px">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td align="right" style="width: 177px">
                    职位：</td>
                <td style="width: 566px">
                    <asp:DropDownList ID="dlJob" runat="server" Width="140px">
                        <asp:ListItem>董事长</asp:ListItem>
                        <asp:ListItem>总经理</asp:ListItem>
                        <asp:ListItem>副总经理</asp:ListItem>
                        <asp:ListItem>部门经理</asp:ListItem>
                        <asp:ListItem>部门主管</asp:ListItem>
                        <asp:ListItem>普通职员</asp:ListItem>
                        <asp:ListItem>秘书长</asp:ListItem>
                        <asp:ListItem>秘书</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td align="right" style="width: 177px">
                    手机号码：</td>
                <td style="width: 566px">
                    <asp:TextBox ID="txtTel" runat="server" CssClass="inputcss" Width="140px"></asp:TextBox>&nbsp;
                    <asp:RegularExpressionValidator ID="regularexpressionvalidator2" runat="server" ControlToValidate="txttel"
                        ErrorMessage="**　格式不正确　例如:136****1234" ValidationExpression="\d{11}"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator5" runat="server" ControlToValidate="txtTel"
                        ErrorMessage="**　必填项"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="right" style="width: 177px">
                    地址：</td>
                <td style="width: 566px">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="inputcss" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="requiredfieldvalidator3" runat="server" ControlToValidate="txtaddress"
                        ErrorMessage="**　必填项"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="right" style="width: 177px">
                    e_mail:</td>
                <td style="width: 566px">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="inputcss" Width="200px"></asp:TextBox>&nbsp;
                    <asp:RegularExpressionValidator ID="regularexpressionvalidator3" runat="server" ControlToValidate="txtemail"
                        ErrorMessage="**　格式不正确" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td align="right" style="width: 177px">
                    状态：</td>
                <td style="width: 566px">
                    <asp:DropDownList ID="dlState" runat="server" Width="60px">
                        <asp:ListItem>在职</asp:ListItem>
                        <asp:ListItem>离职</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td align="center" colspan="2" style="height: 2px">
                    <asp:ImageButton ID="imgBtnSave" runat="server" AlternateText="保 存" OnClick="imgBtnSave_Click" ImageUrl="~/images/save.gif" />
                    &nbsp;
                    <asp:ImageButton ID="imgBtnClear" runat="server" AlternateText="清　空" OnClick="imgBtnClear_Click" ImageUrl="~/images/qingkong.gif" /></td>
            </tr>
            <tr>
                <td align="center" colspan="2" style="height: 1px">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
