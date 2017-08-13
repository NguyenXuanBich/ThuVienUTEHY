using System;

namespace Entities
{

	public class NhaXuatBan
	{

		private string maNXB;

		private string tenNXB;

		private string urlLogo;

		private string ghiChu;

		public string MaNXB
		{
			get { return this.maNXB; }
			set { this.maNXB = value; }
		}

		public string TenNXB
		{
			get { return this.tenNXB; }
			set { this.tenNXB = value; }
		}

		public string UrlLogo
		{
			get { return this.urlLogo; }
			set { this.urlLogo = value; }
		}

		public string GhiChu
		{
			get { return this.ghiChu; }
			set { this.ghiChu = value; }
		}

		public NhaXuatBan()
		{} 

		public NhaXuatBan(string MaNXB, string TenNXB, string urlLogo, string GhiChu)
		{
			this.maNXB = MaNXB;
			this.tenNXB = TenNXB;
			this.urlLogo = urlLogo;
			this.ghiChu = GhiChu;
		}

		public NhaXuatBan(NhaXuatBan c)
		{
			this.maNXB = c.maNXB;
			this.tenNXB = c.tenNXB;
			this.urlLogo = c.urlLogo;
			this.ghiChu = c.ghiChu;
		}
	}
}
