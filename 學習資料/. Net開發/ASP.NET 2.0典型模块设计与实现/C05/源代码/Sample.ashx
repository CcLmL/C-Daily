<%@ WebHandler Language="C#" Class="Sample" %>

using System;
using System.Web;
using RssToolkit;
public class Sample :GenericRssHttpHandlerBase
{
    protected override void PopulateChannel(string channelName, string userName)
    {
        //添加频道
        Channel["title"] = "Sample Channel";
        //如果频道名称不为空
        if (!string.IsNullOrEmpty(channelName))
        {
            //设置频道名称
            Channel["title"] += " '" + channelName + "'";
        }
        //如果访问用户名不为空
        if (!string.IsNullOrEmpty(userName))
        {
            //设置用户名名称
            Channel["title"] += " (generated for " + userName + ")";
        }
        //设置频道的默认其他属性
        //此处是简单阅读器的RSS
        Channel["link"] = "~/Default.aspx";
        Channel["description"] = "Channel For  Test in ASP.NET RSS";
        Channel["ttl"] = "10";
        Channel["name"] = channelName;
        Channel["user"] = userName;
        //定义项
        GenericRssElement item;
        //创建一个频道内的项
        item = new GenericRssElement();
        //为项的基本属性赋值
        item["title"] = "Complex";
        item["description"] = "Complex RSS using RssDataSource";
        item["link"] = "~/ComplexRSS.aspx";
        //将项添加到频道内
        Channel.Items.Add(item);

        //创建一个频道内的项
        item = new GenericRssElement();
        //为项的基本属性赋值
        item["title"] = "Simple";
        item["description"] = "Simple RSS is tested";
        item["link"] = "~/SimpleReader.aspx";
        //将项添加到频道内
        Channel.Items.Add(item);
    }
}