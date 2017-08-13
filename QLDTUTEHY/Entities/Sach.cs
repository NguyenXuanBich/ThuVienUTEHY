using System;
using System.Collections.Generic;

namespace Entities
{
    [Serializable]
	public class Sach
	{

		private string maSach;

		private string maPhanLoai;

		private string tenSach;

		private string maNXB;

		private short lanXuatBan;

		private string iSBN_ISSN;

		private int soTrang;

		private short tap;

		private int namXuatBan;

		private string nuocXuatBan;

		private string kichThuoc;

		private string urlAnhBia;

		private string duongDanBanScan;

		private float giaBia;

		private string maNgonNgu;

		private string tomTatNoiDung;

		private string tuKhoa;

		private bool sachDichHayKhong;

		private string ngonNguBanDau;

		private bool tinhTrang;
        private int soLuong;

		private string ghiChu;
        private List<TacGia> dSTacGia;
        private List<TheLoai> dSTheLoai;
        private List<LinhVuc> dSLinhVuc;
        public List<TacGia> DSTacGia
        {
            get { return dSTacGia; }
            set { dSTacGia = value; }
        }
        public int SoLuong {
            get { return this.soLuong; }
            set { this.soLuong = value; }
        }
        public List<TheLoai> DSTheLoai
        {
            get { return dSTheLoai; }
            set { dSTheLoai = value; }
        }
        public List<LinhVuc> DSLinhVuc
        {
            get { return dSLinhVuc; }
            set { dSLinhVuc = value; }
        }
		public string MaSach
		{
			get { return this.maSach; }
			set { this.maSach = value; }
		}

		public string MaPhanLoai
		{
			get { return this.maPhanLoai; }
			set { this.maPhanLoai = value; }
		}

		public string TenSach
		{
			get { return this.tenSach; }
			set { this.tenSach = value; }
		}

		public string MaNXB
		{
			get { return this.maNXB; }
			set { this.maNXB = value; }
		}

		public short LanXuatBan
		{
			get { return this.lanXuatBan; }
			set { this.lanXuatBan = value; }
		}

		public string ISBN_ISSN
		{
			get { return this.iSBN_ISSN; }
			set { this.iSBN_ISSN = value; }
		}

		public int SoTrang
		{
			get { return this.soTrang; }
			set { this.soTrang = value; }
		}

		public short Tap
		{
			get { return this.tap; }
			set { this.tap = value; }
		}

		public int NamXuatBan
		{
			get { return this.namXuatBan; }
			set { this.namXuatBan = value; }
		}

		public string NuocXuatBan
		{
			get { return this.nuocXuatBan; }
			set { this.nuocXuatBan = value; }
		}

		public string KichThuoc
		{
			get { return this.kichThuoc; }
			set { this.kichThuoc = value; }
		}

		public string UrlAnhBia
		{
			get { return this.urlAnhBia; }
			set { this.urlAnhBia = value; }
		}

		public string DuongDanBanScan
		{
			get { return this.duongDanBanScan; }
			set { this.duongDanBanScan = value; }
		}

		public float GiaBia
		{
			get { return this.giaBia; }
			set { this.giaBia = value; }
		}

		public string MaNgonNgu
		{
			get { return this.maNgonNgu; }
			set { this.maNgonNgu = value; }
		}

		public string TomTatNoiDung
		{
			get { return this.tomTatNoiDung; }
			set { this.tomTatNoiDung = value; }
		}

		public string TuKhoa
		{
			get { return this.tuKhoa; }
			set { this.tuKhoa = value; }
		}

		public bool SachDichHayKhong
		{
			get { return this.sachDichHayKhong; }
			set { this.sachDichHayKhong = value; }
		}

		public string NgonNguBanDau
		{
			get { return this.ngonNguBanDau; }
			set { this.ngonNguBanDau = value; }
		}

		public bool TinhTrang
		{
			get { return this.tinhTrang; }
			set { this.tinhTrang = value; }
		}

		public string GhiChu
		{
			get { return this.ghiChu; }
			set { this.ghiChu = value; }
		}

		public Sach()
		{} 

		public Sach(string MaSach, string MaPhanLoai, string TenSach, string MaNXB, short LanXuatBan, string ISBN_ISSN, int SoTrang, short Tap, int NamXuatBan, string NuocXuatBan, string KichThuoc, string urlAnhBia, string DuongDanBanScan, float GiaBia, string MaNgonNgu, string TomTatNoiDung, string TuKhoa, bool SachDichHayKhong, string NgonNguBanDau, bool TinhTrang, string GhiChu)
		{
			this.maSach = MaSach;
			this.maPhanLoai = MaPhanLoai;
			this.tenSach = TenSach;
			this.maNXB = MaNXB;
			this.lanXuatBan = LanXuatBan;
			this.iSBN_ISSN = ISBN_ISSN;
			this.soTrang = SoTrang;
			this.tap = Tap;
			this.namXuatBan = NamXuatBan;
			this.nuocXuatBan = NuocXuatBan;
			this.kichThuoc = KichThuoc;
			this.urlAnhBia = urlAnhBia;
			this.duongDanBanScan = DuongDanBanScan;
			this.giaBia = GiaBia;
			this.maNgonNgu = MaNgonNgu;
			this.tomTatNoiDung = TomTatNoiDung;
			this.tuKhoa = TuKhoa;
			this.sachDichHayKhong = SachDichHayKhong;
			this.ngonNguBanDau = NgonNguBanDau;
			this.tinhTrang = TinhTrang;
			
			this.ghiChu = GhiChu;
		}

		public Sach(Sach c)
		{
			this.maSach = c.maSach;
			this.maPhanLoai = c.maPhanLoai;
			this.tenSach = c.tenSach;
			this.maNXB = c.maNXB;
			this.lanXuatBan = c.lanXuatBan;
			this.iSBN_ISSN = c.iSBN_ISSN;
			this.soTrang = c.soTrang;
			this.tap = c.tap;
			this.namXuatBan = c.namXuatBan;
			this.nuocXuatBan = c.nuocXuatBan;
			this.kichThuoc = c.kichThuoc;
			this.urlAnhBia = c.urlAnhBia;
			this.duongDanBanScan = c.duongDanBanScan;
			this.giaBia = c.giaBia;
			this.maNgonNgu = c.maNgonNgu;
			this.tomTatNoiDung = c.tomTatNoiDung;
			this.tuKhoa = c.tuKhoa;
			this.sachDichHayKhong = c.sachDichHayKhong;
			this.ngonNguBanDau = c.ngonNguBanDau;
			this.tinhTrang = c.tinhTrang;	
			this.ghiChu = c.ghiChu;
		}
	}
}
