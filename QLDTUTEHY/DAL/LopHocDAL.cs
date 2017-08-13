using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Entities;

namespace DAL
{
    public class LopHocDAL
    {
        private const string PARM_MALOP = "@MaLop";
        private const string PARM_MAKHOA = "@MaKhoa";
        private const string PARM_TENLOP = "@TenLop";
        private const string PARM_HEDAOTAO = "@HeDaoTao";
        private const string PARM_KHOA = "@Khoa";
        public int Them(LopHoc lh)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MALOP,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MAKHOA,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TENLOP,SqlDbType.NVarChar,30),
                 new SqlParameter(PARM_HEDAOTAO,SqlDbType.NVarChar,30),
                  new SqlParameter(PARM_KHOA,SqlDbType.NVarChar,30)
            };
            parm[0].Value = lh.MaLop;
            parm[1].Value = lh.MaKhoa;
            parm[2].Value = lh.TenLop;
            parm[3].Value = lh.HeDaoTao;
            parm[4].Value = lh.Khoa;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblLopHoc_Them", parm); //các thuộc tính của hàm này không thay đổi trong mọi hàm trừ tên store với có hàm lấy tất thì đổi cả tên và parm là null
        }
        public int Sua(LopHoc lh)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MALOP,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MAKHOA,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TENLOP,SqlDbType.NVarChar,30),
                 new SqlParameter(PARM_HEDAOTAO,SqlDbType.NVarChar,30),
                  new SqlParameter(PARM_KHOA,SqlDbType.NVarChar,30)
            };
            parm[0].Value = lh.MaLop;
            parm[1].Value = lh.MaKhoa;
            parm[2].Value = lh.TenLop;
            parm[3].Value = lh.HeDaoTao;
            parm[4].Value = lh.Khoa;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblLopHoc_Sua", parm);
        }
        public int Xoa(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MALOP,SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblLopHoc_Xoa", parm);
        }
        public List<LopHoc> DSLopHoc()
        {
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblLopHoc_DS", null);//chỗ này để ý cuối là null
            List<LopHoc> mylist = new List<LopHoc>();
            while (d.Read())
            {
                LopHoc lh = new LopHoc();
                lh.MaLop = d[0].ToString();
                lh.MaKhoa = d[1].ToString();
                lh.TenLop = d[2].ToString();
                lh.HeDaoTao = d[3].ToString();
                lh.Khoa = d[4].ToString();
                mylist.Add(lh);
            }
            d.Dispose();
            return mylist;
        }
        public LopHoc LayLopHoc(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MALOP,SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblLopHoc_Lay1", parm);
            LopHoc lh = new LopHoc();
            if (d.Read())
            {
                lh.MaLop = d[0].ToString();
                lh.MaKhoa = d[1].ToString();
                lh.TenLop = d[2].ToString();
                lh.HeDaoTao = d[3].ToString();
                lh.Khoa = d[4].ToString();
            }
            return lh;
        }
        public bool CheckID(string id)
        {
            string cmd = "select count(*) from tblLopHoc where MaLop=@MaLop";
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MALOP,SqlDbType.NVarChar,30)
            };
            parm[0].Value = id;
            int kq = (int)DALHelper.ExecuteScalar(DALHelper.ConnectionString, CommandType.Text, cmd, parm);
            if (kq > 0) return false;
            else return true;
        }
    }
}
