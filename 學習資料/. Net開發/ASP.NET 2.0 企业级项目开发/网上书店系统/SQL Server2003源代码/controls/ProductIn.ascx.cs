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

public partial class controls_ProductIn : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Product mypro = new Product();
        //初始化图书基本资料实体类并赋值
        ProductInfo product = new ProductInfo();
        product.CategoryId = int.Parse(ddlcategory.SelectedValue);
        product.Description = txtdesc.Text;
        product.Name = txtname.Text;
        product.Image = txtimage.Text;
        //初始化图书详细资料实体类并赋值
        ItemInfo item = new ItemInfo();
        item.Image = txtimage.Text;
        item.Name = txtname.Text;
        item.Price =Decimal.Parse(txtprice.Text);
        item.Quantity = int.Parse(txtcount.Text);
        item.SupplierId = int.Parse(ddlsupplier.SelectedValue);
        //添加图书
        mypro.AddProduct(product, item);
        Label1.Text = "图书已经入库";
    }
}
