using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;

public partial class CreateImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ////生成4位验证码
        //Response.Write(CreateValidate(4));

        //生成底色图片的4位验证码
        CreateImageM(CreateValidate(4));
    }
    /// <summary>
    /// 创建验证码
    /// </summary>
    /// <param name="count">验证码的位数</param>
    /// <returns>生成的随机验证码</returns>
    private string CreateValidate(int count)
    {
        //定义验证码中所有的字符
        string allchar = "1,2,3,4,5,6,7,8,9,0,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,W,X,Y,Z";
        //将验证码中所有的字符保存在一个字符串数组中
        string[] allchararray = allchar.Split(',');
        //初始化一个随机数
        string randomcode = "";
        int temp = -1;
        //生成一个随机对象
        Random rand = new Random();
        //根据验证码的位数循环
        for (int i = 0; i < count; i++)
        {
            //主要是防止生成相同的验证码
            if (temp != -1)
            {
                //加入时间的刻度
                rand = new Random(i * temp * ((int)DateTime.Now.Ticks));
            }
            int t = rand.Next(35);
            if (temp == t)
            {
                //相等的话重新生成
                return CreateValidate(count);
            }
            temp = t;
            randomcode += allchararray[t];
        }
        //在Session中保存随机验证码
        Session["Valid"] = randomcode;
        //返回生成的随机字符
        return randomcode;
    }
    /// <summary>
    /// 生成验证码背景图片
    /// </summary>
    /// <param name="validateCode">验证码</param>
    private void CreateImageM(string validateCode)
    {
        //图像的宽度-与验证码的长度成一定比例
        int iwidth = (int)(validateCode.Length * 11.5);
        //创建一个长20，宽iwidth的图像对象
        System.Drawing.Bitmap image = new System.Drawing.Bitmap(iwidth, 20);
        //创建一个新绘图对象
        Graphics g = Graphics.FromImage(image);
        //绘图用的字体和字号
        Font f = new System.Drawing.Font("Arial", 10, System.Drawing.FontStyle.Bold);
        //绘图用的刷子大小
        Brush b = new System.Drawing.SolidBrush(Color.White);
        //清除背景色，并以深橄榄绿的颜色填充
        g.Clear(Color.DarkOliveGreen);
        //格式化刷子属性-用指定的刷子、颜色等在指定的范围内画图
        g.DrawString(validateCode, f, b, 3, 3);
        //创建铅笔对象
        Pen blackPen = new Pen(Color.Black, 0);
        //创建随机对象
        Random rand = new Random();
        //随机画线
        for (int i = 0; i < 5; i++)
        {
            int y = rand.Next(image.Height);
            g.DrawLine(blackPen, 0, y, image.Width, y);
        }
        //输出绘图
        System.IO.MemoryStream ms = new System.IO.MemoryStream();
        //将图像保存到指定的流
        image.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
        Response.ClearContent();
        //配置输出类型
        Response.ContentType = "image/Jpeg";
        //输出内容
        Response.BinaryWrite(ms.ToArray());
        //清空不需要的资源
        g.Dispose();
        image.Dispose();
    }
}
