using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;
using Web2ASPNET2.Setup.Component;

namespace Web2ASPNET2.Setup.UserControls
{
	public partial class DatabaseUC:UserControlBase
	{
		public DatabaseUC()
		{
			InitializeComponent();
		}

		public string Username
		{
			get
			{
				return tbUsername.Text;
			}
		}

		public string Password
		{
			get
			{
				return tbPassword.Text;
			}
		}

		public string Server
		{
			get
			{
				return tbServer.Text;
			}
			set
			{
				tbServer.Text = value;
			}
		}

		private void DatabaseUC_Load(object sender,EventArgs e)
		{
			tbServer.Text = Environment.MachineName;
		}		
	}
}
