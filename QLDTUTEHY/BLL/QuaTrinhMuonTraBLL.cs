using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;
using DAL;
using System.Data;

namespace BLL
{
    public class QuaTrinhMuonTraBLL
    {
        
        QuaTrinhMuonTraDAL qtmtdal = new QuaTrinhMuonTraDAL();
        public int Them(QuaTrinhMuonTra qtmt)
        {
            return qtmtdal.Them(qtmt);
        }
        public int Sua(QuaTrinhMuonTra qtmt)
        {
            return qtmtdal.Sua(qtmt);

        }
        public int Xoa(String ma)
        {
            return qtmtdal.Xoa(ma);
        }
        public QuaTrinhMuonTra LayQTMT(string ma)
        {
            return qtmtdal.LayQTMT(ma);
        }
        public List<QuaTrinhMuonTra> DSQTMT()
        {
            return qtmtdal.DSQTMT();
        }
        public string LayTen(string ma)
        {
            return qtmtdal.LayTen(ma);
        }
        public int Check(string mas, string madg)
        {
            return qtmtdal.Check(mas, madg);
        }
        public DataTable DocGiaSachNo(string DG)
        {
            return qtmtdal.DSSachNoDG(DG);
        }
    }
}
