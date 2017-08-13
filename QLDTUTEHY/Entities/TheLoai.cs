using System;

namespace Entities
{
    [Serializable]
    public class TheLoai
    {

        private string maTheLoai;

        private string tenTheLoai;

        private string moTa;

        public string MaTheLoai
        {
            get { return this.maTheLoai; }
            set { this.maTheLoai = value; }
        }

        public string TenTheLoai
        {
            get { return this.tenTheLoai; }
            set { this.tenTheLoai = value; }
        }

        public string MoTa
        {
            get { return this.moTa; }
            set { this.moTa = value; }
        }

        public TheLoai()
        { }

        public TheLoai(string MaTheLoai, string TenTheLoai, string MoTa)
        {
            this.maTheLoai = MaTheLoai;
            this.tenTheLoai = TenTheLoai;
            this.moTa = MoTa;
        }

        public TheLoai(TheLoai c)
        {
            this.maTheLoai = c.maTheLoai;
            this.tenTheLoai = c.tenTheLoai;
            this.moTa = c.moTa;
        }
    }
}
