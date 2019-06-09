using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Xml;
using System.IO;

/// <summary>
/// 论坛类别的操作类
/// </summary>
public class BBSManager
{
    //定义常量表示字段名称或SQL语句。
    private const string SQL_INSERT_BBSINFO = "INSERT INTO bbsinfo VALUES "+
        "(@title,@filename,@posttime,@replycount,@lastreplytime, @postuser,@categoryid)";
    private const string PARM_BBS_TITLE = "@title";
    private const string PARM_BBS_FILENAME = "@filename";
    private const string PARM_BBS_POSTTIME = "@posttime";
    private const string PARM_BBS_REPLYCOUNT = "@replycount";
    private const string PARM_BBS_LASTREPLYTIME = "@lastreplytime";
    private const string PARM_BBS_POSTUSER = "@postuser";
    private const string PARM_BBS_CATEGORYID = "@categoryid";
    private string xmlfilename = "";
	public BBSManager()
	{
	}
    /// <summary>
    /// 添加论坛的类别
    /// </summary>
    /// <param name="name">类别名称</param>
    /// <param name="des">类别描述信息</param>
    /// <returns>添加是否成功</returns>
    public bool AddBBSCategory(string name,string des )
    {
        //使用StringBuild连接字符串比使用“+”效率高很多
        StringBuilder strSQL = new StringBuilder();
        //创建论坛添加方法的参数
        SqlParameter[] newsParms = new SqlParameter[]{
            new SqlParameter("@name", SqlDbType.NVarChar,20),
            new SqlParameter("@des", SqlDbType.NVarChar,100)};

        //创建执行语句的SQL命令
        SqlCommand cmd = new SqlCommand();
        // 依次给参数赋值
        newsParms[0].Value = name;
        newsParms[1].Value = des;

        //遍历所有参数，并将参数添加到SqlCommand命令中
        foreach (SqlParameter parm in newsParms)
            cmd.Parameters.Add(parm);
        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //加载“添加类别”执行语句
            strSQL.Append("Insert into BBSCategory values(@name,@des)");
            //打开数据库连接，执行命令
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
            //执行添加的SqlCommand命令
            int val = cmd.ExecuteNonQuery();
            //清空SqlCommand命令中的参数
            cmd.Parameters.Clear();
            //判断是否添加成功，注意返回的是添加是否成功，不是影响的行数
            if (val > 0)
                return true;
            else
                return false;
        }
    }
    /// <summary>
    /// 将发帖内容保存到XML文件中的方法
    /// </summary>
    /// <param name="filename">XML文件路径全名</param>
    /// <param name="title">XML文件路径全名</param>
    /// <param name="content">XML文件路径全名</param>
    /// <param name="user">XML文件路径全名</param>
    public void AddXML(string filename,string title,string content,string user)
    {
        //初始化XML文档操作类
        XmlDocument mydoc = new XmlDocument();
        //加载指定的XML文件
        mydoc.Load(filename);

        //添加元素-帖子主题
        XmlElement ele = mydoc.CreateElement("title");
        XmlText text = mydoc.CreateTextNode(title);
        //添加元素-发帖时间
        XmlElement ele1 = mydoc.CreateElement("posttime");
        XmlText text1 = mydoc.CreateTextNode(DateTime.Now.ToString());
        //添加元素-内容
        XmlElement ele2 = mydoc.CreateElement("content");
        XmlText text2 = mydoc.CreateTextNode(content);
        //添加元素-发帖人
        XmlElement ele3 = mydoc.CreateElement("postuser");
        XmlText text3 = mydoc.CreateTextNode(user);

        //添加文件的节点-msgrecord
        XmlNode newElem = mydoc.CreateNode("element", "xmlrecord", "");
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

        //获取文件路径
        int index = filename.LastIndexOf(@"\");
        string path = filename.Substring(0, index);
        //新文件名
        path = path + @"\" + xmlfilename + "file.xml";
        //文件创建后必须关闭，否则其他程序无法调用
        FileStream mystream =File.Create(path);
        mystream.Close();

        //保存所有修改-到指定文件中:注意编码语言的选择
        XmlTextWriter mytw = new XmlTextWriter(path,Encoding.Default);
        mydoc.Save(mytw);
        mytw.Close();
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="title"></param>
    /// <param name="filename"></param>
    /// <param name="replycount"></param>
    /// <param name="categoryid"></param>
    public void AddMsg(string title,string user,int categoryid)
    {
        //使用StringBuild连接字符串比使用“+”效率高很多
        StringBuilder strSQL = new StringBuilder();
        //获取缓存参数，如果没有，此方法会自动创建缓存列表
        SqlParameter[] newsParms = GetParameters();
        //创建执行语句的SQL命令
        SqlCommand cmd = new SqlCommand();
        // 依次给参数赋值
        newsParms[0].Value = title;
        //一个获取文件名的私有方法
        newsParms[1].Value = getFilename().ToString();
        xmlfilename = getFilename().ToString();
        //注意发布的日期取当日
        newsParms[2].Value = DateTime.Now;
        //默认添加的回复数是0
        newsParms[3].Value = 0;
        newsParms[4].Value = DateTime.Now;
        newsParms[5].Value = user;
        newsParms[6].Value = categoryid;

        //遍历所有参数，并将参数添加到SqlCommand命令中
        foreach (SqlParameter parm in newsParms)
            cmd.Parameters.Add(parm);
        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            strSQL.Append(SQL_INSERT_BBSINFO);
            //打开数据库连接，执行命令
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
            //执行添加的SqlCommand命令
            int val = cmd.ExecuteNonQuery();
            //清空SqlCommand命令中的参数
            cmd.Parameters.Clear();
        }
    }
    /// <summary>
    /// 创建或获取缓存参数的私有方法
    /// </summary>
    /// <returns>返回参数列表</returns>
    private static SqlParameter[] GetParameters()
    {
        //将SQL_INSERT_NEWSINFO做为哈希表缓存的键值
        SqlParameter[] parms = SqlHelper.GetCachedParameters(SQL_INSERT_BBSINFO);

        //首先判断缓存是否已经存在
        if (parms == null)
        {
            //缓存不存在的情况下，新建参数列表
            parms = new SqlParameter[] {
                    new SqlParameter(PARM_BBS_TITLE, SqlDbType.NVarChar,50),
                    new SqlParameter(PARM_BBS_FILENAME, SqlDbType.NVarChar,100),
                    new SqlParameter(PARM_BBS_POSTTIME, SqlDbType.DateTime),
                    new SqlParameter(PARM_BBS_REPLYCOUNT, SqlDbType.Int),
                    new SqlParameter(PARM_BBS_LASTREPLYTIME, SqlDbType.DateTime),
                    new SqlParameter(PARM_BBS_POSTUSER, SqlDbType.NVarChar, 50),
                    new SqlParameter(PARM_BBS_CATEGORYID, SqlDbType.Int) };

            //将新建的参数列表添加到哈希表中缓存起来
            SqlHelper.CacheParameters(SQL_INSERT_BBSINFO, parms);
        }
        //返回参数数组
        return parms;
    }
    /// <summary>
    /// 更新数据库中的回复时间
    /// </summary>
    /// <param name="infoid">帖子的ID</param>
    /// <returns>是否更新成功</returns>
    public bool UpdateMsg(int infoid)
    {
        //使用StringBuild连接字符串比使用“+”效率高很多
        StringBuilder strSQL = new StringBuilder();
        //创建论坛添加方法的参数
        SqlParameter[] newsParms = new SqlParameter[]{
            new SqlParameter("@lastposttime", SqlDbType.DateTime),
            new SqlParameter("@infoid", SqlDbType.Int)};

        //创建执行语句的SQL命令
        SqlCommand cmd = new SqlCommand();
        // 依次给参数赋值
        newsParms[0].Value = DateTime.Now;
        newsParms[1].Value = infoid;

        //遍历所有参数，并将参数添加到SqlCommand命令中
        foreach (SqlParameter parm in newsParms)
            cmd.Parameters.Add(parm);
        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //加载“添加类别”执行语句
            strSQL.Append("UPDATE bbsinfo  SET replycount=replycount+1 ,  lastreplytime=@lastposttime  WHERE infoid=@infoid");
            //打开数据库连接，执行命令
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
            //执行添加的SqlCommand命令
            int val = cmd.ExecuteNonQuery();
            //清空SqlCommand命令中的参数
            cmd.Parameters.Clear();
            //判断是否添加成功，注意返回的是添加是否成功，不是影响的行数
            if (val > 0)
                return true;
            else
                return false;
        }
    }
    /// <summary>
    /// 给新建的xml文件起名
    /// </summary>
    /// <returns>返回的是最大号的ID+1</returns>
    private int getFilename()
    {
        int cardrule = 0;
        //设置SQL语句,取最大的ID值
        string strsql = "select top 1 infoid from bbsinfo order by infoid desc ";
        //调用SqlHelper访问组件的方法返回第一行第一列的值
        try
        {
            cardrule = (int)SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, strsql, null);
            //返回最大值+1
        }
        catch
        {
            //此时数据库中无数据
            cardrule = 0;
        }
        return cardrule +1;

    }
    /// <summary>
    /// 更新回复内容
    /// </summary>
    /// <param name="filename">文件名</param>
    /// <param name="title">回复主题</param>
    /// <param name="content">回复内容</param>
    /// <param name="user">回复人</param>
    public void UpdateXml(string filename,string title,string content,string user)
    {
        //初始化XML文档操作类
        XmlDocument mydoc = new XmlDocument();
        //加载指定的XML文件
        mydoc.Load(filename);

        //添加元素-帖子主题
        XmlElement ele = mydoc.CreateElement("title");
        XmlText text = mydoc.CreateTextNode(title);
        //添加元素-发帖时间
        XmlElement ele1 = mydoc.CreateElement("posttime");
        XmlText text1 = mydoc.CreateTextNode(DateTime.Now.ToString());
        //添加元素-内容
        XmlElement ele2 = mydoc.CreateElement("content");
        XmlText text2 = mydoc.CreateTextNode(content);
        //添加元素-发帖人
        XmlElement ele3 = mydoc.CreateElement("postuser");
        XmlText text3 = mydoc.CreateTextNode(user);

        //添加文件的节点-msgrecord
        XmlNode newElem = mydoc.CreateNode("element", "xmlrecord", "");
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
        //保存所有的修改
        mydoc.Save(filename);
    }
}
