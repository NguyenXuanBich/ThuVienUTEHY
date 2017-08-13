using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class CanBoDAL
    {
        private const string PARM_MACANBO = "@MaCanBo";
        private const string PARM_HOVATEN = "@HoVaTen";
        private const string PARM_QUEQUAN = "@QueQuan";
        private const string PARM_NGAYSINH = "@NgaySinh";
        private const string PARM_URLPHOTO = "@urlPhoTo";
        private const string PARM_MADONVI = "@MaDonVi";
        private const string PARM_GIOITINH = "@GioiTinh";
        private const string PARM_SODIENTHOAI = "@SoDienThoai";
        private const string PARM_DIACHIEMAIL = "@DiaChiEmail";
        private const string PARM_GHICHU = "@GhiChu";
        private const string PARM_MATKHAU = "@MatKhau";
        private const string PARM_TRANGTHAI = "@TrangThai";
        public int Them(CanBo cb)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MACANBO, SqlDbType.NVarChar, 30),
                new SqlParameter(PARM_HOVATEN, SqlDbType.NVarChar, 30),
                new SqlParameter(PARM_QUEQUAN, SqlDbType.NVarChar, 150),
                new SqlParameter(PARM_NGAYSINH, SqlDbType.Date),
                new SqlParameter(PARM_URLPHOTO, SqlDbType.NVarChar, 300),
                new SqlParameter(PARM_MADONVI, SqlDbType.NVarChar, 30),
                new SqlParameter(PARM_GIOITINH, SqlDbType.Bit),
                new SqlParameter(PARM_SODIENTHOAI, SqlDbType.NVarChar, 30),
                new SqlParameter(PARM_DIACHIEMAIL, SqlDbType.NVarChar, 30),
                new SqlParameter(PARM_GHICHU, SqlDbType.NVarChar, 100),
                new SqlParameter(PARM_MATKHAU, SqlDbType.NVarChar, 30),
                new SqlParameter(PARM_TRANGTHAI, SqlDbType.Bit)
            };
            parm[0].Value = cb.MaCanBo;
            parm[1].Value = cb.HoVaTen;
            parm[2].Value = cb.QueQuan;
            parm[3].Value = cb.NgaySinh;
            if (cb.UrlPhoto == "" || cb.UrlPhoto == null)
                parm[4].Value = DBNull.Value;
            else
                parm[4].Value = cb.UrlPhoto;
            parm[5].Value = cb.MaDonVi;
            parm[6].Value = cb.GioiTinh;
            parm[7].Value = cb.SoDienThoai;
            parm[8].Value = cb.DiaChiEMail;
            parm[9].Value = cb.GhiChu;
            parm[10].Value = cb.MatKhau;
            parm[11].Value = cb.TrangThai;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblCanBo_Them", parm);
        }
        public int Sua(CanBo cb)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MACANBO, SqlDbType.NVarChar, 30),
                new SqlParameter(PARM_HOVATEN, SqlDbType.NVarChar, 30),
                new SqlParameter(PARM_QUEQUAN, SqlDbType.NVarChar, 150),
                new SqlParameter(PARM_NGAYSINH, SqlDbType.Date),
                new SqlParameter(PARM_URLPHOTO, SqlDbType.NVarChar, 300),
                new SqlParameter(PARM_MADONVI, SqlDbType.NVarChar, 30),
                new SqlParameter(PARM_GIOITINH, SqlDbType.Bit),
                new SqlParameter(PARM_SODIENTHOAI, SqlDbType.NVarChar, 30),
                new SqlParameter(PARM_DIACHIEMAIL, SqlDbType.NVarChar, 30),
                new SqlParameter(PARM_GHICHU, SqlDbType.NVarChar, 100),
                new SqlParameter(PARM_MATKHAU, SqlDbType.NVarChar, 30),
                new SqlParameter(PARM_TRANGTHAI, SqlDbType.Bit)
            };
            parm[0].Value = cb.MaCanBo;
            parm[1].Value = cb.HoVaTen;
            parm[2].Value = cb.QueQuan;
            parm[3].Value = cb.NgaySinh;
            if (cb.UrlPhoto == "" || cb.UrlPhoto == null)
                parm[4].Value = DBNull.Value;
            else
                parm[4].Value = cb.UrlPhoto;
            parm[5].Value = cb.MaDonVi;
            parm[6].Value = cb.GioiTinh;
            parm[7].Value = cb.SoDienThoai;
            parm[8].Value = cb.DiaChiEMail;
            parm[9].Value = cb.GhiChu;
            parm[10].Value = cb.MatKhau;
            parm[11].Value = cb.TrangThai;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblCanBo_Sua", parm);
        }
        public int Xoa(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MACANBO, SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblCanBo_Xoa", parm);
        }
        public List<CanBo> DSCB()
        {
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblCanBo_DS", null);
            List<CanBo> mylist = new List<CanBo>();
            while (d.Read())
            {
                CanBo cb = new CanBo();
                cb.MaCanBo = d[0].ToString();
                cb.HoVaTen = d[1].ToString();
                cb.QueQuan = d[2].ToString();
                cb.NgaySinh = DateTime.Parse(d[3].ToString());
                cb.UrlPhoto = d[4].ToString();
                cb.MaDonVi = d[5].ToString();
                cb.GioiTinh = bool.Parse(d[6].ToString());
                cb.SoDienThoai = d[7].ToString();
                cb.DiaChiEMail = d[8].ToString();
                cb.GhiChu = d[9].ToString();
                cb.MatKhau = d[10].ToString();
                cb.TrangThai = bool.Parse(d[11].ToString());
                mylist.Add(cb);
            }
            d.Dispose();
            return mylist;
        }
        public CanBo LayCB(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MACANBO, SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblCanBo_Lay1", parm);
            CanBo cb = new CanBo();
            if (d.Read())
            {
                cb.MaCanBo = d[0].ToString();
                cb.HoVaTen = d[1].ToString();
                cb.QueQuan = d[2].ToString();
                cb.NgaySinh = DateTime.Parse(d[3].ToString());
                cb.UrlPhoto = d[4].ToString();
                cb.MaDonVi = d[5].ToString();
                cb.GioiTinh = bool.Parse(d[6].ToString());
                cb.SoDienThoai = d[7].ToString();
                cb.DiaChiEMail = d[8].ToString();
                cb.GhiChu = d[9].ToString();
                cb.MatKhau = d[10].ToString();
                cb.TrangThai = bool.Parse(d[11].ToString());
            }
            return cb;
        }
        public bool CheckMaCB(string id)
        {
            string cmd = "select count(*) from tblCanBo where MaCanBo=@MaCanBo";
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MACANBO,SqlDbType.NVarChar,30)
            };
            parm[0].Value = id;
            int kq = (int)DALHelper.ExecuteScalar(DALHelper.ConnectionString, CommandType.Text, cmd, parm);
            if (kq > 0) return false;
            else return true;
        }
        public CanBo Login(string Ma, string pass)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MACANBO,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MATKHAU,SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            parm[1].Value = pass;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblCB_Login", parm);
            CanBo tt = new CanBo();
            if (d.Read())
            {
                tt.MaCanBo = d[0].ToString();
                tt.HoVaTen = d[1].ToString();
                tt.UrlPhoto = d[2].ToString();
            }
            return tt;
        }
    }
}
