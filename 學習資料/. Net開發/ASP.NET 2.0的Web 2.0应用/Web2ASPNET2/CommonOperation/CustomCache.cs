using System;
using System.Web.Caching;

namespace Web2ASPNET2.CommonOperation
{
	public class CustomCache
	{
		Cache cache;

		public CustomCache() { }

		public CustomCache(System.Web.Caching.Cache cache)
		{
			this.cache = cache;
		}

		public void AddValue(string key,object value)
		{   ///检测对象是否为空
			if(cache == null) return;
			if(string.IsNullOrEmpty(key)) return;
			///插入数据
			cache.Insert(key,value);
		}

		public object GetValue(string key)
		{   ///检测对象是否为空
			if(cache == null) return null;
			if(string.IsNullOrEmpty(key)) return null;
			///获取数据
			return cache.Get(key);
		}
	}
}
