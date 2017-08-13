using System;

namespace Entities
{

	public class HSSV
	{

		private string maHSSV;

		private string hoTen;

		private string maLop;

		private bool gioiTinh;

		private DateTime ngaySinh;

		private string noiSinh;

		private string queQuan;

		private string noiOHienNay;

		private string dienThoai;

		private string eMail;

		private string urlPhoto;

		private string ghiChu;

		private string matKhau;

		private bool trangThai;

		public string MaHSSV
		{
			get { return this.maHSSV; }
			set { this.maHSSV = value; }
		}

		public string HoTen
		{
			get { return this.hoTen; }
			set { this.hoTen = value; }
		}

		public string MaLop
		{
			get { return this.maLop; }
			set { this.maLop = value; }
		}

		public bool GioiTinh
		{
			get { return this.gioiTinh; }
			set { this.gioiTinh = value; }
		}

		public DateTime NgaySinh
		{
			get { return this.ngaySinh; }
			set { this.ngaySinh = value; }
		}

		public string NoiSinh
		{
			get { return this.noiSinh; }
			set { this.noiSinh = value; }
		}

		public string QueQuan
		{
			get { return this.queQuan; }
			set { this.queQuan = value; }
		}

		public string NoiOHienNay
		{
			get { return this.noiOHienNay; }
			set { this.noiOHienNay = value; }
		}

		public string DienThoai
		{
			get { return this.dienThoai; }
			set { this.dienThoai = value; }
		}

		public string EMail
		{
			get { return this.eMail; }
			set { this.eMail = value; }
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

		public string MatKhau
		{
			get { return this.matKhau; }
			set { this.matKhau = value; }
		}

		public bool TrangThai
		{
			get { return this.trangThai; }
			set { this.trangThai = value; }
		}

		public HSSV()
		{} 

		public HSSV(string MaHSSV, string HoTen, string MaLop, bool GioiTinh, DateTime NgaySinh, string NoiSinh, string QueQuan, string NoiOHienNay, string DienThoai, string EMail, string urlPhoto, string GhiChu, string MatKhau, bool TrangThai)
		{
			this.maHSSV = MaHSSV;
			this.hoTen = HoTen;
			this.maLop = MaLop;
			this.gioiTinh = GioiTinh;
			this.ngaySinh = NgaySinh;
			this.noiSinh = NoiSinh;
			this.queQuan = QueQuan;
			this.noiOHienNay = NoiOHienNay;
			this.dienThoai = DienThoai;
			this.eMail = EMail;
			this.urlPhoto = urlPhoto;
			this.ghiChu = GhiChu;
			this.matKhau = MatKhau;
			this.trangThai = TrangThai;
		}

		public HSSV(HSSV c)
		{
			this.maHSSV = c.maHSSV;
			this.hoTen = c.hoTen;
			this.maLop = c.maLop;
			this.gioiTinh = c.gioiTinh;
			this.ngaySinh = c.ngaySinh;
			this.noiSinh = c.noiSinh;
			this.queQuan = c.queQuan;
			this.noiOHienNay = c.noiOHienNay;
			this.dienThoai = c.dienThoai;
			this.eMail = c.eMail;
			this.urlPhoto = c.urlPhoto;
			this.ghiChu = c.ghiChu;
			this.matKhau = c.matKhau;
			this.trangThai = c.trangThai;
		}
	}
}
