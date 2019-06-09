<%@ Application Language="C#" %>
<%@ Import Namespace="Web2ASPNET2.XmlBBS" %>
<%@ Import Namespace="Web2ASPNET2.CommonOperation" %>
<%@ Import Namespace="Web2ASPNET2.UserCommonOperation" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
		XmlBBS.SystemInit(Context.Server);
		if(Application[XmlBBS.XmlBBSTotalVisitNumber] == null)
		{
			Application[XmlBBS.XmlBBSTotalVisitNumber] = 1;
		}	
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  在应用程序关闭时运行的代码

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // 在出现未处理的错误时运行的代码

    }

    void Session_Start(object sender, EventArgs e) 
    {
		if(Application[XmlBBS.XmlBBSTotalVisitNumber] == null)
		{
			Application[XmlBBS.XmlBBSTotalVisitNumber] = 1;
		}
		else
		{
			Application[XmlBBS.XmlBBSTotalVisitNumber]
				= DataTypeConvert.ConvertToInt(Application[XmlBBS.XmlBBSTotalVisitNumber].ToString()) + 1;
		}	
    }

    void Session_End(object sender, EventArgs e) 
    {
		if(Application[XmlBBS.XmlBBSTotalVisitNumber] == null)
		{
			Application[XmlBBS.XmlBBSTotalVisitNumber] = 1;
		}
		else
		{
			Application[XmlBBS.XmlBBSTotalVisitNumber]
				= DataTypeConvert.ConvertToInt(Application[XmlBBS.XmlBBSTotalVisitNumber].ToString()) - 1;
		}
    }
       
</script>
