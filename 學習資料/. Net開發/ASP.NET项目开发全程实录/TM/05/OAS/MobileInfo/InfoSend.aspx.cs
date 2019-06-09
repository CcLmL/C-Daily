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

using System.Text;
using MobileSP;

public partial class MobileInfo_InfoSend : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            chkblEmployee.DataSource = bc.GetDataSet("select * from tb_employee", "tb_employee");
            chkblEmployee.DataTextField = "name";
            chkblEmployee.DataValueField = "tel";
            chkblEmployee.DataBind();
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        txtAccepter.Text = "";                                      //清空手机号码
        for (int i = 0; i < chkblEmployee.Items.Count; i++)
        {
            if (chkblEmployee.Items[i].Selected)
                txtAccepter.Text = chkblEmployee.Items[i].Value + "," + txtAccepter.Text;
        }
        if (txtAccepter.Text.Length != 0)
            txtAccepter.Text = txtAccepter.Text.Substring(0, txtAccepter.Text.Length - 1);
    }
    protected void imgBtnSend_Click(object sender, ImageClickEventArgs e)
    {
        //如果没有手机号码接收信息，则程序不继续执行。
        if (txtAccepter.Text == "")                                 
        {
            Response.Write(bc.MessageBox("手机号码不能为空！"));
            return;
        }
        //获取短信猫的基本信息
        string strCOM = GMS.GSMModemGetDevice();                    　　//ＣＯＭ１
        string strBTL = GMS.GSMModemGetBaudrate();　                    //波特率
        string strMobileNo = GMS.GSMModemGetSnInfoNew(strCOM, strBTL);　//机器号码
        string strWarranty = "YIWU-IJDD-CDQW-JDWG";                     //设备授权号（设备上自带）
        string[] Accepters = txtAccepter.Text.Split(',');

        //连接设备
        if (GMS.GSMModemInitNew(strCOM, strBTL, null, null, false, strWarranty) == false)
        {
            Response.Write(bc.MessageBox("设备连接失败!" + GMS.GSMModemGetErrorMsg()));
            return;
        }
        // 发送短信

        if (Accepters.Length > 1)
        {
            for (int j = 0; j < Accepters.Length; j++)
                if (GMS.GSMModemSMSsend(null, 8, txtInfo.Text, Encoding.Default.GetByteCount(txtInfo.Text), Accepters[j].ToString(), false) == true)
                    Response.Write(bc.MessageBox("短信发送成功!"));
                else
                    Response.Write(bc.MessageBox("短信发送失败!"));
        }
        else
        {
            if (GMS.GSMModemSMSsend(null, 8, txtInfo.Text, Encoding.Default.GetByteCount(txtInfo.Text), txtAccepter.Text, false) == true)
                Response.Write(bc.MessageBox("短信发送成功!"));
            else
                Response.Write(bc.MessageBox("短信发送失败!"));
        }
    }
    protected void imgBtnClear_Click(object sender, ImageClickEventArgs e)
    {
        txtAccepter.Text = "";
        txtInfo.Text = "";
    }
}
