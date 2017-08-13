using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;
using DAL;

namespace BLL
{
    public class SachBLL
    {
        SachDAL sdal = new SachDAL();
        public int Them(Sach s)
        {
            return sdal.Them(s);
        }
        public int Sua(Sach s)
        {
            return sdal.Sua(s);
        }
        public int Xoa(string ma)
        {
            return sdal.Xoa(ma);
        }
        public Sach LaySach(string ma)
        {
            return sdal.LaySach(ma);
        }
        public List<Sach> DSSach()
        {
            return sdal.DSSach();
        }
        public List<Sach> TimSach(String Ma)
        {
            return sdal.TimSach(Ma);
        }
    }
}
