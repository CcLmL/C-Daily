using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class controls_ShoppingCartControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    /// <summary>
    /// 在页面呈现前，先绑定用户的购物篮数据
    /// </summary>
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCart();
        }
    }

    /// <summary>
    /// 将数据绑定到Repeater控件内
    /// </summary>
    private void BindCart()
    {

        ICollection<CartItemInfo> cart = Profile.ShoppingCart.CartItems;
        if (cart.Count > 0)
        {
            repShoppingCart.DataSource = cart;
            repShoppingCart.DataBind();
            PrintTotal();
            plhTotal.Visible = true;
        }
        else
        {
            repShoppingCart.Visible = false;
            plhTotal.Visible = false;
            lblMsg.Text = "购物篮中无任何图书.";
        }

    }
    /// <summary>
    /// 重新计算总价格
    /// </summary>
    private void PrintTotal()
    {
        if (Profile.ShoppingCart.CartItems.Count > 0)
            ltlTotal.Text = Profile.ShoppingCart.Total.ToString("c");
    }
    /// <summary>
    /// 计算总价格
    /// </summary>
    protected void BtnTotal_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        TextBox txtQuantity;
        ImageButton btnDelete;
        int qty = 0;
        foreach (RepeaterItem row in repShoppingCart.Items)
        {
            //定位到填写数量的控件
            txtQuantity = (TextBox)row.FindControl("txtQuantity");
            btnDelete = (ImageButton)row.FindControl("btnDelete");
            //验证用户的输入数据
            if (int.TryParse(Product.InputText(txtQuantity.Text, 10), out qty))
            {
                //判断数量的值
                if (qty > 0)
                    Profile.ShoppingCart.SetQuantity(int.Parse(btnDelete.CommandArgument), qty);
                else if (qty == 0)
                    //如果值为0，则自动清除此商品
                    Profile.ShoppingCart.Remove(int.Parse(btnDelete.CommandArgument));
            }

        }
        Profile.Save();
        BindCart();
    }
    /// <summary>
    /// 处理删除商品的方法
    /// </summary>
    protected void CartItem_Command(object sender, CommandEventArgs e)
    {
        //判断选择的按钮属性
        switch (e.CommandName.ToString())
        {
            case "Del":
                //如果是删除，则执行Remove方法
                Profile.ShoppingCart.Remove(int.Parse(e.CommandArgument.ToString()));
                break;
            case "Move":
                Profile.ShoppingCart.Remove(int.Parse(e.CommandArgument.ToString()));
                break;
        }
        //保存Profile所做的更改
        Profile.Save();
        //重新绑定数据源。
        BindCart();
    }

}
