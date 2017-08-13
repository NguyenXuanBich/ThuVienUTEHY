using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Entities;

namespace DAL
{
    public class ThuThuDAL
    {
        private const string PARM_MATHUTHU = "@MaThuThu";
        private const string PARM_HOTEN = "@HoTen";//ở đây khai báo các tên cột với @ ở trước
        private const string PARM_MATKHAU = "@MatKhau";
        private const string PARM_DIACHIEMAIL = "@DiaChiEmail";
        private const string PARM_DIENTHOAI = "@DienThoai";
        private const string PARM_TRANGTHAI = "@TrangThai";
        private const string PARM_URLPHOTO = "@urlPhoto";
        private const string PARM_GHICHU = "@GhiChu";
        public int Them(ThuThu tt)
        {
            SqlParameter[] parm = new SqlParameter[]{
                 new SqlParameter(PARM_MATHUTHU,SqlDbType.NVarChar,30),
                 new SqlParameter(PARM_HOTEN,SqlDbType.NVarChar,30),
                 new SqlParameter(PARM_MATKHAU,SqlDbType.NVarChar,30),
                
                 new SqlParameter(PARM_DIACHIEMAIL,SqlDbType.NVarChar,30),
                 new SqlParameter(PARM_DIENTHOAI,SqlDbType.NVarChar,30),
                 new SqlParameter(PARM_TRANGTHAI,SqlDbType.Bit),
                 new SqlParameter(PARM_URLPHOTO,SqlDbType.NVarChar,150),
                 new SqlParameter(PARM_GHICHU,SqlDbType.NVarChar,50)
                //khai báo thứ tự như trong cái store đó
                //(-thuộc tính thứ nhất lấy từ tên khai báo ở trên-tiếp theo là kiểu dữ liệu-tiếp nữa là độ dài kiểu dữ liệu)
                //nếu là kiểu dữ liệu k có độ dài thì mình bỏ cái thuộc tính thứ 3 ví dụ như new sqlparameter(PARM_....,SqlDbType.Int)
            };
            parm[0].Value = tt.MaThuThu;
            parm[1].Value = tt.HoTen;
            parm[2].Value = tt.MatKhau;
            parm[3].Value = tt.DiaChiEmail;
            parm[4].Value = tt.DienThoai;
            parm[5].Value = tt.TrangThai;
            if (tt.UrlPhoto == "" || tt.UrlPhoto == null)
                parm[6].Value = DBNull.Value;
            else
                parm[6].Value = tt.UrlPhoto;
            parm[7].Value = tt.GhiChu;
            //chỗ này thì phải truyền đúng theo thứ tự khai báo ở trên
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblThuThu_Them", parm); //các thuộc tính của hàm này không thay đổi trong mọi hàm trừ tên store với có hàm lấy tất thì đổi cả tên và parm là null
        }
        //hàm sửa thì có thể coppy nguyên hàm thêm và đổi tên store
        public int Sua(ThuThu tt)
        {
            SqlParameter[] parm = new SqlParameter[]{
                 new SqlParameter(PARM_MATHUTHU,SqlDbType.NVarChar,30),
                 new SqlParameter(PARM_HOTEN,SqlDbType.NVarChar,30),
                 new SqlParameter(PARM_MATKHAU,SqlDbType.NVarChar,30),             
                 new SqlParameter(PARM_DIACHIEMAIL,SqlDbType.NVarChar,30),
                 new SqlParameter(PARM_DIENTHOAI,SqlDbType.NVarChar,30),
                 new SqlParameter(PARM_TRANGTHAI,SqlDbType.Bit),
                 new SqlParameter(PARM_URLPHOTO,SqlDbType.NVarChar,150),
                 new SqlParameter(PARM_GHICHU,SqlDbType.NVarChar,50)
                //khai báo thứ tự như trong cái store đó
                //(-thuộc tính thứ nhất lấy từ tên khai báo ở trên-tiếp theo là kiểu dữ liệu-tiếp nữa là độ dài kiểu dữ liệu)
                //nếu là kiểu dữ liệu k có độ dài thì mình bỏ cái thuộc tính thứ 3 ví dụ như new sqlparameter(PARM_....,SqlDbType.Int)
            };
            parm[0].Value = tt.MaThuThu;
            parm[1].Value = tt.HoTen;
            parm[2].Value = tt.MatKhau;
            parm[3].Value = tt.DiaChiEmail;
            parm[4].Value = tt.DienThoai;
            parm[5].Value = tt.TrangThai;
            if (tt.UrlPhoto == "" || tt.UrlPhoto == null)
                parm[6].Value = DBNull.Value;
            else
                parm[6].Value = tt.UrlPhoto;
            parm[7].Value = tt.GhiChu;
            //chỗ này thì phải truyền đúng theo thứ tự khai báo ở trên
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblThuThu_Sua", parm);
        }
        /// <summary>
        /// Hàm xóa thì chỉ truyền vào  những khóa chính.ví dụ có 2 mã chính thì phải là Xoa(kiểu_dữ_liệu khóa_1,kiểu_dữ_liệu khóa_2, )
        /// </summary>
        /// <param name="Ma"></param>
        /// <returns></returns>
        public int Xoa(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MATHUTHU,SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblThuThu_Xoa", parm);
        }
        public List<ThuThu> DSThuThu()
        {
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblThuThu_DS", null);//chỗ này để ý cuối là null
            List<ThuThu> mylist = new List<ThuThu>();
            while (d.Read())
            {
                ThuThu tt = new ThuThu();
                //chỗ này truyền thuộc tính phải đúng thứ tự như trong bảng sql
                tt.MaThuThu = d[0].ToString();
                tt.HoTen = d[1].ToString();
                tt.MatKhau = d[2].ToString();
                tt.DiaChiEmail = d[3].ToString();
                tt.DienThoai = d[4].ToString();
                tt.TrangThai = bool.Parse(d[5].ToString());
                tt.UrlPhoto = d[6].ToString();
                tt.GhiChu = d[7].ToString();
                mylist.Add(tt);
            }
            d.Dispose();
            return mylist;
        }
        /// <summary>
        /// Chỗ này truyền vào tương tự hàm sửa.cũng theo khóa chính
        /// </summary>
        /// <param name="Ma"></param>
        /// <returns></returns>
        public ThuThu LayThuThu(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MATHUTHU,SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblThuThu_Lay1", parm);
            ThuThu tt = new ThuThu();
            if (d.Read())
            {
                tt.MaThuThu = d[0].ToString();
                tt.HoTen = d[1].ToString();
                tt.MatKhau = d[2].ToString();
                tt.DiaChiEmail = d[3].ToString();
                tt.DienThoai = d[4].ToString();
                tt.TrangThai = bool.Parse(d[5].ToString());
                tt.UrlPhoto = d[6].ToString();
                tt.GhiChu = d[7].ToString();
            }
            return tt;
        }
        public ThuThu Login(string Ma,string pass)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MATHUTHU,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MATKHAU,SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            parm[1].Value = pass;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblThuThu_Login", parm);
            ThuThu tt = new ThuThu();
            if (d.Read())
            {
                tt.MaThuThu = d[0].ToString();
                tt.HoTen = d[1].ToString();            
                tt.UrlPhoto = d[2].ToString();
            }
            return tt;
        }
        public bool CheckID(string id)
        {
            string cmd = "select count(*) from tblThuThu where MaThuThu=@MaThuThu";
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MATHUTHU,SqlDbType.NVarChar,30)
            };
            parm[0].Value = id;
            int kq = (int)DALHelper.ExecuteScalar(DALHelper.ConnectionString, CommandType.Text, cmd, parm);
            if (kq > 0) return false;
            else return true;
        }
    }
}
