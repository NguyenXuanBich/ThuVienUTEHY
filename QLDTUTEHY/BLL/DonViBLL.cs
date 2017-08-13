using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;
using DAL;

namespace BLL
{
    public class DonViBLL
    {
        DonViDAL dvdal = new DonViDAL();
        public int Them(DonVi dv)
        {
            return dvdal.Them(dv);
        }
        public int Sua(DonVi dv)
        {
            return dvdal.Sua(dv);

        }
        public int Xoa(String ma)
        {
            return dvdal.Xoa(ma);
        }
        public DonVi LayDV(string ma)
        {
            return dvdal.LayDV(ma);
        }
        public List<DonVi> DSDV()
        {
            return dvdal.DSDV();
        }
        public bool CheckDonVi(string id)
        {
            return dvdal.CheckID(id);
        }
    }
}
