<%@ Page Language="C#" AutoEventWireup="true" CodeFile="leftMenu.aspx.cs" Inherits="Manage_leftMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body,td,th {
	color: #D7D7D7;
}
body {
	background-color: #EAEAEA;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="css/css.css" rel="stylesheet" type="text/css">
    
 <style type="text/css">
BODY {
	BACKGROUND:799ae1; MARGIN: 0px;
}

.sec_menu {
	BORDER-RIGHT: white 1px solid; BACKGROUND: #d6dff7; OVERFLOW: hidden; BORDER-LEFT: white 1px solid; BORDER-BOTTOM: white 1px solid
}

.menu_title SPAN {
	FONT-WEIGHT: bold; LEFT: 10px; COLOR: #215dc6; POSITION: relative; TOP: 2px 
}

.menu_title2 SPAN {
	FONT-WEIGHT: bold; LEFT: 10px; COLOR: #428eff; POSITION: relative; TOP: 2px
}

</style>

<script> 

function showmenu(sid) 
{ 
menu = eval("menu" + sid); 
imgmenu = eval("imgmenu" + sid); 
if (menu.style.display == "none") 
{ 
eval("menu" + sid + ".style.display=\"block\";"); 

imgmenu.background="../images/menuup.gif"; 

} 
else 
{ 
eval("menu" + sid + ".style.display=\"none\";"); 
imgmenu.background="../images/menudown.gif"; 
} 
}
</script> 
</head>
<body style="text-align: left">
    <form id="form1" runat="server">
    <div>
        &nbsp;</div>
        <br />

<table cellspacing="0" cellpadding="0" align="center" style="width: 160px; height: 86px; "> 
	<tr > 
		 
    <td id="imgmenu1" class="menu_title"　 onmouseover="this.className='menu_title2';" background="../images/menudown.gif" onclick="showmenu(1)" onmouseout="this.className='menu_title';" style="cursor:hand"  height="25">  
      <span style="background-image: url(Image/menudown.gif)">公告管理</span></td> 
	</tr> 
 
	<tr> 
		<td id="menu1" style="display: none;"> 
		<div class="chengse" style="WIDTH: 158px"> 
			 
        <table cellspacing="3" cellpadding="0" width="130" align="center"> 
          <tr>  
            <td class="chengse" ><a target="rightFrame"   
            href="manage_issuanceBulletin.aspx">发布公告</a></td> 
          </tr> 
          <tr>  
            <td class="chengse" ><a target="rightFrame" href="manage_bulletin.aspx">公告管理</a></td> 
          </tr>           
        </table> 
		</div> 
	
		</td> 
	</tr> 
 
	<tr> 
		 
    <td id="imgmenu2" class="menu_title" onmouseover="this.className='menu_title2';" onclick="showmenu(2)" onmouseout="this.className='menu_title';"　 background="../images/menudown.gif"　style="cursor:hand"  height="25">  
      <span>教程管理</span></td> 
	</tr> 
	<tr> 
		<td id="menu2" style="DISPLAY: none"> 
		<div  class="chengse" style="WIDTH: 158px"> 
			 
        <table cellspacing="3" cellpadding="0" width="130" align="center"> 
          <tr>  
            <td class="chengse"><a target="rightFrame" href="manage_inssuanceTutorial.aspx">发布教程</a></td> 
          </tr> 
          <tr>  
            <td class="chengse"><a target="rightFrame" href="manage_video.aspx">视频管理</a></td> 
          </tr>        
          <tr>  
            <td class="chengse"><a target="rightFrame" href="manage_sound.aspx">语音管理</a></td> 
          </tr>             
        </table> 
		</div> 
	
		</td> 
	</tr> 
 
	<tr> 
		 
    <td id="imgmenu3" class="menu_title" onmouseover="this.className='menu_title2';"　 onclick="showmenu(3)" onmouseout="this.className='menu_title';"  background="../images/menudown.gif" style="cursor:hand"  height="25">  
      <span>用户管理&nbsp;</span></td> 
	</tr> 
	<tr> 
		<td id="menu3" style="DISPLAY: none"> 
		<div class="chengse" style="WIDTH: 158px"> 
			<table cellspacing="3" cellpadding="0" width="130" align="center"> 
				<tr> 
            <td class="chengse"><a target="rightFrame" href="manage_user.aspx">用户管理</a></td> 
          </tr> 
			
			</table> 
			
		</div> 
		
		</td> 
	</tr> 
	
 
</table>         
            <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 156px; height: 43px">
                <tr>
                    <td style="width: 100px">
                    <img src="../images/www.GIF" height="50" style="width: 162px">
                    </td>
                </tr>
            </table>        
    </form>
</body>
</html>
