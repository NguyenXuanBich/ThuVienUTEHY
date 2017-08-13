using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using Entities;

namespace BLL
{
   public class TaiKhoanBLL
    {
        TaiKhoanDAL tkdal = new TaiKhoanDAL();
        public int Them(TaiKhoan tk)
        {
            return tkdal.Them(tk);
        }
        public int Sua(TaiKhoan tk)
        {
            return tkdal.Sua(tk);

        }
        public int Xoa(String Ten)
        {
            return tkdal.Xoa(Ten);
        }
        public TaiKhoan LayTaiKhoan(string Ten)
        {
            return tkdal.LayTaiKhoan(Ten);
        }
        public List<TaiKhoan> DSTaiKhoan()
        {
            return tkdal.DSTaiKhoan();
        }
    }
}
