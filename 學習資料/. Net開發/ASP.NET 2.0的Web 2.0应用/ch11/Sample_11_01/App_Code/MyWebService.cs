using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class MyWebService : System.Web.Services.WebService
{
	public MyWebService()
	{
		       
    }

	[WebMethod(Description="计算两个数的和")]
	public int Add(int leftValue,int rightValue)
	{
		return leftValue + rightValue;
	}

	[WebMethod(Description = "计算两个数的差")]
	public int Sub(int leftValue,int rightValue)
	{
		return leftValue - rightValue;
	}

	[WebMethod(Description = "计算两个数的积")]
	public int Multiply(int leftValue,int rightValue)
	{
		return leftValue * rightValue;
	}

	[WebMethod(Description = "计算两个数的除")]
	public int Divide(int leftValue,int rightValue)
	{   ///如果除数为0，则抛出异常
		if(rightValue == 0)
		{
			throw new Exception("除数为0");
		}
		return leftValue / rightValue;
	}    
}
