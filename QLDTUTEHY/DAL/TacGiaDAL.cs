using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Entities;

namespace DAL
{
    public class TacGiaDAL
    {
        private const string PARM_MATACGIA = "@MaTacGia";
        private const string PARM_TENTACGIA = "@HoTenTacGia";//ở đây khai báo các tên cột với @ ở trước
        private const string PARM_MOTA = "@MoTa";
        private const string PARM_MASACH = "@MaSach";
        public int Them(TacGia tg)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MATACGIA,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TENTACGIA,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MOTA,SqlDbType.NVarChar,100)
                //khai báo thứ tự như trong cái store đó
                //(-thuộc tính thứ nhất lấy từ tên khai báo ở trên-tiếp theo là kiểu dữ liệu-tiếp nữa là độ dài kiểu dữ liệu)
                //nếu là kiểu dữ liệu k có độ dài thì mình bỏ cái thuộc tính thứ 3 ví dụ như new sqlparameter(PARM_....,SqlDbType.Int)
            };
            parm[0].Value = tg.MaTacGia;
            parm[1].Value = tg.HoTenTacGia;
            parm[2].Value = tg.MoTa;
            //chỗ này thì phải truyền đúng theo thứ tự khai báo ở trên
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblTacGia_Them", parm); 
            //các thuộc tính của hàm này không thay đổi trong mọi hàm trừ tên store với có hàm lấy tất thì đổi cả tên và parm là null
        }
        //hàm sửa thì có thể coppy nguyên hàm tên và đổi tên store
        public int Sua(TacGia tg)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MATACGIA,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TENTACGIA,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MOTA,SqlDbType.NVarChar,100)
                //khai báo thứ tự như trong cái store đó
                //(-thuộc tính thứ nhất lấy từ tên khai báo ở trên-tiếp theo là kiểu dữ liệu-tiếp nữa là độ dài kiểu dữ liệu)
                //nếu là kiểu dữ liệu k có độ dài thì mình bỏ cái thuộc tính thứ 3 ví dụ như new sqlparameter(PARM_....,SqlDbType.Int)
            };
            parm[0].Value = tg.MaTacGia;
            parm[1].Value = tg.HoTenTacGia;
            parm[2].Value = tg.MoTa;
            //chỗ này thì phải truyền đúng theo thứ tự khai báo ở trên
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblTacGia_Sua", parm);
        }
        /// <summary>
        /// Hàm xóa thì chỉ truyền vào  những khóa chính.ví dụ có 2 mã chính thì phải là Xoa(kiểu_dữ_liệu khóa_1,kiểu_dữ_liệu khóa_2, )
        /// </summary>
        /// <param name="Ma"></param>
        /// <returns></returns>
        public int Xoa(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MATACGIA,SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblTacGia_Xoa", parm);
        }
        public List<TacGia> DSTacGia()
        {
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblTacGia_DS", null);
            //chỗ này để ý cuối là null
            List<TacGia> mylist = new List<TacGia>();
            while (d.Read())
            {
                TacGia tg = new TacGia();
                //chỗ này truyền thuộc tính phải đúng thứ tự như trong bảng sql
                tg.MaTacGia = d[0].ToString();
                tg.HoTenTacGia = d[1].ToString();
                tg.MoTa = d[2].ToString();
                mylist.Add(tg);
            }
            d.Dispose();
            return mylist;
        }
        public List<TacGia> DSTacGia_Sach(string maSach)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MASACH,SqlDbType.NVarChar,30)
            };
            parm[0].Value = maSach;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblTacGia_LayTheoSach", parm);
            //chỗ này để ý cuối là null
            List<TacGia> mylist = new List<TacGia>();
            while (d.Read())
            {
                TacGia tg = new TacGia();
                //chỗ này truyền thuộc tính phải đúng thứ tự như trong bảng sql
                tg.MaTacGia = d[0].ToString();
                tg.HoTenTacGia = d[1].ToString();
                tg.MoTa = d[2].ToString();
                mylist.Add(tg);
            }
            d.Dispose();
            return mylist;
        }
        /// <summary>
        /// Chỗ này truyền vào tương tự hàm sửa.cũng theo khóa chính
        /// </summary>
        /// <param name="Ma"></param>
        /// <returns></returns>
        public TacGia LayTacGia(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MATACGIA,SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblTacGia_Lay1", parm);
            TacGia tg = new TacGia();
            if(d.Read())
            {
                tg.MaTacGia = d[0].ToString();
                tg.HoTenTacGia = d[1].ToString();
                tg.MoTa = d[2].ToString();
            }
            return tg;
        }
    }
}
