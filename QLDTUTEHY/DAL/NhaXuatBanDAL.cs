using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class NhaXuatBanDAL
    {
        private const string PARM_MANXB = "@MaNXB";
        private const string PARM_TENNXB = "@TenNXB";
        private const string PARM_URLLOGO = "@urlLogo";
        private const string PARM_GHICHU = "@GhiChu";
        public int Them(NhaXuatBan nxb)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MANXB, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TENNXB, SqlDbType.NVarChar,50),
                new SqlParameter(PARM_URLLOGO, SqlDbType.NVarChar,100),
                new SqlParameter(PARM_GHICHU, SqlDbType.NVarChar,150)
            };
            parm[0].Value = nxb.MaNXB;
            parm[1].Value = nxb.TenNXB;
            parm[2].Value = nxb.UrlLogo;
            parm[3].Value = nxb.GhiChu;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblNhaXuatBan_Them", parm);
        }
        public int Sua(NhaXuatBan nxb)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MANXB, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TENNXB, SqlDbType.NVarChar,50),
                new SqlParameter(PARM_URLLOGO, SqlDbType.NVarChar,100),
                new SqlParameter(PARM_GHICHU, SqlDbType.NVarChar,150)
            };
            parm[0].Value = nxb.MaNXB;
            parm[1].Value = nxb.TenNXB;
            parm[2].Value = nxb.UrlLogo;
            parm[3].Value = nxb.GhiChu;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblNhaXuatBan_Sua", parm);
        }
        public int Xoa(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MANXB, SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblNhaXuatBan_Xoa", parm);
        }
        public List<NhaXuatBan> DSNXB()
        {
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblNhaXuatBan_DS", null);
            List<NhaXuatBan> mylist = new List<NhaXuatBan>();
            while (d.Read())
            {
                NhaXuatBan nxb = new NhaXuatBan();
                nxb.MaNXB = d[0].ToString();
                nxb.TenNXB = d[1].ToString();
                nxb.UrlLogo = d[2].ToString();
                nxb.GhiChu = d[3].ToString();
                mylist.Add(nxb);
            }
            d.Dispose();
            return mylist;
        }
        public NhaXuatBan LayNXB(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MANXB, SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblNhaXuatBan_Lay1", parm);
            NhaXuatBan nxb = new NhaXuatBan();
            if(d.Read())
            {
                nxb.MaNXB = d[0].ToString();
                nxb.TenNXB = d[1].ToString();
                nxb.UrlLogo = d[2].ToString();
                nxb.GhiChu = d[3].ToString();
            }
            return nxb;
        }
    }
}
