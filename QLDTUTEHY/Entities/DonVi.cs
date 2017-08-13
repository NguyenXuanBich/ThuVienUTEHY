using System;

namespace Entities
{

	public class DonVi
	{

		private string maDonVi;

		private string tenDonVI;

		private string diaChi;

		private string soDienThoai;

		private string truongDonVI;

		private string eMail;

		private string website;

		public string MaDonVi
		{
			get { return this.maDonVi; }
			set { this.maDonVi = value; }
		}

		public string TenDonVI
		{
			get { return this.tenDonVI; }
			set { this.tenDonVI = value; }
		}

		public string DiaChi
		{
			get { return this.diaChi; }
			set { this.diaChi = value; }
		}

		public string SoDienThoai
		{
			get { return this.soDienThoai; }
			set { this.soDienThoai = value; }
		}

		public string TruongDonVI
		{
			get { return this.truongDonVI; }
			set { this.truongDonVI = value; }
		}

		public string EMail
		{
			get { return this.eMail; }
			set { this.eMail = value; }
		}

		public string Website
		{
			get { return this.website; }
			set { this.website = value; }
		}

		public DonVi()
		{} 

		public DonVi(string MaDonVi, string TenDonVI, string DiaChi, string SoDienThoai, string TruongDonVI, string EMail, string Website)
		{
			this.maDonVi = MaDonVi;
			this.tenDonVI = TenDonVI;
			this.diaChi = DiaChi;
			this.soDienThoai = SoDienThoai;
			this.truongDonVI = TruongDonVI;
			this.eMail = EMail;
			this.website = Website;
		}

		public DonVi(DonVi c)
		{
			this.maDonVi = c.maDonVi;
			this.tenDonVI = c.tenDonVI;
			this.diaChi = c.diaChi;
			this.soDienThoai = c.soDienThoai;
			this.truongDonVI = c.truongDonVI;
			this.eMail = c.eMail;
			this.website = c.website;
		}
	}
}
