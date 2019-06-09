using System;

/// <summary>
/// 商品信息实体
/// </summary>
[Serializable()]
public class StockEntity
{
    private string _StockName = "";
    private double _StockPrice = 0;
    private int _StockCount = 0;

    //不带参数的构造函数
	public StockEntity()
	{
	}
    //带参数的构造函数
    public StockEntity(string stockName, double stockPrice, int stockCount)
    {
        this._StockName = stockName;
        this._StockPrice = stockPrice;
        this._StockCount = stockCount;
    }
    //商品名称
    public string StockName
    {
        get { return _StockName; }
        set { _StockName = value; }
    }
    //商品价格
    public double StockPrice
    {
        get { return _StockPrice; }
        set { _StockPrice = value; }
    }
    //商品库存
    public int StockCount
    {
        get { return _StockCount; }
        set { _StockCount = value; }
    }
}