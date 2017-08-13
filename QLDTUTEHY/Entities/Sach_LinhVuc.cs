using System;

namespace Entities
{
    [Serializable]
	public class Sach_LinhVuc
	{

		private string maSach;

		private string maLinhVuc;

		public string MaSach
		{
			get { return this.maSach; }
			set { this.maSach = value; }
		}

		public string MaLinhVuc
		{
			get { return this.maLinhVuc; }
			set { this.maLinhVuc = value; }
		}

		public Sach_LinhVuc()
		{} 

		public Sach_LinhVuc(string MaSach, string MaLinhVuc)
		{
			this.maSach = MaSach;
			this.maLinhVuc = MaLinhVuc;
		}

		public Sach_LinhVuc(Sach_LinhVuc c)
		{
			this.maSach = c.maSach;
			this.maLinhVuc = c.maLinhVuc;
		}
	}
}
