using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;
using DAL;

namespace BLL
{
   public class TheLoaiBLL
    {
        TheLoaiDAL tldal = new TheLoaiDAL();
        public int Them(TheLoai tl)
        {
            return tldal.Them(tl);
        }
        public int Sua(TheLoai tl)
        {
            return tldal.Sua(tl);

        }
        public int Xoa(String ma)
        {
            return tldal.Xoa(ma);
        }
        public TheLoai LayTL(string ma)
        {
            return tldal.LayTL(ma);
        }
        public List<TheLoai> DSTL()
        {
            return tldal.DSTL();
        }
       
    }
}