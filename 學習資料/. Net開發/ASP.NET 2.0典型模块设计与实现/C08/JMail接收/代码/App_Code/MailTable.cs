using System;
using System.Data;
using System.Web;
/// <summary>
/// 获取保存的表格信息
/// </summary>
public class MailTable
{
	public MailTable()
	{
	}
    public DataTable GetTable()
    {
        if (HttpContext.Current.Session["TABLE"] != null)
            return (DataTable)HttpContext.Current.Session["TABLE"];
        else
            return null;
    }
}
