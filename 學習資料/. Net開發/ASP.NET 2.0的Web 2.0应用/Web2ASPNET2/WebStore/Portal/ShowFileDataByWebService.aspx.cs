using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Web2ASPNET2.WebStore;
using Web2ASPNET2.CommonOperation;
using System.Data.SqlClient;

public partial class Portal_ShowFileDataByWebService:System.Web.UI.Page
{
	int fileID = -1;
	protected void Page_Load(object sender,EventArgs e)
	{	///获取文件信息的ID
		if(Request.Params["FileID"] != null)
		{
			fileID = DataTypeConvert.ConvertToInt(Request.Params["FileID"].ToString());
		}
		if(fileID > 0)
		{	///显示文件的信息
			Web2ASPNET2.WebStore.File file = new Web2ASPNET2.WebStore.File();
			SqlDataReader dr = file.GetSingleFile(fileID);
			if(dr == null) return;
			if(dr.Read())
			{   ///显示文件类型
				Response.ContentType = dr["Type"].ToString();
			}
			dr.Close();

			///调用Web服务，获取文件的数据
			WebFileService service = new WebFileService();
			byte[] fileData = service.GetFileByData(fileID);
			Response.Flush();
			Response.BinaryWrite(fileData);
			Response.End();
		}
	}
}
