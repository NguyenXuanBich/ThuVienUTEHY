using System;

namespace Entities
{

	public class NgonNgu
	{

		private string maNgonNgu;

		private string tenNgonNgu;

		public string MaNgonNgu
		{
			get { return this.maNgonNgu; }
			set { this.maNgonNgu = value; }
		}

		public string TenNgonNgu
		{
			get { return this.tenNgonNgu; }
			set { this.tenNgonNgu = value; }
		}

		public NgonNgu()
		{} 

		public NgonNgu(string MaNgonNgu, string TenNgonNgu)
		{
			this.maNgonNgu = MaNgonNgu;
			this.tenNgonNgu = TenNgonNgu;
		}

		public NgonNgu(NgonNgu c)
		{
			this.maNgonNgu = c.maNgonNgu;
			this.tenNgonNgu = c.tenNgonNgu;
		}
	}
}
