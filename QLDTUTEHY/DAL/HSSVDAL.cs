using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;
using System.Data.SqlClient;
using System.Data;
namespace DAL
{
   public class HSSVDAL
    {
        private const string PARM_MAHSSV = "@MaHSSV";
        private const string PARM_HOTEN = "@HoTen";
        private const string PARM_MALOP = "@MaLop";
        private const string PARM_GIOITINH = "@GioiTinh";
        private const string PARM_NGAYSINH = "@NgaySinh";
        private const string PARM_NOISINH = "@NoiSinh";
        private const string PARM_QUEQUAN = "@QueQuan";
        private const string PARM_NOIOHIENNAY = "@NoiOHienNay";
        private const string PARM_DIENTHOAI = "@DienThoai";
        private const string PARM_EMAIL = "@Email";
        private const string PARM_URLPHOTO = "@urlPhoto";
        private const string PARM_GHICHU = "@GhiChu";
        private const string PARM_MATKHAU = "@MatKhau";
        private const string PARM_TRANGTHAI = "@TrangThai";
        public int Them(HSSV hs)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MAHSSV,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_HOTEN,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MALOP,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_GIOITINH ,SqlDbType.Bit),
                new SqlParameter(PARM_NGAYSINH,SqlDbType.Date),
                new SqlParameter(PARM_NOISINH,SqlDbType.NVarChar,100),
                new SqlParameter(PARM_QUEQUAN,SqlDbType.NVarChar,100),
                new SqlParameter(PARM_NOIOHIENNAY,SqlDbType.NVarChar,100),
                new SqlParameter(PARM_DIENTHOAI,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_EMAIL,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_URLPHOTO ,SqlDbType.NVarChar,150),
                new SqlParameter(PARM_GHICHU,SqlDbType.NVarChar,1000),
                new SqlParameter(PARM_MATKHAU,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TRANGTHAI,SqlDbType.Bit)
                
            };
            parm[0].Value = hs.MaHSSV;
            parm[1].Value = hs.HoTen;
            parm[2].Value = hs.MaLop;
            parm[3].Value = hs.GioiTinh;
            parm[4].Value = hs.NgaySinh;
            parm[5].Value = hs.NoiSinh;
            parm[6].Value = hs.QueQuan;
            parm[7].Value = hs.NoiOHienNay;
            parm[8].Value = hs.DienThoai;
            parm[9].Value = hs.EMail;
            if (hs.UrlPhoto == "" || hs.UrlPhoto == null)
                parm[10].Value = DBNull.Value;
            else
                parm[10].Value = hs.UrlPhoto;
            parm[11].Value = hs.GhiChu;
            parm[12].Value = hs.MatKhau;
            parm[13].Value = hs.TrangThai;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblHSSV_Them", parm); 
        }
        public int Sua(HSSV hs)
        {
            SqlParameter[] parm = new SqlParameter[]{
              new SqlParameter(PARM_MAHSSV,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_HOTEN,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MALOP,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_GIOITINH ,SqlDbType.Bit),
                new SqlParameter(PARM_NGAYSINH,SqlDbType.Date),
                new SqlParameter(PARM_NOISINH,SqlDbType.NVarChar,100),
                new SqlParameter(PARM_QUEQUAN,SqlDbType.NVarChar,100),
                new SqlParameter(PARM_NOIOHIENNAY,SqlDbType.NVarChar,100),
                new SqlParameter(PARM_DIENTHOAI,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_EMAIL,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_URLPHOTO ,SqlDbType.NVarChar,150),
                new SqlParameter(PARM_GHICHU,SqlDbType.NVarChar,1000),
                new SqlParameter(PARM_MATKHAU,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TRANGTHAI,SqlDbType.Bit)
            };
            parm[0].Value = hs.MaHSSV;
            parm[1].Value = hs.HoTen;
            parm[2].Value = hs.MaLop;
            parm[3].Value = hs.GioiTinh;
            parm[4].Value = hs.NgaySinh;
            parm[5].Value = hs.NoiSinh;
            parm[6].Value = hs.QueQuan;
            parm[7].Value = hs.NoiOHienNay;
            parm[8].Value = hs.DienThoai;
            parm[9].Value = hs.EMail;
            if (hs.UrlPhoto == "" || hs.UrlPhoto == null)
                parm[10].Value = DBNull.Value;
            else
                parm[10].Value = hs.UrlPhoto;
            if (hs.GhiChu == "" || hs.GhiChu == null)
                parm[11].Value = DBNull.Value;
            else
            parm[11].Value = hs.GhiChu;
            parm[12].Value = hs.MatKhau;
            parm[13].Value = hs.TrangThai;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblHSSV_Sua", parm);
        }
        /// <summary>
        /// Hàm xóa thì chỉ truyền vào  những khóa chính.ví dụ có 2 mã chính thì phải là Xoa(kiểu_dữ_liệu khóa_1,kiểu_dữ_liệu khóa_2, )
        /// </summary>
        /// <param name="Ma"></param>
        /// <returns></returns>
        public int Xoa(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MAHSSV,SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblHSSV_Xoa", parm);
        }
        public List<HSSV> DSHSSV()
        {
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblHSSV_DS", null);//chỗ này để ý cuối là null
            List<HSSV> mylist = new List<HSSV>();
            while (d.Read())
            {
                HSSV hs = new HSSV();
                hs.MaHSSV = d[0].ToString();
                hs.HoTen = d[1].ToString();
                hs.MaLop = d[2].ToString();
                hs.GioiTinh =bool.Parse(d[3].ToString());
                hs.NgaySinh =DateTime.Parse( d[4].ToString());
                hs.NoiSinh = d[5].ToString();
                hs.QueQuan = d[6].ToString();
                hs.NoiOHienNay = d[7].ToString();
                hs.DienThoai = d[8].ToString();
                hs.EMail = d[9].ToString();
                hs.UrlPhoto = d[10].ToString();
                hs.GhiChu= d[11].ToString();
                hs.MatKhau = d[12].ToString();
                hs.TrangThai =bool.Parse( d[13].ToString());
                mylist.Add(hs);
            }
            d.Dispose();
            return mylist;
        }
        /// <summary>
        /// Chỗ này truyền vào tương tự hàm sửa.cũng theo khóa chính
        /// </summary>
        /// <param name="Ma"></param>
        /// <returns></returns>
        public HSSV LayHSSV(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MAHSSV,SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblHSSV_Lay1", parm);
            HSSV hs = new HSSV();
            if (d.Read())
            {
                hs.MaHSSV = d[0].ToString();
                hs.HoTen = d[1].ToString();
                hs.MaLop = d[2].ToString();
                hs.GioiTinh = bool.Parse(d[3].ToString());
                hs.NgaySinh = DateTime.Parse(d[4].ToString());
                hs.NoiSinh = d[5].ToString();
                hs.QueQuan = d[6].ToString();
                hs.NoiOHienNay = d[7].ToString();
                hs.DienThoai = d[8].ToString();
                hs.EMail = d[9].ToString();
                hs.UrlPhoto = d[10].ToString();
                hs.GhiChu = d[11].ToString();
                hs.MatKhau = d[12].ToString();
                hs.TrangThai = bool.Parse(d[13].ToString());
            }
            return hs;
        }
        public bool CheckID(string id)
        {
            string cmd = "select count(*) from tblHSSV where MaHSSV=@MaHSSV";
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MAHSSV,SqlDbType.NVarChar,30)
            };
            parm[0].Value = id;
            int kq = (int)DALHelper.ExecuteScalar(DALHelper.ConnectionString, CommandType.Text, cmd, parm);
            if (kq > 0) return false;
            else return true;
        }
        public HSSV Login(string Ma, string pass)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MAHSSV,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MATKHAU,SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            parm[1].Value = pass;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblHSSV_Login", parm);
            HSSV tt = new HSSV();
            if (d.Read())
            {
                tt.MaHSSV = d[0].ToString();
                tt.HoTen = d[1].ToString();
                tt.UrlPhoto = d[2].ToString();
            }
            return tt;
        }
    }
}