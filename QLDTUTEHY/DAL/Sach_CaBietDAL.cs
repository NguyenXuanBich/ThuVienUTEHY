using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Entities;

namespace DAL
{
    public class Sach_CaBietDAL
    {
        private const string PARM_MASACH = "@MaSach";
        private const string PARM_MASOCABIET = "@MaSoCaBiet";
        private const string PARM_TINHTRANG = "@TinhTrang";
        private const string PARM_GHICHU = "@GhiChu";
        public int Them(Sach_CaBiet s_cb)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MASACH, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MASOCABIET, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TINHTRANG, SqlDbType.Bit),
                new SqlParameter(PARM_GHICHU, SqlDbType.NVarChar,-1)
            };
            parm[0].Value = s_cb.MaSach;
            parm[1].Value = s_cb.MaSoCaBiet;
            parm[2].Value = s_cb.TinhTrang;
            parm[3].Value = s_cb.GhiChu;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_CaBiet_Them", parm); //các thuộc tính của hàm này không thay đổi trong mọi hàm trừ tên store với có hàm lấy tất thì đổi cả tên và parm là 

        }
        public int Sua(Sach_CaBiet s_cb)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MASACH, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MASOCABIET, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TINHTRANG, SqlDbType.Bit),
                new SqlParameter(PARM_GHICHU, SqlDbType.NVarChar,-1)
            };
            parm[0].Value = s_cb.MaSach;
            parm[1].Value = s_cb.MaSoCaBiet;
            parm[2].Value = s_cb.TinhTrang;
            parm[3].Value = s_cb.GhiChu;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_CaBiet_Sua", parm); //các thuộc tính của hàm này không thay đổi trong mọi hàm trừ tên store với có hàm lấy tất thì đổi cả tên và parm là 

        }
        public int Xoa(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MASACH, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MASOCABIET,SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_CaBiet_Xoa", parm);

        }
        public int Check(string Ma, string MaCB)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MASACH, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MASOCABIET,SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            parm[1].Value = MaCB;
            return int.Parse(DALHelper.ExecuteScalar(DALHelper.ConnectionString, CommandType.StoredProcedure, "CheckSachCaBiet", parm).ToString());

        }
        public List<Sach_CaBiet> DSSach_CaBiet()
        {
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_CaBiet_DS", null);//chỗ này để ý cuối là null
            List<Sach_CaBiet> mylist = new List<Sach_CaBiet>();
            while (d.Read())
            {
                Sach_CaBiet s_cb = new Sach_CaBiet();
                //chỗ này truyền thuộc tính phải đúng thứ tự như trong bảng sql
                s_cb.MaSach = d[0].ToString();
                s_cb.MaSoCaBiet = d[1].ToString();
                s_cb.TinhTrang = short.Parse(d[2].ToString());
                s_cb.GhiChu = d[3].ToString();
                mylist.Add(s_cb);
            }
            d.Dispose();
            return mylist;
        }
        public Sach_CaBiet LaySach_CaBiet(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MASACH,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MASOCABIET,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TINHTRANG,SqlDbType.Bit),
                new SqlParameter(PARM_GHICHU,SqlDbType.NVarChar,-1)
            };
            parm[0].Value = Ma;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_CaBiet_Lay1", parm);
            Sach_CaBiet s_cb = new Sach_CaBiet();
            if (d.Read())
            {
                s_cb.MaSach = d[0].ToString();
                s_cb.MaSoCaBiet = d[1].ToString();
                s_cb.TinhTrang = short.Parse(d[2].ToString());
                s_cb.GhiChu = d[3].ToString();
            }
            return s_cb;
        }
    }
}
