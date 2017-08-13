using System;

namespace Entities
{
    [Serializable]
	public class TacGia
	{

		private string maTacGia;

		private string hoTenTacGia;

		private string moTa;

		public string MaTacGia
		{
			get { return this.maTacGia; }
			set { this.maTacGia = value; }
		}

		public string HoTenTacGia
		{
			get { return this.hoTenTacGia; }
			set { this.hoTenTacGia = value; }
		}

		public string MoTa
		{
			get { return this.moTa; }
			set { this.moTa = value; }
		}

		public TacGia()
		{} 

		public TacGia(string MaTacGia, string HoTenTacGia, string MoTa)
		{
			this.maTacGia = MaTacGia;
			this.hoTenTacGia = HoTenTacGia;
			this.moTa = MoTa;
		}

		public TacGia(TacGia c)
		{
			this.maTacGia = c.maTacGia;
			this.hoTenTacGia = c.hoTenTacGia;
			this.moTa = c.moTa;
		}
	}
}
