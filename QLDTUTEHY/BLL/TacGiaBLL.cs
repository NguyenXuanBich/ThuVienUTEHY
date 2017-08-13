using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;
using DAL;

namespace BLL
{
    public class TacGiaBLL
    {
        TacGiaDAL tgdal = new TacGiaDAL();
        public int Them(TacGia tg)
        {
            return tgdal.Them(tg);
        }
        public int Sua(TacGia tg)
        {
           return tgdal.Sua(tg);

        }
        public int Xoa(String ma)
        {
            return tgdal.Xoa(ma);
        }
        public TacGia LayTacGia(string ma)
        {
            return tgdal.LayTacGia(ma);
        }
        public List<TacGia> DSTacGia()
        {
            return tgdal.DSTacGia();
        }
        public List<TacGia> DSTacGia_Sach(string maSach)
        {
            return tgdal.DSTacGia_Sach(maSach);
        }
    }
}
