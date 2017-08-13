using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entities;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using BLL;
using System.IO;

namespace QLDTUTEHY
{
    public partial class QLSach : System.Web.UI.Page
    {
        private string FilePath = "";
        private void SetFilePath()
        {
            FilePath = MapPath("~/image/");
            if (!Directory.Exists(FilePath))
            {
                Directory.CreateDirectory(FilePath);
            }
        }
        protected string Up(FileUpload file)
        {
            string fileName = null;
            string fileExtension = null;
            string strDate = Tool.SinhMa();
            SetFilePath();
            fileExtension = Path.GetExtension(file.FileName).Replace(".", "");
            fileName = file.FileName.Substring(file.FileName.LastIndexOf("\\") + 1);
            fileName = strDate + "." + fileExtension;
            FilePath = FilePath + fileName;
            file.SaveAs(FilePath);
            return fileName;
        }
        SachBLL sbll = new SachBLL();
        TacGiaBLL tgbll = new TacGiaBLL();
        NhaXuatBanBLL nxbbll = new NhaXuatBanBLL();
        NgonNguBLL ngvbll = new NgonNguBLL();
        TheLoaiBLL tlbll = new TheLoaiBLL();
        LinhVucBLL lvbll = new LinhVucBLL();
        Sach_LinhVucBLL slvbll = new Sach_LinhVucBLL();
        Sach_TacGiaBLL stgbll = new Sach_TacGiaBLL();
        Sach_TheLoaiBLL stlbll = new Sach_TheLoaiBLL();
        Sach_CaBietBLL scbbll = new Sach_CaBietBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            LoadDB();
        }

        private void LoadDB()
        {
            List<LinhVuc> listlv = lvbll.DSLV();
            LinhVuc.DataSource = listlv;
            LinhVuc.DataTextField = "TenLinhVuc";
            LinhVuc.DataValueField = "MaLinhVuc";
            LinhVuc.DataBind();
            List<TheLoai> listtl = tlbll.DSTL();
            TheLoai.DataSource = listtl;
            TheLoai.DataTextField = "TenTheLoai";
            TheLoai.DataValueField = "MaTheLoai";
            TheLoai.DataBind();
            List<NgonNgu> listnn = ngvbll.DSNgonNgu();
            NgonNgu.DataSource = listnn;
            NgonNgu.DataTextField = "TenNgonNgu";
            NgonNgu.DataValueField = "MaNgonNgu";
            NgonNgu.DataBind();
            List<TacGia> listtg = tgbll.DSTacGia();
            tacgia.DataTextField = "HoTenTacGia";
            tacgia.DataValueField = "MaTacGia";
            tacgia.DataSource = listtg;
            tacgia.DataBind();
            List<NhaXuatBan> listnxb = nxbbll.DSNXB();
            NhaXB.DataSource = listnxb;
            NhaXB.DataTextField = "TenNXB";
            NhaXB.DataValueField = "MaNXB";
            NhaXB.DataBind();
            List<Sach> mylist = sbll.DSSach();
            grvSach.DataSource = mylist;
            grvSach.DataBind();
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Sach s = new Sach();
            if (hdId.Value != null || hdId.Value != "")
                s = sbll.LaySach(hdId.Value);
            s.TenSach = Ten.Text;
            s.Tap = short.Parse(Tap.Text);
            s.MaNXB = NhaXB.SelectedValue;
            s.MaPhanLoai = MsPhanLoai.Text;
            s.MaNgonNgu = NgonNgu.SelectedValue;
            s.NuocXuatBan = NuocXuatBan.Text;
            s.ISBN_ISSN = MaVach.Text;
            s.LanXuatBan = short.Parse(LanXuatBan.Text);
            s.SoTrang = short.Parse(SoTrang.Text);
            s.GiaBia = float.Parse(GiaBia.Text);
            s.KichThuoc = KichThuoc.Text;
            s.TuKhoa = TuKhoa.Text;
            s.SachDichHayKhong = CoDich.Checked;
            s.TomTatNoiDung = NoiDung.Text;
            if (Anh.HasFile)
            {
                s.UrlAnhBia = Up(Anh);
            }
            if (Scan.HasFile)
            {
                s.DuongDanBanScan = Up(Scan);
            }
            s.GhiChu = GhiChu.Text;
            if (hdId.Value == null || hdId.Value == "")
            {
                s.MaSach = Tool.SinhMa();
                sbll.Them(s);
                string[] dstg = txtDSTG.Text.Split(',');
                foreach (string tg in dstg)
                {
                    stgbll.Them(new Sach_TacGia(s.MaSach, tg));
                }
                string[] dslv = txtDSLV.Text.Split(',');
                foreach (string lv in dslv)
                {
                    slvbll.Them(new Sach_LinhVuc(s.MaSach, lv));
                }
                string[] dstl = txtDSTL.Text.Split(',');
                foreach (string tl in dstl)
                {
                    stlbll.Them(new Sach_TheLoai(s.MaSach, tl));
                }
                int sl = int.Parse(SoLuong.Text);
                scbbll.ThemDSSachCB(s.MaSach, sl);
            }
            else
            {
                sbll.Sua(s);
                stgbll.Xoa(s.MaSach);
                stlbll.Xoa(s.MaSach);
                slvbll.Xoa(s.MaSach);
                string[] dstg = txtDSTG.Text.Split(',');
                foreach (string tg in dstg)
                {
                    stgbll.Them(new Sach_TacGia(s.MaSach, tg));
                }
                string[] dslv = txtDSLV.Text.Split(',');             
                foreach (string lv in dslv)
                {                  
                    slvbll.Them(new Sach_LinhVuc(s.MaSach, lv));
                }
                string[] dstl = txtDSTL.Text.Split(',');
                foreach (string tl in dstl)
                {
                    stlbll.Them(new Sach_TheLoai(s.MaSach, tl));
                }

            }
            EditState.Value = "hide";
        }



        protected void grvSach_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvSach.PageIndex = e.NewPageIndex;
            LoadDB();
        }

        protected void grvSach_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow gvr;
            try
            {
                gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            }
            catch { return; }
            int index = gvr.RowIndex;

            if (e.CommandName == "Sua")
            {

                hdId.Value = grvSach.DataKeys[index].Value.ToString();
                Sach s = sbll.LaySach(hdId.Value);
                Ten.Text = s.TenSach;
                NhaXB.Text = s.MaNXB;
                MsPhanLoai.Text = s.MaPhanLoai;
                Tap.Text = s.Tap.ToString();
                NgonNgu.SelectedValue = s.MaNgonNgu;
                NamXuatBan.Text = s.NamXuatBan.ToString();
                NuocXuatBan.Text = s.NuocXuatBan;
                foreach (ListItem t in tacgia.Items)
                {
                    bool check = false;
                    foreach (TacGia tg in s.DSTacGia)
                        if (tg.MaTacGia == t.Value)
                        {
                            check = true;
                            break;
                        } t.Selected = check;
                }
                foreach (ListItem t in LinhVuc.Items)
                {
                    bool check = false;
                    foreach (Entities.LinhVuc lv in s.DSLinhVuc)
                        if (lv.MaLinhVuc == t.Value)
                        {
                            check = true;
                            break;
                        } t.Selected = check;
                }             
                foreach (ListItem t in TheLoai.Items)
                {
                    bool check = false;
                    foreach (Entities.TheLoai tl in s.DSTheLoai)
                        if (tl.MaTheLoai == t.Value)
                        {
                            check = true;
                            break;
                        }
                    t.Selected = check;
                }
                MaVach.Text = s.ISBN_ISSN;
                LanXuatBan.Text = s.LanXuatBan.ToString();
                SoTrang.Text = s.SoTrang.ToString();
                GiaBia.Text = s.GiaBia.ToString();
                KichThuoc.Text = s.KichThuoc;
                NoiDung.Text = s.TomTatNoiDung;
                if (s.SachDichHayKhong) CoDich.Checked = true;
                else KhongDich.Checked = true;
                TuKhoa.Text = s.TuKhoa;
                GhiChu.Text = s.SachDichHayKhong.ToString();
                SoLuong.Text = s.SoLuong.ToString();
                SoLuong.Enabled = false;
                EditState.Value = "show";
            }
            else if (e.CommandName == "Xoa")
            {
                idDelete.Value = grvSach.DataKeys[index].Value.ToString();
                DeleteState.Value = "delete";
            }
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            string id = idDelete.Value;
            sbll.Xoa(id);
            DeleteState.Value = "hide";
            LoadDB();
        }

    }
}