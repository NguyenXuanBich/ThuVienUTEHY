using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Entities;

namespace DAL
{
    public class Sach_LinhVucDAL
    {
        private const string PARM_MASACH = "@MaSach";
        private const string PARM_MALINHVUC = "@MaLinhVuc";
        public int Them(Sach_LinhVuc s_lv)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MASACH,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MALINHVUC,SqlDbType.NVarChar,30)
            };
            parm[0].Value = s_lv.MaSach;
            parm[1].Value = s_lv.MaLinhVuc;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_LinhVuc_Them", parm); //các thuộc tính của hàm này không thay đổi trong mọi hàm trừ tên store với có hàm lấy tất thì đổi cả tên và parm là 

        }
        public int Xoa(string maSach)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MASACH,SqlDbType.NVarChar,30),                
            };
            parm[0].Value = maSach;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_LinhVuc_Xoa_Sach", parm);
        }
        public List<Sach_LinhVuc> DSSach_LinhVuc()
        {
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_LinhVuc_DS", null);//chỗ này để ý cuối là null
            List<Sach_LinhVuc> mylist = new List<Sach_LinhVuc>();
            while (d.Read())
            {
                Sach_LinhVuc s_lv = new Sach_LinhVuc();
                //chỗ này truyền thuộc tính phải đúng thứ tự như trong bảng sql
                s_lv.MaSach = d[0].ToString();
                s_lv.MaLinhVuc = d[1].ToString();
                mylist.Add(s_lv);
            }
            d.Dispose();
            return mylist;
        }
        public Sach_LinhVuc LaySach_LinhVuc(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MASACH,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MALINHVUC,SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_LinhVuc_Lay1", parm);
            Sach_LinhVuc s_lv = new Sach_LinhVuc();
            if (d.Read())
            {
                s_lv.MaSach = d[0].ToString();
                s_lv.MaLinhVuc = d[1].ToString();
            }
            return s_lv;
        }
    }
}
