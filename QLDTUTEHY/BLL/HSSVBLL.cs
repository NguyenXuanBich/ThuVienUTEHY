using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;
using DAL;

namespace BLL
{
    public class HSSVBLL

    {
        HSSVDAL hsdal = new HSSVDAL();
        public int Them(HSSV hs)
        {
            return hsdal.Them(hs);
        }
        public int Sua(HSSV hs)
        {
            return hsdal.Sua(hs);

        }
        public int Xoa(String ma)
        {
            return hsdal.Xoa(ma);
        }
        public HSSV LayHSSV(string ma)
        {
            return hsdal.LayHSSV(ma);
        }
        public List<HSSV> DSHSSV()
        {
            return hsdal.DSHSSV();
        }
        public bool CheckMaHSSV(string id)
        {
            return hsdal.CheckID(id);
        }
        public HSSV Login(string id,string pas)
        {
            return hsdal.Login(id, pas);
        }
    }
}