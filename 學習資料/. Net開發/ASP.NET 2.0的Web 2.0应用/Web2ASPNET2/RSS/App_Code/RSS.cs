using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.ComponentModel;
using System.Collections;
using System.Collections.Generic;
using System.Net;
using System.IO;

namespace Web2ASPNET2.WebRSS
{
	/// <summary>
	/// RSS中的Item
	/// </summary>
	public class RSSItem
	{
		/// <summary>
		/// 保存值的字典
		/// </summary>
		private Dictionary<string,string> attributes;

		public RSSItem() 
		{   ///初始化字典
			if(attributes == null)
			{
				attributes = new Dictionary<string,string>();
			}
		}

		/// <summary>
		/// 属性Title
		/// </summary>
		public string Title
		{
			get { return GetValue("title"); }
			set { SetAttribute("title",value); }
		}

		/// <summary>
		/// 属性Link
		/// </summary>
		public string Link
		{
			get { return GetValue("link"); }
			set { SetAttribute("link",value); }
		}

		/// <summary>
		/// 属性Description
		/// </summary>
		public string Description
		{
			get { return GetValue("description"); }
			set { SetAttribute("description",value); }
		}

		/// <summary>
		/// 索引器
		/// </summary>
		/// <param name="key"></param>
		/// <returns></returns>
		[Browsable(false)]
		public string this[string key]
		{
			get { return GetValue(key); }
		}

		/// <summary>
		/// 属性Attributes
		/// </summary>
		[Browsable(false)]
		public Dictionary<string,string> Attributes
		{
			get { return attributes; }
		}

		/// <summary>
		/// 设置属性的值
		/// </summary>
		/// <param name="name"></param>
		/// <param name="value"></param>
		public void SetAttribute(string name,string value)
		{
			if(string.IsNullOrEmpty(name) == true) return;
			string localName = name.ToLower();
			///判断键是否存在
			if(Attributes.ContainsKey(localName) == false)
			{
				Attributes.Add(localName,value.Trim());
			}
		}

		/// <summary>
		/// 获取属性的值
		/// </summary>
		/// <param name="name"></param>
		/// <returns></returns>
		protected string GetValue(string name)
		{
			return (attributes.ContainsKey(name) ? attributes[name] : null);
		}
	}

	/// <summary>
	/// RSS的频道
	/// </summary>
	public class RSSChannel:RSSItem
	{
		private const string RSSITEM = "item";
		private const string RSSCHANNEL = "channel";

		string url;
		/// <summary>
		/// 频道的Item集合
		/// </summary>
		private List<RSSItem> items;

		public RSSChannel() : base() 
		{ 
		}

		public RSSChannel(string url)
		{   ///初始化
			this.url = url;
			if(items == null)
			{
				items = new List<RSSItem>();
			}
		}

		/// <summary>
		/// 属性Items保存频道的Item项
		/// </summary>
		public List<RSSItem> Items
		{
			get
			{
				if(items == null)
				{
					items = new List<RSSItem>();
				}
				return items;
			}
		}
		
		/// <summary>
		/// 读取RSS的Channel
		/// </summary>
		public void ReadChannel()
		{
			if(string.IsNullOrEmpty(url) == true) return;
			///获取RSS网页的内容
			XmlTextReader reader = new XmlTextReader(url);
			string localName;
			while(reader.Read())
			{   ///获取当前节点名称
				localName = reader.LocalName.ToLower();
				///判断当前节点是否为元素类型
				if(reader.NodeType == XmlNodeType.Element)
				{
					if(localName == RSSITEM)
					{   ///读取Item
						items.Add(ReadItem(reader,RSSITEM));
					}
					///读取节点的内容值
					if(reader.MoveToContent() == XmlNodeType.Element)
					{
						string content = reader.ReadString();
						if(reader.NodeType == XmlNodeType.EndElement)
						{
							SetAttribute(reader.LocalName,content);
						}
					}
				}
			}
		}

		/// <summary>
		/// 读取RSS的Item项
		/// </summary>
		/// <param name="reader"></param>
		/// <param name="name"></param>
		/// <returns></returns>
		private RSSItem ReadItem(XmlTextReader reader,string name)
		{
			RSSItem item = new RSSItem();
			///读取Item节点的属性的值
			while(reader.Read())
			{
				if(reader.NodeType == XmlNodeType.Element)
				{   ///设置属性的值
					item.SetAttribute(reader.LocalName,reader.ReadString());
				}
				///结束循环
				if(reader.NodeType == XmlNodeType.EndElement && reader.LocalName.ToLower() == name)
				{
					break;
				}
			}
			return item;
		}
	}

	/// <summary>
	/// 处理简单的RSS
	/// </summary>
	public class SampleRss
	{
		public SampleRss()
		{
			///
		}

		/// <summary>
		/// 创建一个简单的RSS文档
		/// </summary>
		/// <param name="response"></param>
		/// <param name="items"></param>
		public void CreateSampleRss(HttpResponse response,params RSSItem[] items)
		{
			///创建写RSS文档的对象
			XmlTextWriter writer = new XmlTextWriter(response.OutputStream,System.Text.Encoding.UTF8);
			///写文档的头部
			WriteRSSHeader(writer);
			///写文档的Item
			foreach(RSSItem item in items)
			{
				WriteRSSItem(writer,item);
			}
			///写文档尾部
			WriteRSSTailer(writer);
			///缓存页面
			writer.Flush();
			writer.Close();
			///设置页面的输出格式
			response.ContentEncoding = System.Text.Encoding.UTF8;
			response.ContentType = "text/xml";
			response.Cache.SetCacheability(HttpCacheability.Public);
			response.End();
		}

		/// <summary>
		/// 输出RSS的文档开始部分
		/// </summary>
		/// <param name="writer">输出RSS的XmlTextWriter对象</param>
		/// <returns>返回XmlTextWriter</returns>
		private XmlTextWriter WriteRSSHeader(XmlTextWriter writer)
		{
			///输出RSS的版本信息
			writer.WriteStartDocument();
			writer.WriteStartElement("rss");
			writer.WriteAttributeString("version","2.0");

			//writer.WriteAttributeString("xmlns:blogChannel",
			//    "http://backend.userland.com/blogChannelModule");
			
			///输出RSS中的频道元素			
			writer.WriteStartElement("channel");

			///输出RSS中的标题
			writer.WriteElementString("title","Simple RSS Document");

			///输出RSS中的连接
			writer.WriteElementString("link","http://www.danielbright.net/");

			///输出RSS中的描述
			writer.WriteElementString("description",
				"A simple RSS document generated using XMLTextWriter");

			///输出RSS中的版权信息
			writer.WriteElementString("copyright","Copyright 2006-2007 梦海飞翔");

			return writer;
		}

		/// <summary>
		/// 输出RSS中的一个ITEM项
		/// </summary>
		/// <param name="writer">输出RSS的XmlTextWriter对象</param>
		/// <param name="title">ITEM项的标题</param>
		/// <param name="link">ITEM项的连接</param>
		/// <param name="description">ITEM项的描述</param>
		/// <returns>返回XmlTextWriter</returns>
		private XmlTextWriter WriteRSSItem(XmlTextWriter writer,string title,string link,
			string description)
		{
			writer.WriteStartElement("item");
			writer.WriteElementString("title",title);
			writer.WriteElementString("link",link);
			writer.WriteElementString("description",description);
			writer.WriteElementString("CreateDate",DateTime.Now.ToString("r"));
			writer.WriteEndElement();

			return writer;
		}

		/// <summary>
		/// 输出RSS中的一个ITEM项
		/// </summary>
		/// <param name="writer">输出RSS的XmlTextWriter对象</param>
		/// <param name="item">Item项</param>
		/// <returns></returns>
		private XmlTextWriter WriteRSSItem(XmlTextWriter writer,RSSItem item)
		{
			writer.WriteStartElement("item");
			foreach(string key in item.Attributes.Keys)
			{   ///输出每一个属性
				writer.WriteElementString(key,item.Attributes[key]);
			}			
			writer.WriteEndElement();

			return writer;
		}

		/// <summary>
		/// 输出RSS的文档结尾部分
		/// </summary>
		/// <param name="writer">输出RSS的XmlTextWriter对象</param>
		/// <returns>返回XmlTextWriter</returns>
		private XmlTextWriter WriteRSSTailer(XmlTextWriter writer)
		{
		    writer.WriteEndElement();
		    writer.WriteEndElement();
		    writer.WriteEndDocument();

		    return writer;
		}
	}
}
