<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manageEntry.aspx.cs" Inherits="manageEntry" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="css/css.css" rel="stylesheet" type="text/css">
</head>
<body>
    <form id="form1" runat="server">
    <div valign="middle"  style="text-align: center">
    <table cellpadding="0" cellspacing="0" style="width: 97%; height: 98%">
  <tr>
    <td><table width="100%" height="293" cellpadding="0" cellspacing="0">
      <tr>
        <td height="293" background="images/bei.GIF" valign="middle"><table width="454" height="37" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="454" height="293" background="images/htbj.JPG"><table width="320" height="184" align="right">
              <tr>
                <td height="98" valign="bottom"><table width="182" height="151" align="right" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="20">&nbsp;</td>
                  </tr>
                  <tr>
                    <td height="15" class="chengse"><span class="danhuang">用户名：<asp:TextBox ID="txtName" runat="server" Width="80px"></asp:TextBox></span>                      </td>
                  </tr>
                  <tr>
                    <td class="chengse" style="height: 14px"><span class="danhuang">密&nbsp; 码：</span>
                        <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Width="80px"></asp:TextBox>                    </td>
                  </tr>
                  <tr>
                    <td height="34" valign="top">
                        &nbsp;<table width="97" height="21" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="75" style="height: 21px">
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/dengl.jpg" OnClick="ImageButton1_Click" /></td>
                        <td width="27" style="height: 21px">
                            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="images/quxiao.jpg" /></td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
    </div>
    </form>
</body>
</html>
