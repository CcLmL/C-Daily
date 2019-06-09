<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href=<%= _styleSheet %> rel="stylesheet" />
   <%-- <link href="styles.css" rel="stylesheet" />--%>
        <script type="text/javascript" src="JScript.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="打印预览" />
                    <table width="640" cellpadding="0" cellspacing="0">
                <tbody>
                    <tr >
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <td ></td>
                        <td>
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td class="ReportTitle">员工个人信息</td>
                                    <td align="right"><asp:hyperlink id="PrintButton" navigateurl="javascript:Print()" 
                                    cssclass="printbutton" runat="server" visible="false">打印</asp:hyperlink></td>
                                </tr>
                                <tr >
                                    <td>
                                    </td>
                                </tr>
                            </table>
                            <asp:Repeater id="EmployeesList" runat="server" DataSourceID="SqlDataSource1">
                                <headertemplate>
                                    <table border="0" cellpadding="3" cellspacing="0" width="100%">
                                </headertemplate>
                                <itemtemplate>
                                    <tr>
                                        <td colspan="4" valign="top" class="HeaderStyleText">
                                            姓名:
                                            <%# Eval("EmployeeName") %>
                                        </td>
                                        <td class="HeaderStyleText"></td>
                                    </tr>
                                    <tr>
                                        <td  class="CategoryFooter"> </td>
                                        <td valign="top" class="CategoryFooter" >
                                            <%# Eval("Title") %>
                                        </td>
                                        <td valign="top" class="CategoryFooter">
                                            Address:<%# Eval("Address") %>
                                            <br>
                                            <%# Eval("City") %>
                                        </td>
                                        <td  class="CategoryFooter"> </td>
                                    </tr>
                                    <tr >
                                        <td colspan="5" valign="top" class="HeadSeparator">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td colspan="3"><%#Eval( "Notes") %>
                                        </td>
                                        <td></td>
                                    </tr>
                                </itemtemplate>
                                <separatortemplate>
                                    <tr >
                                        <td colspan="5" class="Headseparator">
                                        </td>
                                    </tr>
                                    <tr >
                                        <td colspan="5" class="separator">
                                        </td>
                                    </tr>
                                </separatortemplate>
                                <footertemplate>
            </table>
            </footertemplate> </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TestReportConnectionString %>"
                                SelectCommand="SELECT * FROM [Report_Employees]"></asp:SqlDataSource>
                            &nbsp;
                        </TD>
            <td ></td>
            </TR></TBODY></TABLE>


    </div>
    </form>
</body>
</html>
