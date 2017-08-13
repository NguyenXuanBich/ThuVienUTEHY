using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Entities;

namespace DAL
{
    public class QuaTrinhMuonTraDAL
    {
        private const string PARM_MAQUATRINHMUONTRA = "@MaQuaTrinhMuonTra";
        private const string PARM_MACANBO = "@MaCanBo_HSSV";
        private const string PARM_MATHUTHU = "@MaThuThu";
        private const string PARM_THOIGIANMUONTRA = "@ThoiGianMuonTra";
        private const string PARM_XUPHATNEUCO = "@XuPhatNeuCo";
        private const string PARM_GHICHU = "@GhiChu";
        private const string PARM_MADOCGIA = "@MaDocGia";
        private const string PARM_SACH = "@MaSach";
        public int Them(QuaTrinhMuonTra QTMT)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MAQUATRINHMUONTRA,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MACANBO,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MATHUTHU,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_THOIGIANMUONTRA,SqlDbType.Date),              
                new SqlParameter(PARM_XUPHATNEUCO,SqlDbType.NVarChar,-1),
                new SqlParameter(PARM_GHICHU,SqlDbType.NVarChar,-1)
            };
            parm[0].Value = QTMT.MaQuaTrinhMuonTra;
            parm[1].Value = QTMT.MaCanBo_HSSV;
            parm[2].Value = QTMT.MaThuThu;
            parm[3].Value = QTMT.ThoiGianMuonTra;
            parm[4].Value = QTMT.XuPhatNeuCo;
            parm[4].Value = "";
            parm[5].Value = QTMT.GhiChu;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblQuaTrinhMuonTra_Them", parm);

        }
        public int Sua(QuaTrinhMuonTra QTMT)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MAQUATRINHMUONTRA,SqlDbType.Int),
                new SqlParameter(PARM_MACANBO,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MATHUTHU,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_THOIGIANMUONTRA,SqlDbType.Date),
                
                new SqlParameter(PARM_XUPHATNEUCO,SqlDbType.NVarChar,-1),
                new SqlParameter(PARM_GHICHU,SqlDbType.NVarChar,-1)
            };
            parm[0].Value = QTMT.MaQuaTrinhMuonTra;
            parm[1].Value = QTMT.MaCanBo_HSSV;
            parm[2].Value = QTMT.MaThuThu;
            parm[3].Value = QTMT.ThoiGianMuonTra;
            parm[4].Value = QTMT.XuPhatNeuCo;
            parm[5].Value = QTMT.GhiChu;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblQuaTrinhMuonTra_Sua", parm);

        }
        public int Xoa(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MAQUATRINHMUONTRA,SqlDbType.Int),                
            };
            parm[0].Value = Ma;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblQuaTrinhMuonTra_Xoa", parm);
        }
        public List<QuaTrinhMuonTra> DSQTMT()
        {
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblQuaTrinhMuonTra_DS", null);
            List<QuaTrinhMuonTra> mylist = new List<QuaTrinhMuonTra>();
            while (d.Read())
            {
                QuaTrinhMuonTra QTMT = new QuaTrinhMuonTra();
                QTMT.MaQuaTrinhMuonTra = d[0].ToString();
                QTMT.MaCanBo_HSSV = d["Ten"].ToString();
                QTMT.MaThuThu = d["TT"].ToString();
                QTMT.ThoiGianMuonTra = DateTime.Parse(d[3].ToString());
                QTMT.XuPhatNeuCo = d[4].ToString();
                QTMT.GhiChu = d[5].ToString();
                QTMT.Muon = int.Parse(d[7].ToString());
                QTMT.Tra = int.Parse(d[6].ToString());
                mylist.Add(QTMT);
            }
            d.Dispose();
            return mylist;
        }
        public QuaTrinhMuonTra LayQTMT(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MAQUATRINHMUONTRA,SqlDbType.NVarChar,30),               
            };
            parm[0].Value = Ma;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblQuaTrinhMuonTra_Lay1", parm);
            QuaTrinhMuonTra QTMT = new QuaTrinhMuonTra();
            if (d.Read())
            {
                QTMT.MaQuaTrinhMuonTra = d[0].ToString();
                QTMT.MaCanBo_HSSV = d[1].ToString();
                QTMT.MaThuThu = d[2].ToString();
                QTMT.ThoiGianMuonTra = DateTime.Parse(d[3].ToString());
                QTMT.XuPhatNeuCo = d[4].ToString();
                QTMT.GhiChu = d[5].ToString();
            }
            return QTMT;
        }
        public int Check(string Ma, string MaDG)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_SACH, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MADOCGIA,SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            parm[1].Value = MaDG;
            return int.Parse(DALHelper.ExecuteScalar(DALHelper.ConnectionString, CommandType.StoredProcedure, "KtraTonTaiMuon", parm).ToString());

        }
        public string LayTen(string madg)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MADOCGIA,SqlDbType.NVarChar,30)
            };
            parm[0].Value = madg;
            return DALHelper.ExecuteScalar(DALHelper.ConnectionString, CommandType.StoredProcedure, "LayTenDG", parm).ToString();
        }
        public DataTable DSSachNoDG(string maDG)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MADOCGIA,SqlDbType.NVarChar,30)
            };
            parm[0].Value = maDG;
            return DALHelper.ExecuteDataTable(DALHelper.ConnectionString, CommandType.StoredProcedure, "DocGia_SachNo", parm);
        }
    }
}
