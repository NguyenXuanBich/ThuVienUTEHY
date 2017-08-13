using System;

namespace Entities
{
    [Serializable]
	public class Sach_TheLoai
	{

		private string maSach;

		private string maTheLoai;

		public string MaSach
		{
			get { return this.maSach; }
			set { this.maSach = value; }
		}

		public string MaTheLoai
		{
			get { return this.maTheLoai; }
			set { this.maTheLoai = value; }
		}

		public Sach_TheLoai()
		{} 

		public Sach_TheLoai(string MaSach, string MaTheLoai)
		{
			this.maSach = MaSach;
			this.maTheLoai = MaTheLoai;
		}

		public Sach_TheLoai(Sach_TheLoai c)
		{
			this.maSach = c.maSach;
			this.maTheLoai = c.maTheLoai;
		}
	}
}
