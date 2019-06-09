using System;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;

/// <summary>
/// GetOnline 的摘要说明
/// </summary>
public class GetOnline
{
	public GetOnline()
	{
	}
    /// <summary>
    /// 返回在线用户的集合
    /// </summary>
    /// <returns>所有在线用户</returns>
    public MembershipUserCollection GetUsers()
    {
        //定义一个新的用户集合用于存储在线用户
        MembershipUserCollection coll = new MembershipUserCollection();
        //遍历所有的用户，通过IsOnline属性挑选在线用户
        foreach (MembershipUser user in Membership.GetAllUsers())
        {
            //如果用户在线，就添加到新集合中
            if (user.IsOnline)
                coll.Add(user);
        }
        //返回新集合
        return coll;
    }
}
