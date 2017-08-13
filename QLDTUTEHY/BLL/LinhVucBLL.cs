using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;
using DAL;

namespace BLL
{
   public class LinhVucBLL
   {
       LinhVucDAL lvdal = new LinhVucDAL();
       public List<LinhVuc> DSLV()
       {
           return lvdal.DSLV();
       }
       public int Them(LinhVuc lv)
       {
           return lvdal.Them(lv);
       }
       public int Sua(LinhVuc lv)
       {
           return lvdal.Sua(lv);

       }
       public int Xoa(String ma)
       {
           return lvdal.Xoa(ma);
       }
       public LinhVuc LayLV(string ma)
       {
           return lvdal.LayLV(ma);
       }
    }
}
