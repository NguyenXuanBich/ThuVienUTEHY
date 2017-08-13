using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Entities;

namespace DAL
{
    public class TaiKhoanDAL
    {
        private const string PARM_TENDANGNHAP= "@TenDangNhap";
        private const string PARM_HOVATEN = "@HoVaTen";//ở đây khai báo các tên cột với @ ở trước
        private const string PARM_MATKHAU = "@MatKhau";
        private const string PARM_QUYENHAN ="@QuyenHan";
        private const string PARM_TRANGTHAI ="@TrangThai";
        private const string PARM_MOTA = "@MoTa";
        public int Them(TaiKhoan tk)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_TENDANGNHAP,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_HOVATEN,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MATKHAU,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_QUYENHAN,SqlDbType.Int),
                new SqlParameter(PARM_TRANGTHAI,SqlDbType.Bit),
                new SqlParameter(PARM_MOTA,SqlDbType.NVarChar,100)
                //khai báo thứ tự như trong cái store đó
                //(-thuộc tính thứ nhất lấy từ tên khai báo ở trên-tiếp theo là kiểu dữ liệu-tiếp nữa là độ dài kiểu dữ liệu)
                //nếu là kiểu dữ liệu k có độ dài thì mình bỏ cái thuộc tính thứ 3 ví dụ như new sqlparameter(PARM_....,SqlDbType.Int)
            };
            parm[0].Value = tk.TenDangNhap;
            parm[1].Value = tk.HoVaTen;
            parm[2].Value = tk.MatKhau;
            parm[3].Value = tk.QuyenHan;
            parm[4].Value = tk.TrangThai;
            parm[5].Value = tk.MoTa;
            //chỗ này thì phải truyền đúng theo thứ tự khai báo ở trên
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblTaiKhoan_Them", parm); //các thuộc tính của hàm này không thay đổi trong mọi hàm trừ tên store với có hàm lấy tất thì đổi cả tên và parm là null
        }
        //hàm sửa thì có thể coppy nguyên hàm tên và đổi tên store
        public int Sua(TaiKhoan tk)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_TENDANGNHAP,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_HOVATEN,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MATKHAU,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_QUYENHAN,SqlDbType.Int),
                new SqlParameter(PARM_TRANGTHAI,SqlDbType.Bit),
                new SqlParameter(PARM_MOTA,SqlDbType.NVarChar,100)
                //khai báo thứ tự như trong cái store đó
                //(-thuộc tính thứ nhất lấy từ tên khai báo ở trên-tiếp theo là kiểu dữ liệu-tiếp nữa là độ dài kiểu dữ liệu)
                //nếu là kiểu dữ liệu k có độ dài thì mình bỏ cái thuộc tính thứ 3 ví dụ như new sqlparameter(PARM_....,SqlDbType.Int)
            };
            parm[0].Value = tk.TenDangNhap;
            parm[1].Value = tk.HoVaTen;
            parm[2].Value = tk.MatKhau;
            parm[3].Value = tk.QuyenHan;
            parm[4].Value = tk.TrangThai;
            parm[5].Value = tk.MoTa; 
            //chỗ này thì phải truyền đúng theo thứ tự khai báo ở trên
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblTaiKhoan_Sua", parm);
        }
        /// <summary>
        /// Hàm xóa thì chỉ truyền vào  những khóa chính.ví dụ có 2 mã chính thì phải là Xoa(kiểu_dữ_liệu khóa_1,kiểu_dữ_liệu khóa_2, )
        /// </summary>
        /// <param name="Ma"></param>
        /// <returns></returns>
        public int Xoa(string Ten)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_TENDANGNHAP,SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ten;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblTaiKhoan_Xoa", parm);
        }
        public List<TaiKhoan> DSTaiKhoan()
        {
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblTaiKhoan_DS", null);//chỗ này để ý cuối là null
            List<TaiKhoan> mylist = new List<TaiKhoan>();
            while (d.Read())
            {
                TaiKhoan tk = new TaiKhoan();
                //chỗ này truyền thuộc tính phải đúng thứ tự như trong bảng sql
                tk.TenDangNhap = d[0].ToString();
                tk.HoVaTen = d[1].ToString();
                tk.MatKhau = d[2].ToString();
                tk.QuyenHan = Convert.ToByte(d[3].ToString());
                tk.TrangThai = bool.Parse(d[4].ToString());
                tk.MoTa = d[5].ToString();
                mylist.Add(tk);
            }
            d.Dispose();
            return mylist;
        }
        /// <summary>
        /// Chỗ này truyền vào tương tự hàm sửa.cũng theo khóa chính
        /// </summary>
        /// <param name="Ma"></param>
        /// <returns></returns>
        public TaiKhoan LayTaiKhoan(string Ten)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_TENDANGNHAP,SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ten;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblTaiKhoan_Lay1", parm);
            TaiKhoan tk = new TaiKhoan();
            if (d.Read())
            {
                tk.TenDangNhap = d[0].ToString();
                tk.HoVaTen = d[1].ToString();
                tk.MatKhau = d[2].ToString();
                tk.QuyenHan = Convert.ToByte(d[3].ToString());
                tk.TrangThai = bool.Parse(d[4].ToString());
                tk.MoTa = d[5].ToString();
            }
            return tk;
        }
    }
}
