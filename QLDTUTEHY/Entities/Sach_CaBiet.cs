using System;

namespace Entities
{

	public class Sach_CaBiet
	{

		private string maSach;

		private string maSoCaBiet;

		private short tinhTrang;

		private string ghiChu;

		public string MaSach
		{
			get { return this.maSach; }
			set { this.maSach = value; }
		}

		public string MaSoCaBiet
		{
			get { return this.maSoCaBiet; }
			set { this.maSoCaBiet = value; }
		}

		public short TinhTrang
		{
			get { return this.tinhTrang; }
			set { this.tinhTrang = value; }
		}

		public string GhiChu
		{
			get { return this.ghiChu; }
			set { this.ghiChu = value; }
		}

		public Sach_CaBiet()
		{} 

		public Sach_CaBiet(string MaSach, string MaSoCaBiet, short TinhTrang, string GhiChu)
		{
			this.maSach = MaSach;
			this.maSoCaBiet = MaSoCaBiet;
			this.tinhTrang = TinhTrang;
			this.ghiChu = GhiChu;
		}

		public Sach_CaBiet(Sach_CaBiet c)
		{
			this.maSach = c.maSach;
			this.maSoCaBiet = c.maSoCaBiet;
			this.tinhTrang = c.tinhTrang;
			this.ghiChu = c.ghiChu;
		}
	}
}
