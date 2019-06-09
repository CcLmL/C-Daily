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

public partial class controls_CardTypeSet : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //通过包含此控件的父级页面判断选择的是哪个功能
        //QueryString用于获取url中包含的参数
        string pageview =this.Parent.Page.Request.QueryString["PageView"];
        //加载此控件时，首先判断PageView的值
        switch (pageview)
        {
                
            case "AddCardType":
                TABLE1.Visible = true; //加载的是添加卡类型
                TABLE2.Visible = false;
                TABLE3.Visible = false;
                TABLE4.Visible = false;
                break;
            
            case "UpdateCardType":
                TABLE1.Visible = false;
                TABLE2.Visible = true; //加载的是修改卡类型名称
                TABLE3.Visible = false;
                TABLE4.Visible = false;
                break;
            
            case "UpdateRule":
                TABLE1.Visible = false; 
                TABLE2.Visible = false;
                TABLE3.Visible = true;//加载的是修改卡积分规则
                TABLE4.Visible = false;
                break;
            
            case "GetRule":
                TABLE1.Visible = false; 
                TABLE2.Visible = false;
                TABLE3.Visible = false;
                TABLE4.Visible = true;//加载的是获取卡积分规则
                break;
        }

    }
    //定义枚举类型用以判断选择的是哪个功能
    public enum PageSet
    {
        AddCardType ,
        UpdateCardType ,
        UpdateRule ,
        GetRule 
    }
    //默认属性选择的是“添加卡类型”功能
    private PageSet pageview = PageSet.AddCardType;

    //页面功能属性
    public PageSet PageView
    {
        get { return pageview; }
        set { pageview = value; }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //实现添加会员卡类型的功能

        //实例化一个会员卡类型实体
        CardTypeEntity mycard = new CardTypeEntity();

        //设置实体的属性
        mycard.CardTypeName = txttype.Text;
        //会员卡积分规则是数值型数据，必须进行类型转换
        mycard.CardRule = Int32.Parse(txtrule.Text);
        //实例化一个会员卡类型实体访问方法
        CardTypeDA myda = new CardTypeDA();
        bool result= myda.InsertCardType(mycard);
        //添加成功则清空屏幕
        if (result)
        {
            txttype.Text = "";
            txtrule.Text = "";
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //实现修改会员卡类型名称的功能

        //此处不需要实体类，直接调用实体方法
        CardTypeDA myda = new CardTypeDA();
        bool result = myda.UpdateCardTypeName(TextBox1.Text, TextBox2.Text);
        //修改成功，清空屏幕
        if (result)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        //实现修改积分规则的功能

        //实例化一个会员卡类型实体类
        CardTypeEntity myen = new CardTypeEntity();
        myen.CardTypeName = TextBox3.Text;
        myen.CardRule = Int32.Parse(TextBox4.Text);
        //实例化一个实体类访问方法
        CardTypeDA myda = new CardTypeDA();
        bool result=myda.UpdateCardRule(myen);
        //修改成功，清空屏幕
        if (result)
        {
            TextBox3.Text = "";
            TextBox4.Text = "";
        }

    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        //实现获取积分规则的功能

        //实例化实体访问方法
        CardTypeDA myda = new CardTypeDA();
        //调用获取积分规则的方法，并返回数值型积分规则
        int rule = myda.GetCardRule(TextBox5.Text);
        //将积分规则转换类型后显示在TextBox中
        TextBox6.Text = rule.ToString();
    }
}
