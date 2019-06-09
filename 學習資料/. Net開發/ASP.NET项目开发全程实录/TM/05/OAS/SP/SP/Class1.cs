using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.InteropServices;

namespace MobileSP
{
    public class GMS
    {
        //初始化gsm modem,并连接gsm modem
        [DllImport("dllforvc.dll",
             EntryPoint = "GSMModemInitNew",
             CharSet = CharSet.Ansi,
             CallingConvention = CallingConvention.StdCall)]
        public static extern bool GSMModemInitNew(
            string device,
            string baudrate,
            string initstring,
            string charset,
            bool swHandshake,
            string sn);

        //获取短信猫新的标识号码
        [DllImport("dllforvc.dll",
             EntryPoint = "GSMModemGetSnInfoNew",
             CharSet = CharSet.Ansi,
             CallingConvention = CallingConvention.StdCall)]
        public static extern string GSMModemGetSnInfoNew(string device, string baudrate);

        //获取当前通讯端口
        [DllImport("dllforvc.dll",
             EntryPoint = "GSMModemGetDevice",
             CharSet = CharSet.Ansi,
             CallingConvention = CallingConvention.StdCall)]
        public static extern string GSMModemGetDevice();

        //获取当前通讯波特率
        [DllImport("dllforvc.dll",
             EntryPoint = "GSMModemGetBaudrate",
             CharSet = CharSet.Ansi,
             CallingConvention = CallingConvention.StdCall)]
        public static extern string GSMModemGetBaudrate();

        //断开连接并释放内存空间		
        [DllImport("dllforvc.dll",
             EntryPoint = "GSMModemRelease",
             CharSet = CharSet.Ansi,
             CallingConvention = CallingConvention.StdCall)]
        public static extern void GSMModemRelease();

        //取得错误信息	
        [DllImport("dllforvc.dll",
             EntryPoint = "GSMModemGetErrorMsg",
             CharSet = CharSet.Ansi,
             CallingConvention = CallingConvention.StdCall)]
        public static extern string GSMModemGetErrorMsg();

        //发送短信息
        [DllImport("dllforvc.dll",
             EntryPoint = "GSMModemSMSsend",
             CharSet = CharSet.Ansi,
             CallingConvention = CallingConvention.StdCall)]
        public static extern bool GSMModemSMSsend(
            string serviceCenterAddress,
            int encodeval,
            string text,
            int textlen,
            string phonenumber,
            bool requestStatusReport);

        //接收短信息返回字符串格式为:手机号码|短信内容||手机号码|短信内容||
        //RD_opt为１接收短信息后不做任何处理，０为接收后删除信息
        [DllImport("dllforvc.dll",
             EntryPoint = "GSMModemSMSReadAll",
             CharSet = CharSet.Ansi,
             CallingConvention = CallingConvention.StdCall)]
        public static extern string GSMModemSMSReadAll(int RD_opt);
    }
}
