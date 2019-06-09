<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
	string fileID = string.Empty;
	protected void Page_Load(object sender,EventArgs e)
	{
		if(Request.Params["FileID"] != null)
		{   ///获取文件的ID值
			fileID = Request.Params["FileID"].ToString();
		}
		
		///获取配置文件Web.config中的连接字符串
		string conString = ConfigurationManager.ConnectionStrings["WEB2ASPNET2DBConnectionString"].ConnectionString;
		///创建连接SQL Server数据库的SqlConnection对象
		SqlConnection myCon = new SqlConnection(conString);
		string cmdText = "SELECT * FROM [Files] WHERE ID = " + fileID;
		SqlCommand myCmd = new SqlCommand(cmdText,myCon);
		
		byte[] data = null;
		string name = string.Empty,type = string.Empty;
		try
		{
			myCon.Open();                            ///打开连接			
			SqlDataReader dr = myCmd.ExecuteReader();///获取被下载文件的数据
			if(dr == null)return;			
			
			if(dr.Read())
			{   ///读取文件的数据和类型
				data = (byte[])dr["Data"];
				name = dr["Name"].ToString();
				type = dr["Type"].ToString();
			}
			dr.Close();							
			Response.BinaryWrite(data);     ///输出文件的二进制数据			
			Response.ContentType = type;    ///设置网页的类型			
			Response.AddHeader(name,name);  ///设置网页的标题
		}
		catch(SqlException sqlex)
		{   ///如果连接失败，则显示错误信息
			Response.Write(sqlex.Message);
		}
		finally
		{   ///关闭已经打开的连接
			if(myCon != null)
			{
				myCon.Close();
			}
		}
		Response.End();		///中止页面的输出
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>下载文件</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
