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
	public partial class WebSetupUC:UserControlBase
	{
		public string Title
		{
			get
			{
				return gbPanel.Text;
			}
			set
			{
				gbPanel.Text = value;
			}
		}

		public ProgressBar ProgressBarSetup
		{
			get
			{
				return probSetup;
			}
		}

		public WebSetupUC()
		{
			InitializeComponent();
		}
	}
}
