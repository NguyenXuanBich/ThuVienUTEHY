using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;
using DAL;

namespace BLL
{
    public class Sach_TheLoaiBLL
    {
        Sach_TheLoaiDAL s_tldal = new Sach_TheLoaiDAL();
        public int Them(Sach_TheLoai stl)
        {
            return s_tldal.Them(stl);
        }
        public int Xoa(String ma)
        {
            return s_tldal.Xoa(ma);
        }
        public Sach_TheLoai LayCB(string ma)
        {
            return s_tldal.LaySach_TheLoai(ma);
        }
        public List<Sach_TheLoai> DSSTL()
        {
            return s_tldal.DSSach_TheLoai();
        }
    }
}
