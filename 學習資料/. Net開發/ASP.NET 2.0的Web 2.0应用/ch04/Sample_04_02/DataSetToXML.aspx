<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.Configuration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

	protected void Page_Load(object sender,EventArgs e)
	{   ///读取配置文件Web.Config中的连接字符串
		string connectiongString = ConfigurationManager.ConnectionStrings["WEB2ASPNET2DBConnectionString"].ConnectionString;
		///创建SqlConnection对象
		SqlConnection sqlCon = new SqlConnection(connectiongString);
		///定义填充数据的SQL语句
		string cmdText = "SELECT * FROM [User]";
		///定义执行填充数据的适配器
		SqlDataAdapter da = new SqlDataAdapter(cmdText,sqlCon);		
		
		try
		{   ///打开连接
			sqlCon.Open();
			
			///创建DataSet对象，并填充该对象
			DataSet ds = new DataSet();
			da.Fill(ds);

			///输出DataSet对象转换后的XML
			Response.Write("<?xml version=\"1.0\"?>");
			Response.Write(ds.GetXml());
			///设置页面输出格式
			Response.ContentType = "text/xml";
			Response.AppendHeader("title","数据集和XML转换");
			Response.End();			
		}
		catch(SqlException sqlex)
		{   ///如果连接失败，则显示错误信息
			Response.Write(sqlex.Message);
		}
		finally
		{   ///关闭已经打开的连接
			if(sqlCon != null)
			{
				sqlCon.Close();
			}
		}
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>数据集和XML转换</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>

