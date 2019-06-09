<%@ Page Language="C#" AutoEventWireup="true" CodeFile="imagery.aspx.cs" Inherits="Manger_imagegallery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>上传商品图片</title>
</head>
<body style ="font-family :宋体; font-size :9pt;">
    <form id="form1" runat="server">
    <div style="background-image: url()">
     <table cellSpacing="0" cellPadding="0" width="560" align="center" border="0">
				<tr>
					<td height="25" align="left" style ="font-family :宋体; font-size :9pt;">
                        &nbsp;上传商品图片
                    </td>	
				<tr>
				<tr>
				   <td>
    				  <table cellSpacing="0" cellPadding="0" width=95% align="center" border="0">
    				    <tr>
                            <tr>
		                    <td valign=top style="height: 25px">
		                     <asp:FileUpload ID="imageUpload" runat="server" Font-Size="9pt" />
        		           
                                <asp:button id="UploadImage" Text="上传" runat="server" onclick="UploadImage_OnClick" /></td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="labIamge" runat="server" Font-Bold="True" Font-Size="9pt" ></asp:Label></td>
                        </tr>
				        <tr>
					        <td height="23">
                                <asp:DataList ID="dlImage" runat="server"   RepeatDirection="Horizontal" RepeatColumns="4" OnDeleteCommand="dlImage_DeleteCommand">
                                    <ItemTemplate>
                                        <table style="width: 116px; height: 80px" >
                                            <tr valign =top align=left > 
                                            <td align="left" valign =top >
                                            
                                                <asp:Image ID="imgUrl"  runat="server"  ImageUrl='<%#DataBinder.Eval(Container.DataItem,"ImageUrl")%>'/></td>
                                                </tr>
                                            <tr>
                                            <td align="left" valign =top>
                                               <asp:Label ID="labImageName" runat="server" Font-Bold="True" Font-Names="隶商品" 
                                                    Text='<%#DataBinder.Eval(Container.DataItem,"ImageName")%>'></asp:Label>
                                                    </td>    
                                            </tr>
                                            <tr>
                                            <td align ="left" valign =top style="height: 19px" >
                                             <asp:LinkButton ID=lnkbtnDelete runat =server CommandName="delete"  CommandArgument =<%#DataBinder.Eval(Container.DataItem, "ImageID")%> >删除</asp:LinkButton>
                                            </td>
                                            </tr>
                                           
                                        </table>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:DataList></td>
				        </tr> 
				         <tr>
         <td style="width: 560px; text-align: left; font-size: 9pt; height: 16px;" >
             <asp:Label ID="labCP" runat="server" Text="当前页码为："></asp:Label>
                                [
                                <asp:Label ID="labPage" runat="server" Text="1"></asp:Label>
                                &nbsp;]
                                <asp:Label ID="labTP" runat="server" Text="总页码为："></asp:Label>
                                [
                                <asp:Label ID="labBackPage" runat="server"></asp:Label>
                                &nbsp;]<asp:LinkButton ID="lnkbtnOne" runat="server" Font-Underline="False" ForeColor="Red"
                                    OnClick="lnkbtnOne_Click">第一页</asp:LinkButton>
                                <asp:LinkButton ID="lnkbtnUp" runat="server" Font-Underline="False" ForeColor="Red"
                                    OnClick="lnkbtnUp_Click">上一页</asp:LinkButton>
                                <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" ForeColor="Red"
                                    OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="lnkbtnBack" runat="server" Font-Underline="False" ForeColor="Red"
                                    OnClick="lnkbtnBack_Click">最后一页</asp:LinkButton>&nbsp;&nbsp;</td>
        </tr> 
			</table>
				    </td>
				</tr>
			</table>
			
    </div>
    </form>
</body>
</html>
