using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class LinhVucDAL
    {
        private const string PARM_MALINHVUC = "@MaLinhVuc";
        private const string PARM_TENLINHVUC = "@TenLinhVuc";
        private const string PARM_GHICHU = "@GhiChu";
        private const string PARM_MASACH = "@MaSach";
        public int Them(LinhVuc lv)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MALINHVUC, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TENLINHVUC, SqlDbType.NVarChar,50),
                new SqlParameter(PARM_GHICHU, SqlDbType.NVarChar,100)
            };
            parm[0].Value = lv.MaLinhVuc;
            parm[1].Value = lv.TenLinhVuc;
            parm[2].Value = lv.GhiChu; 
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblLinhVuc_Them", parm);
        }
        public int Sua(LinhVuc lv)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MALINHVUC, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TENLINHVUC, SqlDbType.NVarChar,50),
                new SqlParameter(PARM_GHICHU, SqlDbType.NVarChar,100)
            };
            parm[0].Value = lv.MaLinhVuc;
            parm[1].Value = lv.TenLinhVuc;
            parm[2].Value = lv.GhiChu; 
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblLinhVuc_Sua", parm);
        }
        public int Xoa(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MALINHVUC, SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblLinhVuc_Xoa", parm);
        }
        public List<LinhVuc> DSLV()
        {
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblLinhVuc_DS", null);
            List<LinhVuc> mylist = new List<LinhVuc>();
            while (d.Read())
            {
                LinhVuc lv = new LinhVuc();
                lv.MaLinhVuc = d[0].ToString();
                lv.TenLinhVuc = d[1].ToString();
                lv.GhiChu = d[2].ToString();
                mylist.Add(lv);
            }
            d.Dispose();
            return mylist;
        }
        public LinhVuc LayLV(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MALINHVUC, SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblLinhVuc_Lay1", parm);
            LinhVuc dv = new LinhVuc();
            if (d.Read())
            {
                dv.MaLinhVuc = d[0].ToString();
                dv.TenLinhVuc = d[1].ToString();
                dv.GhiChu = d[2].ToString();
            }
            return dv;
        }
        public List<LinhVuc> DSLV_Sach(string maSach)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MASACH, SqlDbType.NVarChar,30)
            };
            parm[0].Value = maSach;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblLinhVuc_LayTheoSach", parm);
            List<LinhVuc> mylist = new List<LinhVuc>();
            while (d.Read())
            {
                LinhVuc lv = new LinhVuc();
                lv.MaLinhVuc = d[0].ToString();
                lv.TenLinhVuc = d[1].ToString();
                lv.GhiChu = d[2].ToString();
                mylist.Add(lv);
            }
            d.Dispose();
            return mylist;
        }
    }
}
