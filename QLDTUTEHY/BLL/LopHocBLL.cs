using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;
using DAL;

namespace BLL
{
    public class LopHocBLL
    {

       LopHocDAL lhdal = new LopHocDAL();
        public int Them(LopHoc lh)
        {
            return lhdal.Them(lh);
        }
        public int Sua(LopHoc lh)
        {
            return lhdal.Sua(lh);

        }
        public int Xoa(String ma)
        {
            return lhdal.Xoa(ma);
        }
        public LopHoc LayLopHoc(string ma)
        {
            return lhdal.LayLopHoc(ma);
        }
        public List<LopHoc> DSLopHoc()
        {
            return lhdal.DSLopHoc();
        }

        public List<LopHoc> DSL()
        {
            return lhdal.DSLopHoc();
        }
        public bool CheckMaLH(string id)
        {
            return lhdal.CheckID(id);
        }
    }
}