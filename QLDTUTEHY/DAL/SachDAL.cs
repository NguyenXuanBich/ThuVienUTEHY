using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    
    public class SachDAL
    {
        TacGiaDAL tgdal = new TacGiaDAL();
        LinhVucDAL lvdal = new LinhVucDAL();
        TheLoaiDAL tldal = new TheLoaiDAL();
        private const string PARM_MASACH = "@MaSach";
        private const string PARM_MAPHANLOAI = "@MaPhanLoai";
        private const string PARM_TENSACH = "@TenSach";
        private const string PARM_MANXB = "@MaNXB";
        private const string PARM_LANXUATBAN = "@LanXuatBan";
        private const string PARM_ISBN_ISSN = "@ISBN_ISSN";
        private const string PARM_SOTRANG = "@SoTrang";
        private const string PARM_TAP = "@Tap";
        private const string PARM_NAMXUATBAN = "@NamXuatBan";
        private const string PARM_NUOCXUATBAN = "@NuocXuatBan";
        private const string PARM_KICHTHUOC = "@KichThuoc";
        private const string PARM_URLANHBIA = "@UrlAnhBia";
        private const string PARM_DUONGDANBANSCAN = "@DuongDanBanScan";
        private const string PARM_GIABIA = "@GiaBia";
        private const string PARM_MANGONNGU = "@MaNgonNgu";
        private const string PARM_TOMTATNOIDUNG = "@TomTatNoiDung";
        private const string PARM_TUKHOA = "@TuKhoa";
        private const string PARM_SACHDICHHAYKHONG = "@SachDichHayKhong";
        private const string PARM_NGONNGUBANDAU = "@NgonNguBanDau";
        private const string PARM_TINHTRANG = "@TinhTrang";        
        private const string PARM_GHICHU = "@GhiChu";
        private const string PARM_TIMKIEM = "@Key";
        public int Them(Sach s)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MASACH, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MAPHANLOAI, SqlDbType.VarChar,15),
                new SqlParameter(PARM_TENSACH, SqlDbType.NVarChar,150),
                new SqlParameter(PARM_MANXB, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_LANXUATBAN, SqlDbType.SmallInt),
                new SqlParameter(PARM_ISBN_ISSN, SqlDbType.NVarChar,20),
                new SqlParameter(PARM_SOTRANG, SqlDbType.Int),
                new SqlParameter(PARM_TAP, SqlDbType.SmallInt),
                new SqlParameter(PARM_NAMXUATBAN, SqlDbType.Int),
                new SqlParameter(PARM_NUOCXUATBAN, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_KICHTHUOC, SqlDbType.NVarChar,200),
                new SqlParameter(PARM_URLANHBIA, SqlDbType.NVarChar,200),
                new SqlParameter(PARM_DUONGDANBANSCAN, SqlDbType.NVarChar,10),
                new SqlParameter(PARM_GIABIA, SqlDbType.Float),
                new SqlParameter(PARM_MANGONNGU, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TOMTATNOIDUNG, SqlDbType.NVarChar,-1),
                new SqlParameter(PARM_TUKHOA, SqlDbType.NVarChar,50),
                new SqlParameter(PARM_SACHDICHHAYKHONG, SqlDbType.Bit),
                new SqlParameter(PARM_NGONNGUBANDAU, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TINHTRANG, SqlDbType.Bit),              
                new SqlParameter(PARM_GHICHU, SqlDbType.NVarChar,-1)
            };
            parm[0].Value = s.MaSach;

            parm[1].Value = s.MaPhanLoai;
            parm[2].Value = s.TenSach;
            parm[3].Value = s.MaNXB;
            parm[4].Value = s.LanXuatBan;
            parm[5].Value = s.ISBN_ISSN;
            parm[6].Value = s.SoTrang;
            parm[7].Value = s.Tap;
            parm[8].Value = s.NamXuatBan;
            parm[9].Value = s.NuocXuatBan;
            parm[10].Value = s.KichThuoc;
            parm[11].Value = s.UrlAnhBia;
            if (s.UrlAnhBia == null)
                parm[11].Value = DBNull.Value;
            parm[12].Value = s.DuongDanBanScan;
            if (s.DuongDanBanScan == null)
                parm[12].Value = DBNull.Value;
            parm[13].Value = s.GiaBia;
            parm[14].Value = s.MaNgonNgu;
            parm[15].Value = s.TomTatNoiDung;
            parm[16].Value = s.TuKhoa;
            parm[17].Value = s.SachDichHayKhong;
            parm[18].Value = "";
            parm[19].Value = s.TinhTrang;
            parm[20].Value = s.GhiChu;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_Them", parm);
        }
        public int Sua(Sach s)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MASACH, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_MAPHANLOAI, SqlDbType.VarChar,15),
                new SqlParameter(PARM_TENSACH, SqlDbType.NVarChar,150),
                new SqlParameter(PARM_MANXB, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_LANXUATBAN, SqlDbType.SmallInt),
                new SqlParameter(PARM_ISBN_ISSN, SqlDbType.NVarChar,20),
                new SqlParameter(PARM_SOTRANG, SqlDbType.Int),
                new SqlParameter(PARM_TAP, SqlDbType.SmallInt),
                new SqlParameter(PARM_NAMXUATBAN, SqlDbType.Int),
                new SqlParameter(PARM_NUOCXUATBAN, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_KICHTHUOC, SqlDbType.NVarChar,200),
                new SqlParameter(PARM_URLANHBIA, SqlDbType.NVarChar,200),
                new SqlParameter(PARM_DUONGDANBANSCAN, SqlDbType.NVarChar,10),
                new SqlParameter(PARM_GIABIA, SqlDbType.Float),
                new SqlParameter(PARM_MANGONNGU, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TOMTATNOIDUNG, SqlDbType.NVarChar,-1),
                new SqlParameter(PARM_TUKHOA, SqlDbType.NVarChar,50),
                new SqlParameter(PARM_SACHDICHHAYKHONG, SqlDbType.Bit),
                new SqlParameter(PARM_NGONNGUBANDAU, SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TINHTRANG, SqlDbType.Bit),              
                new SqlParameter(PARM_GHICHU, SqlDbType.NVarChar,-1)
            };
            parm[0].Value = s.MaSach;
            
            parm[1].Value = s.MaPhanLoai;
            parm[2].Value = s.TenSach;
            parm[3].Value = s.MaNXB;
            parm[4].Value = s.LanXuatBan;
            parm[5].Value = s.ISBN_ISSN;
            parm[6].Value = s.SoTrang;
            parm[7].Value = s.Tap;
            parm[8].Value = s.NamXuatBan;
            parm[9].Value = s.NuocXuatBan;
            parm[10].Value = s.KichThuoc;            
            parm[11].Value = s.UrlAnhBia;
            if (s.UrlAnhBia == null)
                parm[11].Value = DBNull.Value;
            parm[12].Value = s.DuongDanBanScan;
            if (s.DuongDanBanScan == null)
                parm[12].Value = DBNull.Value;
            parm[13].Value = s.GiaBia;
            parm[14].Value = s.MaNgonNgu;
            parm[15].Value = s.TomTatNoiDung;
            parm[16].Value = s.TuKhoa;
            parm[17].Value = s.SachDichHayKhong;
            parm[18].Value = "";
            parm[19].Value = s.TinhTrang;
            parm[20].Value = s.GhiChu;          
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_Sua", parm);
        }
        public int Xoa(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MASACH, SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_Xoa", parm);
        }
        public List<Sach> DSSach()
        {
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_DS", null);
            List<Sach> mylist = new List<Sach>();
            while (d.Read())
            {
                Sach s = new Sach();
                s.MaSach = d[0].ToString();
                s.MaPhanLoai = d[1].ToString();
                s.TenSach = d[2].ToString();
                s.MaNXB = d[3].ToString();
                s.LanXuatBan = short.Parse(d[4].ToString());
                s.ISBN_ISSN = d[5].ToString();
                s.SoTrang = int.Parse(d[6].ToString());
                s.Tap = short.Parse(d[7].ToString());
                s.NamXuatBan = int.Parse(d[8].ToString());
                s.NuocXuatBan = d[9].ToString();
                s.KichThuoc = d[10].ToString();
                s.UrlAnhBia = d[11].ToString();
                s.DuongDanBanScan = d[12].ToString();
                s.GiaBia = float.Parse(d[13].ToString());
                s.MaNgonNgu = d[14].ToString();
                s.TomTatNoiDung = d[15].ToString();
                s.TuKhoa = d[16].ToString();
                s.SachDichHayKhong = bool.Parse(d[17].ToString());
                s.NgonNguBanDau = d[18].ToString();
                s.TinhTrang = d[19].ToString() == "1";             
                s.GhiChu = d[20].ToString();
                s.SoLuong = int.Parse(d[21].ToString());
                s.DSTacGia = tgdal.DSTacGia_Sach(s.MaSach);
                s.DSTheLoai = tldal.DSTL_Sach(s.MaSach);
                s.DSLinhVuc = lvdal.DSLV_Sach(s.MaSach);
                mylist.Add(s);
            }
            d.Dispose();
            return mylist;
        }
        public List<Sach> TimSach(String Ma)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_TIMKIEM, SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_Search", parm);
            List<Sach> mylist = new List<Sach>();
            while (d.Read())
            {
                Sach s = new Sach();
                s.MaSach = d[0].ToString();
                s.MaPhanLoai = d[1].ToString();
                s.TenSach = d[2].ToString();
                s.MaNXB = d[3].ToString();
                s.LanXuatBan = short.Parse(d[4].ToString());
                s.ISBN_ISSN = d[5].ToString();
                s.SoTrang = int.Parse(d[6].ToString());
                s.Tap = short.Parse(d[7].ToString());
                s.NamXuatBan = int.Parse(d[8].ToString());
                s.NuocXuatBan = d[9].ToString();
                s.KichThuoc = d[10].ToString();
                s.UrlAnhBia = d[11].ToString();
                s.DuongDanBanScan = d[12].ToString();
                s.GiaBia = float.Parse(d[13].ToString());
                s.MaNgonNgu = d[14].ToString();
                s.TomTatNoiDung = d[15].ToString();
                s.TuKhoa = d[16].ToString();
                s.SachDichHayKhong = bool.Parse(d[17].ToString());
                s.NgonNguBanDau = d[18].ToString();
                s.TinhTrang = d[19].ToString() == "1";
                s.GhiChu = d[20].ToString();
                s.SoLuong = int.Parse(d[21].ToString());
                s.DSTacGia = tgdal.DSTacGia_Sach(s.MaSach);
                s.DSTheLoai = tldal.DSTL_Sach(s.MaSach);
                s.DSLinhVuc = lvdal.DSLV_Sach(s.MaSach);
                mylist.Add(s);
            }
            d.Dispose();
            return mylist;
        }
        public Sach LaySach(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(PARM_MASACH, SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblSach_Lay1", parm);
            Sach s = new Sach();
            if(d.Read())
            {
                s.MaSach = d[0].ToString();
                s.MaPhanLoai = d[1].ToString();
                s.TenSach = d[2].ToString();
                s.MaNXB = d[3].ToString();
                s.LanXuatBan = short.Parse(d[4].ToString());
                s.ISBN_ISSN = d[5].ToString();
                s.SoTrang = int.Parse(d[6].ToString());
                s.Tap = short.Parse(d[7].ToString());
                s.NamXuatBan = int.Parse(d[8].ToString());
                s.NuocXuatBan = d[9].ToString();
                s.KichThuoc = d[10].ToString();
                s.UrlAnhBia = d[11].ToString();
                s.DuongDanBanScan = d[12].ToString();
                s.GiaBia = float.Parse(d[13].ToString());
                s.MaNgonNgu = d[14].ToString();
                s.TomTatNoiDung = d[15].ToString();
                s.TuKhoa = d[16].ToString();
                s.SachDichHayKhong = bool.Parse(d[17].ToString());
                s.NgonNguBanDau = d[18].ToString();
                s.TinhTrang = d[19].ToString() == "1";              
                s.GhiChu = d[20].ToString();
                s.SoLuong = int.Parse(d[21].ToString());
                s.DSTacGia = tgdal.DSTacGia_Sach(s.MaSach);
                s.DSTheLoai = tldal.DSTL_Sach(s.MaSach);
                s.DSLinhVuc = lvdal.DSLV_Sach(s.MaSach);
            }
            return s;
        }
    }
}
