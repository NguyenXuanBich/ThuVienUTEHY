using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Entities;

namespace DAL
{
    public class ChiTietMuonTraDAL
    {
        private const string PARM_MAQUATRINHTRASACH = "@MaQuaTrinhTraSach";
        private const string PARM_MASACH = "@MaSach";
        private const string PARM_TINHTRANG = "@TinhTrang";
        private const string PARM_MASOCABIET = "@MaSoCaBiet";
        private const string PARM_MUONHAYTRA = "@MuonHayTra";
        private const string PARM_SONGAYMUON = "@SoNgayMuon";
        public int Them(ChiTietMuonTra CTMT)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MAQUATRINHTRASACH,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MASACH,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TINHTRANG,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MASOCABIET,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MUONHAYTRA,SqlDbType.TinyInt),
                new SqlParameter(PARM_SONGAYMUON,SqlDbType.Int)
            };
            parm[0].Value = CTMT.MaQuaTrinhTraSach;
            parm[1].Value = CTMT.MaSach;
            parm[2].Value = CTMT.TinhTrang;
            parm[3].Value = CTMT.MaSoCaBiet;
            parm[4].Value = CTMT.MuonHayTra;
            parm[5].Value = CTMT.SoNgayMuon;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblChiTietMuonTra_Them", parm);

        }
        public int Sua(ChiTietMuonTra CTMT)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MAQUATRINHTRASACH,SqlDbType.Int),
                new SqlParameter(PARM_MASACH,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TINHTRANG,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MASOCABIET,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MUONHAYTRA,SqlDbType.Bit),
                new SqlParameter(PARM_SONGAYMUON,SqlDbType.Int)
            };
            parm[0].Value = CTMT.MaQuaTrinhTraSach;
            parm[1].Value = CTMT.MaSach;
            parm[2].Value = CTMT.TinhTrang;
            parm[3].Value = CTMT.MaSoCaBiet;
            parm[4].Value = CTMT.MuonHayTra;
            parm[5].Value = CTMT.SoNgayMuon;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblChiTietMuonTra_Sua", parm);
        }
        public int Xoa(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MAQUATRINHTRASACH,SqlDbType.Int),
                new SqlParameter(PARM_MASACH,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MASOCABIET,SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblChiTietMuonTra_Xoa", parm);
        }
        public List<ChiTietMuonTra> DSCTMT()
        {
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblChiTietMuonTra_LayDS", null);
            List<ChiTietMuonTra> mylist = new List<ChiTietMuonTra>();
            while (d.Read())
            {
                ChiTietMuonTra CTMT = new ChiTietMuonTra();
                CTMT.MaQuaTrinhTraSach = d[0].ToString();
                CTMT.MaSach = d[1].ToString();
                CTMT.TinhTrang = d[2].ToString();
                CTMT.MaSoCaBiet = d[3].ToString();
                CTMT.MuonHayTra = short.Parse(d[4].ToString());
                CTMT.SoNgayMuon = int.Parse(d[5].ToString());
                mylist.Add(CTMT);
            }
            d.Dispose();
            return mylist;
        }
        public ChiTietMuonTra LayCTMT(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MAQUATRINHTRASACH,SqlDbType.Int),
                new SqlParameter(PARM_MASACH,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TINHTRANG,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MASOCABIET,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MUONHAYTRA,SqlDbType.Bit)
            };
            parm[0].Value = Ma;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblChiTietMuonTra_Lay1", parm);
            ChiTietMuonTra CTMT = new ChiTietMuonTra();
            if (d.Read())
            {
                CTMT.MaQuaTrinhTraSach = d[0].ToString();
                CTMT.MaSach = d[1].ToString();
                CTMT.TinhTrang = d[2].ToString();
                CTMT.MaSoCaBiet = d[3].ToString();
                CTMT.MuonHayTra = short.Parse(d[4].ToString());
                CTMT.SoNgayMuon = int.Parse(d[5].ToString());
            }
            return CTMT;
        }
    }
}
