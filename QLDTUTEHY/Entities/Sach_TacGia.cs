using System;

namespace Entities
{
    [Serializable]
	public class Sach_TacGia
	{

		private string maSach;

		private string maTacGia;

		public string MaSach
		{
			get { return this.maSach; }
			set { this.maSach = value; }
		}

		public string MaTacGia
		{
			get { return this.maTacGia; }
			set { this.maTacGia = value; }
		}

		public Sach_TacGia()
		{} 

		public Sach_TacGia(string MaSach, string MaTacGia)
		{
			this.maSach = MaSach;
			this.maTacGia = MaTacGia;
		}

		public Sach_TacGia(Sach_TacGia c)
		{
			this.maSach = c.maSach;
			this.maTacGia = c.maTacGia;
		}
	}
}
