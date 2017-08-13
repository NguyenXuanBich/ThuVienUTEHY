using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Entities;


namespace DAL
{
    public class Sach_TheLoaiDAL
    {
        private const string PARM_MASACH = "@MaSach";
        private const string PARM_MATHELOAI = "@MaTheLoai";
        public int Them(Sach_TheLoai s_tl)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MASACH,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MATHELOAI,SqlDbType.NVarChar,30)
            };
            parm[0].Value = s_tl.MaSach;
            parm[1].Value = s_tl.MaTheLoai;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_TheLoai_Them", parm);
        }
        public int Xoa(string maSach)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MASACH,SqlDbType.NVarChar,30)            
            };
            parm[0].Value = maSach;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_TheLoai_Xoa_Sach", parm);
        }
        public List<Sach_TheLoai> DSSach_TheLoai()
        {
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_TheLoai_DS", null);
            List<Sach_TheLoai> mylist = new List<Sach_TheLoai>();
            while(d.Read())
            {
                Sach_TheLoai s_tl = new Sach_TheLoai();
                s_tl.MaSach = d[0].ToString();
                s_tl.MaTheLoai = d[1].ToString();
                mylist.Add(s_tl);
            }
            d.Dispose();
            return mylist;
        }
        public Sach_TheLoai LaySach_TheLoai(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MASACH,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MATHELOAI,SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_TheLoai_Lay1", parm);
            Sach_TheLoai s_tl = new Sach_TheLoai();
            if(d.Read())
            {
                s_tl.MaSach = d[0].ToString();
                s_tl.MaTheLoai = d[1].ToString();
            }
            return s_tl;
        }
    }
}
