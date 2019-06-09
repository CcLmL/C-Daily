using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;

namespace Web2ASPNET2.Setup.UserControls
{
	public partial class StatusUC:UserControl
	{
		public StatusUC()
		{
			InitializeComponent();
		}

		public string Title
		{
			get
			{
				return titleLabel.Text;
			}
			set
			{
				titleLabel.Text = value;
			}
		}

		public Image TitleImage
		{
			get
			{
				return leftPictureBox.Image;
			}
			set
			{
				leftPictureBox.Image = value;
			}
		}
	}
}
