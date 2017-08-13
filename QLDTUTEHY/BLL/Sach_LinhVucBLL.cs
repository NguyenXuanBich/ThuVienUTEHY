using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;
using DAL;

namespace BLL
{
    public class Sach_LinhVucBLL
    {
        Sach_LinhVucDAL s_lvdal = new Sach_LinhVucDAL();
        public int Them(Sach_LinhVuc s_lv)
        {
            return s_lvdal.Them(s_lv);
        }
        public int Xoa(String ma)
        {
            return s_lvdal.Xoa(ma);
        }
        public Sach_LinhVuc LaySLV(string ma)
        {
            return s_lvdal.LaySach_LinhVuc(ma);
        }
        public List<Sach_LinhVuc> DSSLV()
        {
            return s_lvdal.DSSach_LinhVuc();
        }
    }
}
