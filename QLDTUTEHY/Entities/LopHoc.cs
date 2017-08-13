using System;

namespace Entities
{

	public class LopHoc
	{

		private string maLop;

		private string maKhoa;

		private string tenLop;

		private string heDaoTao;

		private string khoa;

		public string MaLop
		{
			get { return this.maLop; }
			set { this.maLop = value; }
		}

		public string MaKhoa
		{
			get { return this.maKhoa; }
			set { this.maKhoa = value; }
		}

		public string TenLop
		{
			get { return this.tenLop; }
			set { this.tenLop = value; }
		}

		public string HeDaoTao
		{
			get { return this.heDaoTao; }
			set { this.heDaoTao = value; }
		}

		public string Khoa
		{
			get { return this.khoa; }
			set { this.khoa = value; }
		}

		public LopHoc()
		{} 

		public LopHoc(string MaLop, string MaKhoa, string TenLop, string HeDaoTao, string Khoa)
		{
			this.maLop = MaLop;
			this.maKhoa = MaKhoa;
			this.tenLop = TenLop;
			this.heDaoTao = HeDaoTao;
			this.khoa = Khoa;
		}

		public LopHoc(LopHoc c)
		{
			this.maLop = c.maLop;
			this.maKhoa = c.maKhoa;
			this.tenLop = c.tenLop;
			this.heDaoTao = c.heDaoTao;
			this.khoa = c.khoa;
		}
	}
}
