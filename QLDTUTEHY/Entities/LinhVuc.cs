using System;

namespace Entities
{
    [Serializable]
	public class LinhVuc
	{

		private string maLinhVuc;

		private string tenLinhVuc;

		private string ghiChu;

		public string MaLinhVuc
		{
			get { return this.maLinhVuc; }
			set { this.maLinhVuc = value; }
		}

		public string TenLinhVuc
		{
			get { return this.tenLinhVuc; }
			set { this.tenLinhVuc = value; }
		}

		public string GhiChu
		{
			get { return this.ghiChu; }
			set { this.ghiChu = value; }
		}

		public LinhVuc()
		{} 

		public LinhVuc(string MaLinhVuc, string TenLinhVuc, string GhiChu)
		{
			this.maLinhVuc = MaLinhVuc;
			this.tenLinhVuc = TenLinhVuc;
			this.ghiChu = GhiChu;
		}

		public LinhVuc(LinhVuc c)
		{
			this.maLinhVuc = c.maLinhVuc;
			this.tenLinhVuc = c.tenLinhVuc;
			this.ghiChu = c.ghiChu;
		}
	}
}
