using System;
using System.Text;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// 商品数量的相关操作
/// </summary>
public class Inventory
{
    private const string PARM_ITEM_PRICE = "@price";
    private const string SQL_INSERT_ITEM = "INSERT INTO item  VALUES(@productid, @supplierid,@price,@ProductName,@productimage)";

	public Inventory()
	{
	}
}
