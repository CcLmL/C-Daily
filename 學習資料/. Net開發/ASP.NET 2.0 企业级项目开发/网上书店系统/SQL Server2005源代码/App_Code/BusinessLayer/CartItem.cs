using System;
using System.Data;
using System.Collections.Generic;

/// <summary>
/// 购物篮的数据类
/// </summary>
[Serializable]
public class CartItem
{
	public CartItem(){	}
    private Dictionary<int, CartItemInfo> cartItems = new Dictionary<int, CartItemInfo>();

    /// <summary>
    /// 计算购物篮中图书的总价格
    /// </summary>
    public decimal Total
    {
        get
        {
            decimal total = 0;
            foreach (CartItemInfo item in cartItems.Values)
                total += item.Price * item.Quantity;
            return total;
        }
    }

    /// <summary>
    /// 更新购物篮中图书的数量
    /// </summary>
    /// <param name="itemId">篮中的图书ID</param>
    /// <param name="qty">数量</param>
    public void SetQuantity(int itemId, int qty)
    {
        cartItems[itemId].Quantity = qty;
    }

    /// <summary>
    /// 返回篮中图书总数
    /// </summary>
    public int Count
    {
        get { return cartItems.Count; }
    }

    /// <summary>
    /// 添加图书到购物篮
    /// 当添加图书到购物篮时，购物篮中图书总量随之增加
    /// </summary>
    /// <param name="itemId">要增加的图书的ID</param>
    public void Add(int itemId)
    {
        CartItemInfo cartItem;
        //首先判断此商品是否已经在购物篮中
        //如果没有，则添加，有则只对其数量加1
        if (!cartItems.TryGetValue(itemId, out cartItem))
        {
            Cart item = new Cart();
            ItemInfo data = item.GetItem(itemId);
            if (data != null)
            {
                CartItemInfo newItem = new CartItemInfo(itemId, data.Name, 1, (decimal)data.Price,  data.SupplierId, data.ProductId);
                cartItems.Add(itemId, newItem);
            }
        }
        else
            cartItem.Quantity++;
    }

    /// <summary>
    /// 添加一个图书实体类到购物篮
    /// 添加完成后，要更新数量
    /// </summary>
    /// <param name="item">Item to add</param>
    public void Add(CartItemInfo item)
    {
        CartItemInfo cartItem;
        if (!cartItems.TryGetValue(item.ItemId, out cartItem))
            cartItems.Add(item.ItemId, item);
        else
            cartItem.Quantity += item.Quantity;
    }

    /// <summary>
    /// 移除购物篮中的某书
    /// </summary>
    /// <param name="itemId">要移除的书的ID</param>
    public void Remove(int itemId)
    {
        cartItems.Remove(itemId);
    }

    /// <summary>
    /// 返回购物篮中的所有图书
    /// </summary>
    /// <returns>图书列表信息</returns>
    public ICollection<CartItemInfo> CartItems
    {
        get { return cartItems.Values; }
    }

    /// <summary>
    /// 转换购物篮中信息到订单中
    /// </summary>
    /// <returns>A new array of order line items</returns>
    public LineItemInfo[] GetOrderLineItems()
    {
        // 创建一个订单项目数组
        LineItemInfo[] orderLineItems = new LineItemInfo[cartItems.Count];
        int lineNum = 0;
        //遍历购物篮中的每个项目，每个都生成一个新的订单项目
        foreach (CartItemInfo item in cartItems.Values)
            orderLineItems[lineNum] = new LineItemInfo(item.ItemId, item.Name, ++lineNum, item.Quantity, item.Price);
        return orderLineItems;
    }

    /// <summary>
    /// 清空购物篮
    /// </summary>
    public void Clear()
    {
        cartItems.Clear();
    }
}
