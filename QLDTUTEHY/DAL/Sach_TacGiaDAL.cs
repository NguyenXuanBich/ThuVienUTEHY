using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Entities;

namespace DAL
{
    public class Sach_TacGiaDAL
    {
        private const string PARM_MASACH = "@MaSach";
        private const string PARM_MATACGIA = "@MaTacGia";//ở đây khai báo các tên cột với @ ở trước
        public int Them(Sach_TacGia s_tg)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MASACH,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MATACGIA,SqlDbType.NVarChar,30)
                //khai báo thứ tự như trong cái store đó
                //(-thuộc tính thứ nhất lấy từ tên khai báo ở trên-tiếp theo là kiểu dữ liệu-tiếp nữa là độ dài kiểu dữ liệu)
                //nếu là kiểu dữ liệu k có độ dài thì mình bỏ cái thuộc tính thứ 3 ví dụ như new sqlparameter(PARM_....,SqlDbType.Int)
            };
            parm[0].Value = s_tg.MaSach;
            parm[1].Value = s_tg.MaTacGia;
            //chỗ này thì phải truyền đúng theo thứ tự khai báo ở trên
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_TacGia_Them", parm); //các thuộc tính của hàm này không thay đổi trong mọi hàm trừ tên store với có hàm lấy tất thì đổi cả tên và parm là 
        }
        public int Xoa(string MaSach)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MASACH,SqlDbType.NVarChar,30),           
            };
            parm[0].Value = MaSach;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_TacGia_Xoa_Sach", parm);
        }
        public List<Sach_TacGia> DSSach_TacGia()
        {
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_TacGia_DS", null);//chỗ này để ý cuối là null
            List<Sach_TacGia> mylist = new List<Sach_TacGia>();
            while (d.Read())
            {
                Sach_TacGia s_tg = new Sach_TacGia();
                //chỗ này truyền thuộc tính phải đúng thứ tự như trong bảng sql
                s_tg.MaSach = d[0].ToString();
                s_tg.MaTacGia = d[1].ToString();
                mylist.Add(s_tg);
            }
            d.Dispose();
            return mylist;
        }
        /// <summary>
        /// Chỗ này truyền vào tương tự hàm sửa.cũng theo khóa chính
        /// </summary>
        /// <param name="Ma"></param>
        /// <returns></returns>
        public Sach_TacGia LaySach_TacGia(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MASACH,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MATACGIA,SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_TacGia_Lay1", parm);
            Sach_TacGia s_tg = new Sach_TacGia();
            if (d.Read())
            {
                s_tg.MaSach = d[0].ToString();
                s_tg.MaTacGia = d[1].ToString();
            }
            return s_tg;
        }
    }
}
