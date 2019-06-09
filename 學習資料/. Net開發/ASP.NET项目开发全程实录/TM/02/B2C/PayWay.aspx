<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PayWay.aspx.cs" Inherits="PayWay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <style >
    body{margin-top:0px}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;</div>
        &nbsp; &nbsp;&nbsp;
        <table style="width :633px; height :396px; background-image: url(images/背景.jpg); background-repeat :no-repeat" align =center >
            <tr>
                <td style="width: 363px;" >
                </td>
                <td style=" width: 270px;height: 100px" valign =bottom>
                     &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/中国工商银行.jpg" OnClick="ImageButton1_Click" /></td>
                
            </tr>
              <tr>
                <td style="width: 363px;" >
                </td>
                <td style="width: 270px;height: 56px"valign =bottom  align =center >
                    &nbsp; &nbsp; &nbsp; &nbsp;
                  
                    <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/images/中国农业银行.jpg" OnClick="ImageButton3_Click" /></td>
               
            </tr>
            <tr>
                <td style="width: 363px;" >
                </td>
                <td style="width: 270px;height: 56px"valign =bottom align =center >
                    <br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                   
                    <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/images/交通银行.jpg" OnClick="ImageButton4_Click" /></td>
               
            </tr>
            <tr >
                <td style="width: 363px; ">
                </td>
                <td style="width: 270px; height: 57px;" valign =bottom  align =center    >
                   <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/中国建设银行.jpg" OnClick="ImageButton2_Click" /></td>
                
            </tr>
            <tr>
                <td style="width: 363px;" >
                </td>
                <td style="width: 270px;height: 61px "valign =bottom>
                  
                   <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/images/上海普东银行.jpg" OnClick="ImageButton5_Click" /></td>
                
            </tr>
            <tr>
                <td style="width: 363px">
                </td>
                <td style="width: 270px;height: 45px" valign="bottom">
                </td>
            </tr>
          
        </table>
    </form>
</body>
</html>
