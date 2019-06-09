using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Collections;

/// <summary>
/// GoodsClass 的摘要说明
/// </summary>
public class GoodsClass
{
    DBClass dbObj = new DBClass();
	public GoodsClass()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 对DataList控件进行绑定
    /// </summary>
    /// <param name="dlName">DataList控件名</param>
    /// <param name="dsTable">数据集DataSet的表的集合</param>
    public void dlBind(DataList dlName,DataTable dsTable)
    {
        if (dsTable != null)
        {
            dlName.DataSource = dsTable.DefaultView;
            dlName.DataKeyField = dsTable.Columns[0].ToString();
            dlName.DataBind();
        }
    }
    /// <summary>
    /// 商品类别菜单栏
    /// </summary>
    /// <param name="dlName">绑定商品类别名的DataList控件</param>
    public void DLClassBind(DataList dlName)
    {
        string sqlStr = "select Top 10 * from tb_Class";
        DataTable dsTable = dbObj.GetDataSetStr(sqlStr, "tbClass");
        dlBind(dlName, dsTable);
    }
    /// <summary>
    /// 在首页面中，绑定商品信息
    /// </summary>
    /// <param name="IntDeplay">商品分类标志</param>
    /// <param name="dlName">绑定商品的DataList控件</param>
    /// <param name="TableName">数据集标志</param>
    public void DLDeplayGI(int IntDeplay, DataList dlName, string TableName)
    {
        SqlCommand myCmd = dbObj.GetCommandProc("proc_DeplayGI");
        //添加参数
        SqlParameter Deplay = new SqlParameter("@Deplay", SqlDbType.Int, 4);
        Deplay.Value = IntDeplay;
        myCmd.Parameters.Add(Deplay);
        dbObj.ExecNonQuery(myCmd);
        DataTable dsTable = dbObj.GetDataSet(myCmd, TableName);
        dlBind(dlName, dsTable);
    }
   
    /// <summary>
    /// 最新商品菜单栏
    /// </summary>
    /// <param name="dlName">绑定最新商品的DataList控件</param>
    public void DLNewGoods(DataList dlName)
    {
        SqlCommand myCmd = dbObj.GetCommandProc("proc_NewGoods");
        dbObj.ExecNonQuery(myCmd);
        DataTable dsTable = dbObj.GetDataSet(myCmd, "tbGoods");
        dlBind(dlName, dsTable);
    }
    /// <summary>
    /// 获取商品类别名
    /// </summary>
    /// <param name="IntClassID">商品类别号</param>
    /// <returns>返回商品类别名</returns>
    public string GetClass(int IntClassID)
    {
        SqlCommand myCmd = dbObj.GetCommandProc("proc_GCN");
        //添加参数
        SqlParameter classID = new SqlParameter("@ClassID", SqlDbType.Int, 4);
        classID.Value = IntClassID;
        myCmd.Parameters.Add(classID);
        return dbObj.ExecScalar(myCmd).ToString();
    }
    /// <summary>
    /// 对商品信息进行模糊查询
    /// </summary>
    /// <param name="strKeyWord">关键信息</param>
    /// <returns>返回查询结果数据表DataTable</returns>
    public DataTable search(string strKeyWord)
    {
        SqlCommand myCmd = dbObj.GetCommandProc("proc_SearchGI");
        SqlParameter key = new SqlParameter("@keywords", SqlDbType.VarChar, 50);//添加参数
        key.Value = strKeyWord;
        myCmd.Parameters.Add(key);
        //执行操作
        dbObj.ExecNonQuery(myCmd);
        DataTable dsTable = dbObj.GetDataSet(myCmd, "tbBI");
        return dsTable;
    }
   
}
