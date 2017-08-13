using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using Entities;

namespace BLL
{
   public class ThuThuBLL
    {
        ThuThuDAL ttdal = new ThuThuDAL();
        public int Them(ThuThu tt)
        {
            return ttdal.Them(tt);
        }
        public int Sua(ThuThu tt)
        {
            return ttdal.Sua(tt);

        }
        public int Xoa(String ma)
        {
            return ttdal.Xoa(ma);
        }
        public ThuThu LayThuThu(string ma)
        {
            return ttdal.LayThuThu(ma);
        }
        public List<ThuThu> DSThuThu()
        {
            return ttdal.DSThuThu();
        }
       public bool CheckMa(string id)
        {
           return ttdal.CheckID(id);
        }
       public ThuThu Login(string ma,string pass)
       {
           return ttdal.Login(ma,pass);
       }
    }
}
