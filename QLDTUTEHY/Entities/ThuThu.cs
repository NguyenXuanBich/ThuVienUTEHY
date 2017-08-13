using System;

namespace Entities
{

	public class ThuThu
	{

		private string maThuThu;

		private string hoTen;

		private string matKhau;

		private string diaChiEmail;

		private string dienThoai;

		private bool trangThai;

		private string urlPhoto;

		private string ghiChu;

		public string MaThuThu
		{
			get { return this.maThuThu; }
			set { this.maThuThu = value; }
		}

		public string HoTen
		{
			get { return this.hoTen; }
			set { this.hoTen = value; }
		}

		public string MatKhau
		{
			get { return this.matKhau; }
			set { this.matKhau = value; }
		}
		
		public string DiaChiEmail
		{
			get { return this.diaChiEmail; }
			set { this.diaChiEmail = value; }
		}

		public string DienThoai
		{
			get { return this.dienThoai; }
			set { this.dienThoai = value; }
		}

		public bool TrangThai
		{
			get { return this.trangThai; }
			set { this.trangThai = value; }
		}

		public string UrlPhoto
		{
			get { return this.urlPhoto; }
			set { this.urlPhoto = value; }
		}

		public string GhiChu
		{
			get { return this.ghiChu; }
			set { this.ghiChu = value; }
		}

		public ThuThu()
		{} 

		public ThuThu(string MaThuThu, string HoTen, string MatKhau, string DiaChiEmail, string DienThoai, bool TrangThai, string urlPhoto, string GhiChu)
		{
			this.maThuThu = MaThuThu;
			this.hoTen = HoTen;
			this.matKhau = MatKhau;
			
			this.diaChiEmail = DiaChiEmail;
			this.dienThoai = DienThoai;
			this.trangThai = TrangThai;
			this.urlPhoto = urlPhoto;
			this.ghiChu = GhiChu;
		}

		public ThuThu(ThuThu c)
		{
			this.maThuThu = c.maThuThu;
			this.hoTen = c.hoTen;
			this.matKhau = c.matKhau;			
			this.diaChiEmail = c.diaChiEmail;
			this.dienThoai = c.dienThoai;
			this.trangThai = c.trangThai;
			this.urlPhoto = c.urlPhoto;
			this.ghiChu = c.ghiChu;
		}
	}
}
