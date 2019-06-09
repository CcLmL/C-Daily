using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Collections;

/// <summary>
/// 聊天信息处理类
/// </summary>
public class Chat
{
	public Chat()
	{
	}
    //用来保存聊天信息
    static protected ArrayList pArray = new ArrayList();
    /// <summary>
    /// 添加信息到数组中
    /// </summary>
    /// <param name="sDealer">聊天频道</param>
    /// <param name="sUser">用户</param>
    /// <param name="sMsg">信息</param>
    static public void AddMessage(string sDealer, string sUser, string sMsg)
    {
        string sAddText = sDealer + "*" + sUser + "*" + sMsg　+ "<br>";
        pArray.Add(sAddText);
        //判断数组内信息大于200时
        if (pArray.Count > 200)
        {
            //移出数组中的最后10条
            pArray.RemoveRange(0, 10);
        }
    }
    /// <summary>
    /// 获取所有的信息
    /// </summary>
    /// <param name="sDealer">聊天频道</param>
    /// <returns>返回信息</returns>
    static public string GetAllMessages(string sDealer)
    {
        //返回变量
        string sResponse = "";
        //遍历数组内的聊天信息
        for (int i = 0; i < pArray.Count; i++)
        {
            //所有聊天信息聚合
            sResponse = sResponse +
                FormatChat(pArray[i].ToString(), sDealer);
        }
        //返回所有聊天信息
        return (sResponse);
    }
    /// <summary>
    /// 格式化聊天信息
    /// </summary>
    /// <param name="sLine">行</param>
    /// <param name="sDealer">聊天频道</param>
    /// <returns>聊天信息</returns>
    static private string FormatChat(string sLine, string sDealer)
    {
        int iFirst = sLine.IndexOf("*");
        int iLast = sLine.LastIndexOf("*");
        //格式化显示数组中保存的聊天信息。
        string sDeal = sLine.Substring(0, iFirst);
        if (sDeal != sDealer)
            return ("");
        //取聊天信息中的用户名
        string sUser = sLine.Substring(iFirst + 1, iLast - (iFirst + 1));
        string sMsg = sLine.Substring(iLast + 1);

        //粗体显示用户名
        string sRet = "<B>" + sUser + ": </B>" + sMsg + "";
        return (sRet);
    }
}
