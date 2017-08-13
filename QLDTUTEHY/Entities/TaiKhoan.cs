using System;

namespace Entities
{

	public class TaiKhoan
	{

		private string tenDangNhap;

		private string hoVaTen;

		private string matKhau;

		private short quyenHan;

		private bool trangThai;

		private string moTa;

		public string TenDangNhap
		{
			get { return this.tenDangNhap; }
			set { this.tenDangNhap = value; }
		}

		public string HoVaTen
		{
			get { return this.hoVaTen; }
			set { this.hoVaTen = value; }
		}

		public string MatKhau
		{
			get { return this.matKhau; }
			set { this.matKhau = value; }
		}

		public short QuyenHan
		{
			get { return this.quyenHan; }
			set { this.quyenHan = value; }
		}

		public bool TrangThai
		{
			get { return this.trangThai; }
			set { this.trangThai = value; }
		}

		public string MoTa
		{
			get { return this.moTa; }
			set { this.moTa = value; }
		}

		public TaiKhoan()
		{} 

		public TaiKhoan(string TenDangNhap, string HoVaTen, string MatKhau, short QuyenHan, bool TrangThai, string MoTa)
		{
			this.tenDangNhap = TenDangNhap;
			this.hoVaTen = HoVaTen;
			this.matKhau = MatKhau;
			this.quyenHan = QuyenHan;
			this.trangThai = TrangThai;
			this.moTa = MoTa;
		}

		public TaiKhoan(TaiKhoan c)
		{
			this.tenDangNhap = c.tenDangNhap;
			this.hoVaTen = c.hoVaTen;
			this.matKhau = c.matKhau;
			this.quyenHan = c.quyenHan;
			this.trangThai = c.trangThai;
			this.moTa = c.moTa;
		}
	}
}
