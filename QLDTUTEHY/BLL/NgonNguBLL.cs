using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using Entities;
namespace BLL
{
    public class NgonNguBLL
    {
        NgonNguDAL nndal = new NgonNguDAL();
        public int Them(NgonNgu nn)
        {
            return nndal.Them(nn);
        }
        public int Sua(NgonNgu nn)
        {
            return nndal.Sua(nn);

        }
        public int Xoa(String ma)
        {
            return nndal.Xoa(ma);
        }
        public NgonNgu LayNgonNgu(string ma)
        {
            return nndal.LayNgonNgu(ma);
        }
        public List<NgonNgu> DSNgonNgu()
        {
            return nndal.DSNgonNgu();
        }
    }
}

