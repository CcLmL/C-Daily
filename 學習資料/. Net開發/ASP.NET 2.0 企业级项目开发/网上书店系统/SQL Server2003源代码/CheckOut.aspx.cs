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

public partial class CheckOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (billingForm.Address == null)
        {
            //如果帐户地址中没有信息
            //可以提取Profile中的信息为其赋值
            billingForm.Address = Profile.AccountInfo;
        }
    }
    /// <summary>
    /// 当用户选择“与帐户地址相同”复选框时
    /// 用帐户地址的内容填充送货地址
    /// </summary>
    protected void chkShipToBilling_CheckedChanged(object sender, EventArgs e)
    {
        if (chkShipToBilling.Checked)
            shippingForm.Address = billingForm.Address;
    }
    protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        //如果当前是第3步，则显示帐户地址和送货地址
        if (Wizard1.ActiveStepIndex == 2)
        {
            //帐户地址
            billingConfirm.Address = billingForm.Address;
            //送货地址
            shippingConfirm.Address = shippingForm.Address;
            //总价格
            ltlTotal.Text = Profile.ShoppingCart.Total.ToString("c");
        }
    }
    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        //首先判断购物篮中的商品数目是否大于0
        if (Profile.ShoppingCart.CartItems.Count > 0)
        {
            if (Profile.ShoppingCart.Count > 0)
            {
                // 绑定购物篮内容到显示控件
                CartListOrdered.Bind(Profile.ShoppingCart.CartItems);
                // 创建订单
                OrderInfo order = new OrderInfo(int.MinValue, DateTime.Now.Date, User.Identity.Name, GetCreditCardInfo(), billingForm.Address, shippingForm.Address, Profile.ShoppingCart.Total, Profile.ShoppingCart.GetOrderLineItems());
                // 保存订单
                Order newOrder = new Order();
                newOrder.Insert(order);
                //清空购物篮
                Profile.ShoppingCart.Clear();
                Profile.Save();
            }
            lblMsg.Text = "您的订单已经提交，谢谢购买本站图书！";
        }
        else
        {
            lblMsg.Text = "<p><br>不能提交订单，因为您的购物篮为空.</p><a class=linkNewUser href=Default.aspx>继续购物</a></p>";
        }
    }

    /// <summary>
    /// 获取付款信息
    /// </summary>
    private PayInfo GetCreditCardInfo()
    {
        return PayControl1.Pay;
    }
}
