using System;

namespace Entities
{

	public class CanBo
	{

		private string maCanBo;

		private string hoVaTen;

		private string queQuan;

		private DateTime ngaySinh;

		private string urlPhoto;

		private string maDonVi;

		private bool gioiTinh;

		private string soDienThoai;

		private string diaChiEMail;

		private string ghiChu;

		private string matKhau;

		private bool trangThai;

		public string MaCanBo
		{
			get { return this.maCanBo; }
			set { this.maCanBo = value; }
		}

		public string HoVaTen
		{
			get { return this.hoVaTen; }
			set { this.hoVaTen = value; }
		}

		public string QueQuan
		{
			get { return this.queQuan; }
			set { this.queQuan = value; }
		}

		public DateTime NgaySinh
		{
			get { return this.ngaySinh; }
			set { this.ngaySinh = value; }
		}

		public string UrlPhoto
		{
			get { return this.urlPhoto; }
			set { this.urlPhoto = value; }
		}

		public string MaDonVi
		{
			get { return this.maDonVi; }
			set { this.maDonVi = value; }
		}

		public bool GioiTinh
		{
			get { return this.gioiTinh; }
			set { this.gioiTinh = value; }
		}

		public string SoDienThoai
		{
			get { return this.soDienThoai; }
			set { this.soDienThoai = value; }
		}

		public string DiaChiEMail
		{
			get { return this.diaChiEMail; }
			set { this.diaChiEMail = value; }
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

		public CanBo()
		{} 

		public CanBo(string MaCanBo, string HoVaTen, string QueQuan, DateTime NgaySinh, string urlPhoto, string MaDonVi, bool GioiTinh, string SoDienThoai, string DiaChiEMail, string GhiChu, string MatKhau, bool TrangThai)
		{
			this.maCanBo = MaCanBo;
			this.hoVaTen = HoVaTen;
			this.queQuan = QueQuan;
			this.ngaySinh = NgaySinh;
			this.urlPhoto = urlPhoto;
			this.maDonVi = MaDonVi;
			this.gioiTinh = GioiTinh;
			this.soDienThoai = SoDienThoai;
			this.diaChiEMail = DiaChiEMail;
			this.ghiChu = GhiChu;
			this.matKhau = MatKhau;
			this.trangThai = TrangThai;
		}

		public CanBo(CanBo c)
		{
			this.maCanBo = c.maCanBo;
			this.hoVaTen = c.hoVaTen;
			this.queQuan = c.queQuan;
			this.ngaySinh = c.ngaySinh;
			this.urlPhoto = c.urlPhoto;
			this.maDonVi = c.maDonVi;
			this.gioiTinh = c.gioiTinh;
			this.soDienThoai = c.soDienThoai;
			this.diaChiEMail = c.diaChiEMail;
			this.ghiChu = c.ghiChu;
			this.matKhau = c.matKhau;
			this.trangThai = c.trangThai;
		}
	}
}
