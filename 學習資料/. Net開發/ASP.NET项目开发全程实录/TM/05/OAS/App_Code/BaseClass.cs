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
/// BaseClass 的摘要说明
/// </summary>
public class BaseClass : System.Web.UI.Page
{
    public BaseClass()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    #region 显示客户端对话框
    /// <summary>
    /// WebMessageBox用来在客户端弹出对话框。
    /// </summary>
    /// <param name="TxtMessage">对话框显示内容</param>
    /// <returns></returns>
    public string MessageBox(string TxtMessage)
    {
        string str;
        str = "<script language=javascript>alert('" + TxtMessage + "')</script>";
        return str;
    }
    #endregion

    #region  执行SQL语句
    /// <summary>
    /// 用来执行SQL语句
    /// </summary>
    /// <param name="sQueryString">sQueryString SQL字符串</param>
    /// <returns>操作是否成功(True\False)</returns>
    public Boolean ExecSQL(string sQueryString)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
        con.Open();
        SqlCommand dbCommand = new SqlCommand(sQueryString, con);
        if (dbCommand.ExecuteNonQuery() > 0)
        {
            con.Close();
            return true;
        }
        else
        {
            con.Close();
            return false;
        }
    }
    /// <summary>
    /// 公告信息添加
    /// </summary>
    /// <param name="title">标题</param>
    /// <param name="content">公告内容</param>
    /// <param name="person">发布公告人</param>
    /// <returns></returns>
    public Boolean ExecProcNotice(string title, string content, string person)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
        con.Open();
        SqlCommand cmd = new SqlCommand("insert_tb_notice", con);
        cmd.CommandType = CommandType.StoredProcedure;
        //公告标题
        SqlParameter pTitle = new SqlParameter("@noticeTitle", SqlDbType.VarChar, 40);
        pTitle.Value = title;
        cmd.Parameters.Add(pTitle);
        //公告内容
        SqlParameter pContent = new SqlParameter("@noticeContent", SqlDbType.Text, 0);  //0为Text默认存储的最大值
        pContent.Value = content;
        cmd.Parameters.Add(pContent);
        //公告人
        SqlParameter pPerson = new SqlParameter("@noticePerson", SqlDbType.VarChar, 20);
        pPerson.Value=person;
        cmd.Parameters.Add(pPerson);
        //判断运行结果
        if (cmd.ExecuteNonQuery() > 0)
        {
            con.Close();
            return true;
        }
        else
        {
            con.Close();
            return false;
        }
    }
    #endregion


    #region  查询SQL语句
    /// <summary>
    ///　执行查询ＳＱＬ语句
    /// </summary>
    /// <param name="sQueryString">sQueryString SQL字符串</param>
    /// <param name="TableName">TableName 数据表名称</param>
    /// <returns></returns>
    public System.Data.DataSet GetDataSet(string sQueryString, string TableName)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
        SqlDataAdapter dbAdapter = new SqlDataAdapter(sQueryString, con);
        DataSet dataset = new DataSet();
        dbAdapter.Fill(dataset, TableName);
        return dataset;
    }
    #endregion
}