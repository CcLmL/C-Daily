<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addBookInfo.aspx.cs" Inherits="addBookInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>添加图书信息</title>
    <link href="css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" background="Images/beijing.gif" border="0"
            cellpadding="0" cellspacing="0" height="371" width="340">
            <tr>
                <td>
                    <table align="center" border="0" cellpadding="0" cellspacing="0" style="height: 263px"
                        width="325">
                        <tr>
                            <td style="width: 85px; height: 16px">
                                <div align="right">
                    条形码：</div>
                            </td>
                            <td style="height: 16px" width="175">
                    <asp:TextBox ID="txtBarCode" runat="server" ReadOnly="True"></asp:TextBox></td>
                            <td style="height: 16px" width="76">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 85px">
                                <div align="right">
                    图书名称：</div>
                            </td>
                            <td>
                    <asp:TextBox ID="txtBookName" runat="server" Width="114px"></asp:TextBox></td>
                            <td>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorBookName" runat="server" ControlToValidate="txtBookName"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 85px">
                                <div align="right">
                    图书类型：</div>
                            </td>
                            <td>
                    <asp:DropDownList ID="ddlBookType" runat="server" Width="73px">
                    </asp:DropDownList></td>
                            <td>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAuthor" runat="server" ControlToValidate="txtAuthor"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 85px">
                                <div align="right">
                                    图书作者：</div>
                            </td>
                            <td>
                    <asp:TextBox ID="txtAuthor" runat="server" Width="116px"></asp:TextBox></td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 85px">
                                <div align="right">
                    出版社：</div>
                            </td>
                            <td>
                    <asp:TextBox ID="txtBookConcern" runat="server" Width="116px"></asp:TextBox></td>
                            <td>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorBookconcern" runat="server"
                        ControlToValidate="txtBookConcern" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 85px">
                                <div align="right">
                                    图书价格：</div>
                            </td>
                            <td>
                    <asp:TextBox ID="txtPrice" runat="server" Width="116px"></asp:TextBox></td>
                            <td>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorPrice" runat="server" ControlToValidate="txtPrice"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 85px">
                                <div align="right">
                    书架：</div>
                            </td>
                            <td>
                    <asp:DropDownList ID="ddlBookcase" runat="server" Width="74px">
                    </asp:DropDownList></td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align: center">
                                &nbsp;<asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="保　存" />
                    <input id="Button1" onclick="window.close()" type="button" value="关　闭" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
