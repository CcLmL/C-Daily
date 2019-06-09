using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Collections;

public partial class _Default : System.Web.UI.Page 
{
    CommonClass ccObj = new CommonClass();
    GoodsClass gcObj = new GoodsClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            RefineBind();
            HotBind();
            DiscountBind();
            ///*判断是否登录*/
            //ST_check_Login();
        }
    }
    public void ST_check_Login()
    {

        if ((Session["UserName"] == null))
        {
            Response.Write("<script>alert('对不起！您不是会员，请先注册！');location='Default.aspx'</script>");
            Response.End();
        }
    }
    //绑定市场价格
    public string GetVarMKP(string strMarketPrice)
    {
        return ccObj.VarStr(strMarketPrice, 2);
    }
    //绑定热卖价格
    public string GetVarHot(string strHotPrice)
    {
        return ccObj.VarStr(strHotPrice, 2);
    }
    protected void RefineBind()
    {
        gcObj.DLDeplayGI(1, this.dLRefine, "Refine");
    }
    protected void HotBind()
    {
        gcObj.DLDeplayGI(3, this.dlHot, "Hot");
    }
    protected void DiscountBind()
    {
        gcObj.DLDeplayGI(2, this.dlDiscount, "Discount");
    }
    public void AddressBack(DataListCommandEventArgs e)
    {
        Session["address"] = "";
        Session["address"] = "Default.aspx";
        Response.Redirect("~/showInfo.aspx?id=" + Convert.ToInt32(e.CommandArgument.ToString()));
    }

    protected void dLRefine_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "detailSee")
        {
            AddressBack(e);
        }
        else if (e.CommandName == "buy")
        {
            AddShopCart(e);
        }

    }
    protected void dlDiscount_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "detailSee")
        {
            AddressBack(e);
        }
        else if (e.CommandName == "buy")
        {
            AddShopCart(e);
        }

    }
    protected void dlHot_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "detailSee")
        {
            AddressBack(e);
        }
        else if (e.CommandName == "buy")
        {
            AddShopCart(e);
        }

    }
    /// <summary>
    /// 向购物车中添加新商品
    /// </summary>
    /// <param name="e">
    /// 获取或设置可选参数，
    /// 该参数与关联的 CommandName 
    /// 一起被传递到 Command 事件。
    /// </param> 
    public void AddShopCart(DataListCommandEventArgs e)
    {
        //if (Session["UserName"] == null)
        //{
        //    Response.Redirect("Default.aspx");
        //}
        /*判断是否登录*/
        ST_check_Login();
        Hashtable hashCar;
        if (Session["ShopCart"] == null)
        {
            //如果用户没有分配购物车
            hashCar = new Hashtable();         //新生成一个
            hashCar.Add(e.CommandArgument, 1); //添加一个商品
            Session["ShopCart"] = hashCar;     //分配给用户
        }
        else
        {
            //用户已经有购物车
            hashCar = (Hashtable)Session["ShopCart"];//得到购物车的hash表
            if (hashCar.Contains(e.CommandArgument))//购物车中已有此商品，商品数量加1
            {
                int count = Convert.ToInt32(hashCar[e.CommandArgument].ToString());//得到该商品的数量
                hashCar[e.CommandArgument] = (count + 1);//商品数量加1
            }
            else
                hashCar.Add(e.CommandArgument, 1);//如果没有此商品，则新添加一个项
        }

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        
    }
    protected void imagebtnRefine_Click(object sender, ImageClickEventArgs e)
    {

    }
}
