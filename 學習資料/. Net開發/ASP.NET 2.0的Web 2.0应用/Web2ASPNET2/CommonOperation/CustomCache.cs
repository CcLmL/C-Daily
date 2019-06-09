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
		{   ///�������Ƿ�Ϊ��
			if(cache == null) return;
			if(string.IsNullOrEmpty(key)) return;
			///��������
			cache.Insert(key,value);
		}

		public object GetValue(string key)
		{   ///�������Ƿ�Ϊ��
			if(cache == null) return null;
			if(string.IsNullOrEmpty(key)) return null;
			///��ȡ����
			return cache.Get(key);
		}
	}
}
