using System;

namespace Entities
{
    [Serializable]

	public class ChiTietMuonTra
	{

		private string maQuaTrinhTraSach;

		private string maSach;

		private string tinhTrang;

		private string maSoCaBiet;

		private short muonHayTra;

		private int soNgayMuon;

		public string MaQuaTrinhTraSach
		{
			get { return this.maQuaTrinhTraSach; }
			set { this.maQuaTrinhTraSach = value; }
		}

		public string MaSach
		{
			get { return this.maSach; }
			set { this.maSach = value; }
		}

		public string TinhTrang
		{
			get { return this.tinhTrang; }
			set { this.tinhTrang = value; }
		}

		public string MaSoCaBiet
		{
			get { return this.maSoCaBiet; }
			set { this.maSoCaBiet = value; }
		}

		public short MuonHayTra
		{
			get { return this.muonHayTra; }
			set { this.muonHayTra = value; }
		}

		public int SoNgayMuon
		{
			get { return this.soNgayMuon; }
			set { this.soNgayMuon = value; }
		}

		public ChiTietMuonTra()
		{} 

		public ChiTietMuonTra(string MaQuaTrinhTraSach, string MaSach, string TinhTrang, string MaSoCaBiet, short MuonHayTra, int SoNgayMuon)
		{
			this.maQuaTrinhTraSach = MaQuaTrinhTraSach;
			this.maSach = MaSach;
			this.tinhTrang = TinhTrang;
			this.maSoCaBiet = MaSoCaBiet;
			this.muonHayTra = MuonHayTra;
			this.soNgayMuon = SoNgayMuon;
		}

		public ChiTietMuonTra(ChiTietMuonTra c)
		{
			this.maQuaTrinhTraSach = c.maQuaTrinhTraSach;
			this.maSach = c.maSach;
			this.tinhTrang = c.tinhTrang;
			this.maSoCaBiet = c.maSoCaBiet;
			this.muonHayTra = c.muonHayTra;
			this.soNgayMuon = c.soNgayMuon;
		}
	}
}
