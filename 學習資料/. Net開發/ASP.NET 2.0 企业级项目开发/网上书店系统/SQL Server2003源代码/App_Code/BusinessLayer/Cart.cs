using System;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Generic;

/// <summary>
/// 购物篮的相关操作方法
/// </summary>
public class Cart
{
    private const string PARM_PRODUCT_ID = "@ProductId";
    private const string SQL_SELECT_ITEMS_BY_PRODUCT = "SELECT Item.ItemId, Item.ProductName, ProductCount.Count, Item.Price,  Item.ProductImage, Item.SupplierId, Product.ProductId FROM Item INNER JOIN Product ON Item.ProductId = Product.ProductId INNER JOIN ProductCount ON Item.ItemId = ProductCount.ItemId WHERE Item.ProductId = @ProductId";

    private const string PARM_ITEM_ID = "@ItemId";
    private const string SQL_SELECT_ITEM = "SELECT Item.ItemId, Item.ProductName, Item.Price,  Item.ProductImage, Item.SupplierId, Product.ProductId FROM Item INNER JOIN Product ON Item.ProductId = Product.ProductId WHERE Item.ItemId = @ItemId";


	public Cart()	{	}
    /// <summary>
    /// 根据产品ID获取产品详细信息
    /// </summary>
    /// <param name="productId">产品ID</param>	   	 
    /// <returns>返回产品列表</returns>
    public IList<ItemInfo> GetItemsByProduct(string productId)
    {

        IList<ItemInfo> itemsByProduct = new List<ItemInfo>();

        SqlParameter parm = new SqlParameter(PARM_PRODUCT_ID, SqlDbType.Int);
        parm.Value = productId;

        //执行查询语句
        using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_ITEMS_BY_PRODUCT, parm))
        {
            // 如果存在结果
            while (rdr.Read())
            {
                ItemInfo item = new ItemInfo(rdr.GetInt32(0), rdr.GetString(1), rdr.GetInt32(2), rdr.GetDecimal(3), rdr.GetString(4), rdr.GetInt32(5), rdr.GetInt32(6));
                //将结果添加到数组
                itemsByProduct.Add(item);
            }
        }
        return itemsByProduct;
    }
    /// <summary>
    /// 通过ID获取商品详细信息
    /// </summary>
    /// <param name="itemId">详细资料ID</param>
    /// <returns>一个图书详细信息实体</returns>
    public ItemInfo GetItem(int itemId)
    {

        // 验证输入的ID
        if (string.IsNullOrEmpty(itemId.ToString()))
            return null;
        //初始化一个详细资料实体
        ItemInfo item = null;
        //创建参数
        SqlParameter parm = new SqlParameter(PARM_ITEM_ID, SqlDbType.Int);
        //为参数赋值
        parm.Value = itemId;

        //执行查询
        using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_ITEM, parm)) {
            if (rdr.Read())
                item = new ItemInfo(rdr.GetInt32(0), rdr.GetString(1),0, rdr.GetDecimal(2), rdr.GetString(3), rdr.GetInt32(4), rdr.GetInt32(5));
            else
                item = new ItemInfo();
        }
        return item;
    }
}
