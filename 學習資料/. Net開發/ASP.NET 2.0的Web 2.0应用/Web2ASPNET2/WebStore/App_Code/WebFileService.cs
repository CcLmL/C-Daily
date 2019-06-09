using System;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.IO;
using System.Data.SqlClient;

namespace Web2ASPNET2.WebStore
{
	/// <summary>
	/// WebFileService 的摘要说明
	/// </summary>
	[WebService(Namespace = "http://tempuri.org/")]
	[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
	public class WebFileService:System.Web.Services.WebService
	{

		public WebFileService()
		{
			//如果使用设计的组件，请取消注释以下行 
			//InitializeComponent(); 
		}

		/// <summary>
		/// 根据文件的地址获取文件的二进制数据
		/// </summary>
		/// <param name="fileFullPath"></param>
		/// <returns></returns>
		[WebMethod(BufferResponse=true,Description="获取文件")]
		public byte[] GetFileByFullPath(string fileFullPath)
		{
			byte[] fileData = null;
			///判断文件路径是否为空
			if(string.IsNullOrEmpty(fileFullPath) == true)
			{
				return fileData;
			}
			///判断文件是否存在
			if(System.IO.File.Exists(fileFullPath) == false)
			{
				return fileData;
			}

			FileStream fs = null;
			try
			{
				fs = System.IO.File.OpenRead(fileFullPath);
				if(fs == null) return fileData;
				///设置字节数组的长度
				fileData = new byte[fs.Length + 1];
				///读取数据
				fs.Read(fileData,0,(int)fs.Length);
				///返回文件的数据
				return fileData;
			}			
			finally
			{   ///关闭文件流
				if(fs != null)
				{
					fs.Close();
				}
			}
		}

		/// <summary>
		/// 根据文件保存在数据库中的ID值获取文件的二进制数据
		/// </summary>
		/// <param name="fileID"></param>
		/// <returns></returns>
		[WebMethod(BufferResponse = true,Description = "根据文件的ID值，从数据库中获取文件")]
		public byte[] GetFileByUrl(int fileID)
		{
			byte[] fileData = null;
			///从数据库中读取数据
			Web2ASPNET2.WebStore.File file = new Web2ASPNET2.WebStore.File();
			SqlDataReader dr = file.GetSingleFile(fileID);
			if(dr == null) return fileData;
			if(dr.Read())
			{   ///获取数据
				fileData = GetFileByFullPath(Server.MapPath("../" + dr["Url"].ToString()));
			}
			dr.Close();
			return fileData;
		}

		/// <summary>
		/// 根据文件保存在数据库中的ID值，从数据库中获取文件的二进制数据
		/// </summary>
		/// <param name="fileID"></param>
		/// <returns></returns>
		[WebMethod(BufferResponse = true,Description = "根据文件的ID值，从数据库中获取文件")]
		public byte[] GetFileByData(int fileID)
		{
			byte[] fileData = null;
			///从数据库中读取数据
			Web2ASPNET2.WebStore.File file = new Web2ASPNET2.WebStore.File();
			SqlDataReader dr = file.GetSingleFile(fileID);
			if(dr == null) return fileData;
			if(dr.Read())
			{   ///获取数据
				fileData = (byte[])dr["Data"];
			}
			dr.Close();
			return fileData;
		}
	}
}

