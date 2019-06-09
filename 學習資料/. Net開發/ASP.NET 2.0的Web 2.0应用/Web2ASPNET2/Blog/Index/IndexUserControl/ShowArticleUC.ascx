<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ShowArticleUC.ascx.cs" Inherits="Index_IndexUserControl_ShowArticleUC" %>
<table class="Text" cellpadding="2" width="100%" cellspacing="0" border="0" bordercolor="#daeeee">
	<tr>
		<td colspan="2" align="left" bgcolor="#0066cc"><%# UserName %>&nbsp;发表于：<%# CreateDate %> | <a href="#">评论(<%# CommentCount %>)</a></td>
	</tr>
	<tr>
		<td colspan="2" align="left" bgcolor="#9999cc"><%# Name%></td>
	</tr>
	<tr>
		<td align="left"><br />　　<%# Body.ToString().Replace("\n","<br>") %></td>
	</tr>
</table>