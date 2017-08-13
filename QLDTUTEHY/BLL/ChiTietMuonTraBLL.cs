using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;
using DAL;

namespace BLL
{
    public class ChiTietMuonTraBLL
    {
        ChiTietMuonTraDAL ctmtdal = new ChiTietMuonTraDAL();
        public int Them(ChiTietMuonTra ctmt)
        {
            return ctmtdal.Them(ctmt);
        }
        public int Sua(ChiTietMuonTra ctmt)
        {
            return ctmtdal.Sua(ctmt);

        }
        public int Xoa(String ma)
        {
            return ctmtdal.Xoa(ma);
        }
        public ChiTietMuonTra LayCTMT(string ma)
        {
            return ctmtdal.LayCTMT(ma);
        }
        public List<ChiTietMuonTra> DSCTMT()
        {
            return ctmtdal.DSCTMT();
        }
    }
}
