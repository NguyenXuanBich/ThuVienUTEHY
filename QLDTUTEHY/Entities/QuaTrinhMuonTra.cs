using System;

namespace Entities
{

	public class QuaTrinhMuonTra
	{

		private string maQuaTrinhMuonTra;

		private string maCanBo_HSSV;

		private string maThuThu;

		private DateTime thoiGianMuonTra;

		private string xuPhatNeuCo;

		private string ghiChu;
        private int muon;
        private int tra;
        public int Muon {
            get { return this.muon; }
            set { this.muon = value; }
        }
        public int Tra
        {
            get { return this.tra; }
            set { this.tra = value; }
        }
		public string MaQuaTrinhMuonTra
		{
			get { return this.maQuaTrinhMuonTra; }
			set { this.maQuaTrinhMuonTra = value; }
		}

		public string MaCanBo_HSSV
		{
			get { return this.maCanBo_HSSV; }
			set { this.maCanBo_HSSV = value; }
		}

		public string MaThuThu
		{
			get { return this.maThuThu; }
			set { this.maThuThu = value; }
		}

		public DateTime ThoiGianMuonTra
		{
			get { return this.thoiGianMuonTra; }
			set { this.thoiGianMuonTra = value; }
		}

		public string XuPhatNeuCo
		{
			get { return this.xuPhatNeuCo; }
			set { this.xuPhatNeuCo = value; }
		}

		public string GhiChu
		{
			get { return this.ghiChu; }
			set { this.ghiChu = value; }
		}

		public QuaTrinhMuonTra()
		{} 

		public QuaTrinhMuonTra(string MaQuaTrinhMuonTra, string MaCanBo_HSSV, string MaThuThu, DateTime ThoiGianMuonTra, string XuPhatNeuCo, string GhiChu)
		{
			this.maQuaTrinhMuonTra = MaQuaTrinhMuonTra;
			this.maCanBo_HSSV = MaCanBo_HSSV;
			this.maThuThu = MaThuThu;
			this.thoiGianMuonTra = ThoiGianMuonTra;
			this.xuPhatNeuCo = XuPhatNeuCo;
			this.ghiChu = GhiChu;
		}

		public QuaTrinhMuonTra(QuaTrinhMuonTra c)
		{
			this.maQuaTrinhMuonTra = c.maQuaTrinhMuonTra;
			this.maCanBo_HSSV = c.maCanBo_HSSV;
			this.maThuThu = c.maThuThu;
			this.thoiGianMuonTra = c.thoiGianMuonTra;
			this.xuPhatNeuCo = c.xuPhatNeuCo;
			this.ghiChu = c.ghiChu;
		}
	}
}
