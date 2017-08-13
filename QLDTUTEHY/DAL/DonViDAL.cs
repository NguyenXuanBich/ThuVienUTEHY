using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class DonViDAL
    {
        private const string PARM_MADONVI = "@MaDonVi";
        private const string PARM_TENDONVI = "@TenDonVi";
        private const string PARM_DIACHI = "@DiaChi";
        private const string PARM_SODIENTHOAI = "@SoDienThoai";
        private const string PARM_TRUONGDONVI = "@TruongDonVi";
        private const string PARM_EMAIL = "@EMail";
        private const string PARM_WEBSITE = "@Website";
        public int Them(DonVi dv)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MADONVI, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TENDONVI, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_DIACHI, SqlDbType.NVarChar,50),
                new SqlParameter(PARM_SODIENTHOAI, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TRUONGDONVI, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_EMAIL, SqlDbType.NVarChar,40),
                new SqlParameter(PARM_WEBSITE, SqlDbType.NVarChar,40)
            };
            parm[0].Value = dv.MaDonVi;
            parm[1].Value = dv.TenDonVI;
            parm[2].Value = dv.DiaChi;
            parm[3].Value = dv.SoDienThoai;
            parm[4].Value = dv.TruongDonVI;
            parm[5].Value = dv.EMail;
            parm[6].Value = dv.Website;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblDonVi_Them", parm);
        }
        public int Sua(DonVi dv)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MADONVI, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TENDONVI, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_DIACHI, SqlDbType.NVarChar,50),
                new SqlParameter(PARM_SODIENTHOAI, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TRUONGDONVI, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_EMAIL, SqlDbType.NVarChar,40),
                new SqlParameter(PARM_WEBSITE, SqlDbType.NVarChar,40)
            };
            parm[0].Value = dv.MaDonVi;
            parm[1].Value = dv.TenDonVI;
            parm[2].Value = dv.DiaChi;
            parm[3].Value = dv.SoDienThoai;
            parm[4].Value = dv.TruongDonVI;
            parm[5].Value = dv.EMail;
            parm[6].Value = dv.Website;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblDonVi_Sua", parm);
        }
        public int Xoa(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MADONVI, SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblDonVi_Xoa", parm);
        }
        public List<DonVi> DSDV()
        {
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblDonVi_DS", null);
            List<DonVi> mylist = new List<DonVi>();
            while (d.Read())
            {
                DonVi dv = new DonVi();
                dv.MaDonVi = d[0].ToString();
                dv.TenDonVI = d[1].ToString();
                dv.DiaChi = d[2].ToString();
                dv.SoDienThoai = d[3].ToString();
                dv.TruongDonVI = d[4].ToString();
                dv.EMail = d[5].ToString();
                dv.Website = d[6].ToString();
                mylist.Add(dv);
            }
            d.Dispose();
            return mylist;
        }
        public DonVi LayDV(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MADONVI, SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblDonVi_Lay1", parm);
            DonVi dv = new DonVi();
            if(d.Read())
            {
                dv.MaDonVi = d[0].ToString();
                dv.TenDonVI = d[1].ToString();
                dv.DiaChi = d[2].ToString();
                dv.SoDienThoai = d[3].ToString();
                dv.TruongDonVI = d[4].ToString();
                dv.EMail = d[5].ToString();
                dv.Website = d[6].ToString();
            }
            return dv;
        }
        public bool CheckID(string id)
        {
            string cmd = "select count(*) from tblDonVi where MaDonVi=@MaDonVi";
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MADONVI,SqlDbType.NVarChar,30)
            };
            parm[0].Value = id;
            int kq = (int)DALHelper.ExecuteScalar(DALHelper.ConnectionString, CommandType.Text, cmd, parm);
            if (kq > 0) return false;
            else return true;
        }
    }
}
