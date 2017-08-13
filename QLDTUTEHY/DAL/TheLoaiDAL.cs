using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class TheLoaiDAL
    {
        private const string PARM_MATHELOAI = "@MaTheLoai";
        private const string PARM_TENTHELOAI = "@TenTheLoai";
        private const string PARM_MOTA = "@MoTa";
        private const string PARM_MASACH = "@MaSach";
        public int Them(TheLoai tl)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MATHELOAI, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TENTHELOAI,SqlDbType.NVarChar,50),
                new SqlParameter(PARM_MOTA,SqlDbType.NVarChar,100)
            };
            parm[0].Value = tl.MaTheLoai;
            parm[1].Value = tl.TenTheLoai;
            parm[2].Value = tl.MoTa;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblTheLoai_Them", parm);
        }
        public int Sua(TheLoai tl)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MATHELOAI, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TENTHELOAI,SqlDbType.NVarChar,50),
                new SqlParameter(PARM_MOTA,SqlDbType.NVarChar,100)
            };
            parm[0].Value = tl.MaTheLoai;
            parm[1].Value = tl.TenTheLoai;
            parm[2].Value = tl.MoTa;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblTheLoai_Sua", parm);
        }
        public int Xoa(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MATHELOAI, SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblTheLoai_Xoa", parm);
        }
        public List<TheLoai> DSTL()
        {
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblTheLoai_DS", null);
            List<TheLoai> mylist = new List<TheLoai>();
            while (d.Read())
            {
                TheLoai lv = new TheLoai();
                lv.MaTheLoai = d[0].ToString();
                lv.TenTheLoai = d[1].ToString();
                lv.MoTa = d[2].ToString();
                mylist.Add(lv);
            }
            d.Dispose();
            return mylist;
        }
        public List<TheLoai> DSTL_Sach(string maSach)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MASACH, SqlDbType.NVarChar,30)
            };
            parm[0].Value = maSach;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblTheLoai_LayTheoSach", parm);
            List<TheLoai> mylist = new List<TheLoai>();
            while (d.Read())
            {
                TheLoai lv = new TheLoai();
                lv.MaTheLoai = d[0].ToString();
                lv.TenTheLoai = d[1].ToString();
                lv.MoTa = d[2].ToString();
                mylist.Add(lv);
            }
            d.Dispose();
            return mylist;
        }
        public TheLoai LayTL(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MATHELOAI, SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblTheLoai_Lay1", parm);
            TheLoai dv = new TheLoai();
            if (d.Read())
            {
                dv.MaTheLoai = d[0].ToString();
                dv.TenTheLoai = d[1].ToString();
                dv.MoTa = d[2].ToString();
            }
            return dv;
        }
    }
}
