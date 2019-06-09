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
using System.Data.SqlClient;

public partial class goodsList : System.Web.UI.Page
{
    CommonClass ccObj = new CommonClass();
    GoodsClass gcObj = new GoodsClass();
    DBClass dbObj = new DBClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dlBind();       //显示浏览的商品信息
            deplayTitle();   //显示当前页浏览商品的位置


        }
    }
   
    /// <summary>
    /// 说明：dlBind方法用于绑定相关的商品信息
    /// 如果Request["var"]的值为1，表示点击头控件中的“新品上市”、“特价商品”和“热门商品”导航到该浏览页
    /// 否则，表示点击分类导航条中的商品类别名导航到该浏览页
    /// </summary>
    public void dlBind()
    {
        if (this.Request["var"]=="1")
        {
            dlBindPage(Convert.ToInt32(Request["id"].ToString()), 0);//分页显示新上市商品/特价商品/热门商品

        }
        else
        {
            dlBindPage(0, Convert.ToInt32(Request["id"].ToString()));//分页显示某个商品类别下的商品信息
        }
    
    }
    /// <summary>
    /// 说明：显示当前页浏览商品的位置
    /// </summary>
    public void deplayTitle()
    {
        if (this.Request["var"] == "1")
        {
            //如果Request["var"]的值为1，表示点击头控件中的“新品上市”、“特价商品”和“热门商品”导航到该浏览页
            switch (this.Request["id"])
            { 
                case "1":
                    this.labTitle.Text = "首页/热门商品";
                    break;
                case "2":
                    this.labTitle.Text = "首页/推荐商品";
                    break;
                case "3":
                    this.labTitle.Text = "首页/最新商品";
                    break;
                case "4":
                    this.labTitle.Text = "首页/热门商品";
                    break;
            }

        }
        else
        {
            //表示点击分类导航条中的商品类别名导航到该浏览页
            string strClassName = gcObj.GetClass(Convert.ToInt32(this.Request["id"].ToString()));
            this.labTitle.Text = "首页/商品分类/" + strClassName; 
        }
    
    }
  
    public void dlBindPage(int IntDeplay,int IntClass)
    {
        //获取数据源的数据表

        SqlCommand myCmd = dbObj.GetCommandProc("proc_GIList");
        //添加参数
        SqlParameter Deplay = new SqlParameter("@Deplay", SqlDbType.Int, 4);
        Deplay.Value = IntDeplay;
        myCmd.Parameters.Add(Deplay);
        //添加参数
        SqlParameter Class = new SqlParameter("@ClassID", SqlDbType.Int, 4);
        Class.Value = IntClass;
        myCmd.Parameters.Add(Class);
        dbObj.ExecNonQuery(myCmd);
        DataTable dsTable = dbObj.GetDataSet(myCmd, "tbGI");
        int curpage = Convert.ToInt32(this.labPage.Text);
        PagedDataSource ps = new PagedDataSource();
        ps.DataSource = dsTable.DefaultView;
        ps.AllowPaging = true; //是否可以分页
        ps.PageSize = 15; //显示的数量
        ps.CurrentPageIndex = curpage - 1; //取得当前页的页码
        this.lnkbtnUp.Enabled = true;
        this.lnkbtnNext.Enabled = true;
        this.lnkbtnBack.Enabled = true;
        this.lnkbtnOne.Enabled = true;
        if (curpage == 1)
        {
            this.lnkbtnOne.Enabled = false;//不显示第一页按钮
            this.lnkbtnUp.Enabled = false;//不显示上一页按钮
        }
        if (curpage == ps.PageCount)
        {
            this.lnkbtnNext.Enabled = false;//不显示下一页
            this.lnkbtnBack.Enabled = false;//不显示最后一页
        }
        this.labBackPage.Text = Convert.ToString(ps.PageCount);
        this.dLGoodsList.DataSource = ps;
        this.dLGoodsList.DataKeyField ="BookID";
        this.dLGoodsList.DataBind();
       
    
    }
    protected void lnkbtnOne_Click(object sender, EventArgs e)
    {
        this.labPage.Text = "1";
        this.dlBind();
    }
    protected void lnkbtnUp_Click(object sender, EventArgs e)
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) - 1);
        this.dlBind();
    }
    protected void lnkbtnNext_Click(object sender, EventArgs e)
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) + 1);
        this.dlBind();
    }
    protected void lnkbtnBack_Click(object sender, EventArgs e)
    {
        this.labPage.Text = this.labBackPage.Text;
        this.dlBind();
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
    public void AddressBack(DataListCommandEventArgs e)
    {
        Session["address"] = "";
        Session["address"] = "Default.aspx";
        Response.Redirect("~/showInfo.aspx?id=" + Convert.ToInt32(e.CommandArgument.ToString()));
    }
    protected void dLGoodsList_ItemCommand(object source, DataListCommandEventArgs e)
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
    public void ST_check_Login()
    {

        if ((Session["Username"] == null))
        {
            Response.Write("<script>alert('对不起！您不是会员，请先注册！');location='Default.aspx'</script>");
            Response.End();
        }
    }
}
