using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using Entities;
namespace BLL
{
    public class Sach_TacGiaBLL
    {
        Sach_TacGiaDAL s_tgdal = new Sach_TacGiaDAL();
        public int Them(Sach_TacGia s_tg)
        {
            return s_tgdal.Them(s_tg);
        }
        public int Xoa(String ma)
        {
            return s_tgdal.Xoa(ma);
        }
        public Sach_TacGia LaySach_TacGia(string ma)
        {
            return s_tgdal.LaySach_TacGia(ma);
        }
        public List<Sach_TacGia> DSSach_TacGia()
        {
            return s_tgdal.DSSach_TacGia();
        }
    }
}
