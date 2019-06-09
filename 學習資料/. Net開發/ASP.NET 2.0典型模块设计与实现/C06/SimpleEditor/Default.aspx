<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
 <script language="javascript">
     //设置编辑模式，让iframe具有编辑功能。
     function document.onreadystatechange()  
    {  
        testEdit.document.designMode="On";  
    }  
    
     //字体特效 - 加粗
     function addBold()
     {
      //获得选取的焦点
      testEdit.focus();
      //获取用户选中的内容
      var sel = testEdit.document.selection.createRange();
      //为选中内容设置特效
      insertHTML("<b>"+sel.text+"</b>");
     }
     
     //字体特效 - 斜体
     function addItalic()
     {
      //获得选取的焦点
      testEdit.focus();
      var sel = testEdit.document.selection.createRange();
      //为选中内容设置特效
      insertHTML("<i>"+sel.text+"</i>");
     }
     
     //字体特效 - 下划线
     function addUnderline()
     {
      //获得选取的焦点
      testEdit.focus();
      var sel = testEdit.document.selection.createRange();
      //为选中内容设置特效
      insertHTML("<u>"+sel.text+"</u>");
     }
     
     //为内容添加HTML标记
     function insertHTML(html)
     {
         if (testEdit.document.selection.type.toLowerCase() == "none")
         {
             testEdit.document.selection.clear() ;
         }
         testEdit.document.selection.createRange().pasteHTML(html) ; 
     }
  </script>
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width: 438px">
            <tr>
                <td style="width: 494px">
                    <input id="Button3" type="button" value="黑体" onclick="addBold()" />
                    <input id="Button4" type="button" value="斜体" onclick="addItalic()"/>
                    <input id="Button5" type="button" value="下划线" onclick="addUnderline()"/>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 494px">
                    <IFRAME id="testEdit" style="WIDTH: 100%; HEIGHT: 280px" marginWidth=“0”
                     marginHeight=“0”></IFRAME>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
