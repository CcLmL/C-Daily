using System;
using System.Web.Security;

/// <summary>
/// 用户的操作类
/// </summary>
public class UserManager
{
	public UserManager()
	{
    }
    //获取所有用户
    public MembershipUserCollection GetUsers()
    {
        return Membership.GetAllUsers();
    }
    //删除指定用户
    public void DeleteUser(string UserName)
    {
        Membership.DeleteUser(UserName);
    }
}
