using System;
using System.Data;
using System.Configuration;
using System.Web;

using System.Xml;

/// <summary>
/// XML文件的读写类
/// </summary>
public class XMLRW
{
    /// <summary>
    /// 结构化函数
    /// </summary>
	public XMLRW()
	{
	}
    /// <summary>
    /// 写数据到XML文件中
    /// </summary>
    /// <param name="FileName">要打开的XML文件</param>
    /// <param name="name">发言人姓名</param>
    /// <param name="mail">发言人邮箱</param>
    /// <param name="content">发言内容</param>
    /// <param name="url">发言人的网址</param>
    public void WriteXML(string FileName,string name,string mail,string content,string url )
    {
        //初始化XML文档操作类
        XmlDocument mydoc = new XmlDocument();
        //加载指定的XML文件
        mydoc.Load(FileName);

        //添加元素-姓名
        XmlElement ele = mydoc.CreateElement("name");
        XmlText text = mydoc.CreateTextNode(name);
        //添加元素-邮箱
        XmlElement ele1 = mydoc.CreateElement("mail");
        XmlText text1 = mydoc.CreateTextNode(mail);
        //添加元素-内容
        XmlElement ele2 = mydoc.CreateElement("url");
        XmlText text2 = mydoc.CreateTextNode(url);
        //添加元素-网址
        XmlElement ele3 = mydoc.CreateElement("msg");
        XmlText text3 = mydoc.CreateTextNode(content);

        //添加文件的节点-msgrecord
        XmlNode newElem = mydoc.CreateNode("element", "msgrecord", "");
        //在节点中添加元素
        newElem.AppendChild(ele);
        newElem.LastChild.AppendChild(text);
        newElem.AppendChild(ele1);
        newElem.LastChild.AppendChild(text1);
        newElem.AppendChild(ele2);
        newElem.LastChild.AppendChild(text2);
        newElem.AppendChild(ele3);
        newElem.LastChild.AppendChild(text3);
        //将节点添加到文档中
        XmlElement root = mydoc.DocumentElement;
        root.AppendChild(newElem);
     
        //保存所有修改
        mydoc.Save(FileName);
    }
    /// <summary>
    /// 删除节点的方法
    /// </summary>
    /// <param name="filename">要修改的XML文件</param>
    /// <param name="tempXmlNode">节点的姓名值</param>
    public void DeleNote(string filename,string tempXmlNode)
    {
        //初始化XML文档操作类
        XmlDocument mydoc = new XmlDocument();
        //加载XML文件
        mydoc.Load(filename);
        //搜索有name元素的所有节点集
        XmlNodeList mynode = mydoc.SelectNodes("//name");

        //判断是否有节点
        if (!(mynode == null))
        {
            //遍历节点，找到符合条件的元素
            foreach (XmlNode xn in mynode)
            {
                if (xn.InnerXml == tempXmlNode)
                    //删除元素的父节点
                    xn.ParentNode.ParentNode.RemoveChild(xn.ParentNode);
            }
        }
    }
}
