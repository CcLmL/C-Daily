<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BaseDepartmentAdd.aspx.cs" Inherits="BaseInfo_BaseDepartmentAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table id="table1" align="center" border="0" class="css" style="width: 400px; height: 100px" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center" class="csstitle" colspan="3" style="height: 20px">
                    新建部门</td>
            </tr>
            <tr>
                <td align="right" style="width: 81px; height: 26px">
                    部门名称：</td>
                <td align="left" colspan="2" style="height: 26px">
                    <asp:TextBox ID="txtName" runat="server" CssClass="inputcss" Width="200px"></asp:TextBox><asp:RequiredFieldValidator
                        ID="requiredfieldvalidator1" runat="server" ControlToValidate="txtName" ErrorMessage="**　必填项"
                        SetFocusOnError="true" Width="72px"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="right" style="width: 81px; height: 26px">
                    部门描述：</td>
                <td colspan="2" style="height: 26px">
                    <asp:TextBox ID="txtContent" runat="server" Height="50px" Rows="8" TextMode="multiline"
                        Width="294px"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:ImageButton ID="imgBtnSave" runat="server" AlternateText="保　存" OnClick="imgBtnSave_Click" ImageUrl="~/images/save.gif" />
                    &nbsp;
                    <asp:ImageButton ID="imgBtnClear" runat="server" AlternateText="清　空" OnClick="imgBtnClear_Click" ImageUrl="~/images/qingkong.gif" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
