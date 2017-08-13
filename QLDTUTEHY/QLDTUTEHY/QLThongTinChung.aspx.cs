using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entities;
using BLL;
using System.IO;

namespace QLDTUTEHY
{
    public partial class QLThongTinChung : System.Web.UI.Page
    {
        TacGiaBLL tgbll = new TacGiaBLL();
        NgonNguBLL ngbll = new NgonNguBLL();
        TheLoaiBLL tlbll = new TheLoaiBLL();
        LinhVucBLL lvbll = new LinhVucBLL();
        NhaXuatBanBLL nxbbll = new NhaXuatBanBLL();
        private string FilePath = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            LoadTG();
            LoadNXB();
            LoadLV();
            LoadTL();
            LoadNN();
         
            
        }

        private void LoadLV()
        {
            List<LinhVuc> tt = lvbll.DSLV();
            grvLinhVuc.DataSource = tt;
            grvLinhVuc.DataBind();
        }

        private void LoadNXB()
        {
            List<NhaXuatBan> hh = nxbbll.DSNXB();
            grvNXB.DataSource = hh;
            grvNXB.DataBind();
        }

        private void LoadTL()
        {
            List<TheLoai> tl = tlbll.DSTL();
            grvTheLoai.DataSource = tl;
            grvTheLoai.DataBind();
        }

        private void LoadNN()
        {
            List<NgonNgu> t4 = ngbll.DSNgonNgu();

            grvNgonNgu.DataSource = t4;
            grvNgonNgu.DataBind();
        }

        private void LoadTG()
        {
            List<TacGia> t = tgbll.DSTacGia();
            grvTacGia.DataSource = t;
            grvTacGia.DataBind();
        }
      
        protected void grvTacGia_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            grvTacGia.PageIndex = e.NewPageIndex;
            LoadTG();
        }
        protected void grvNgonNgu_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvNgonNgu.PageIndex = e.NewPageIndex;
            LoadNN();
        }
        protected void grvTheLoai_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvTheLoai.PageIndex = e.NewPageIndex;
            LoadTL();
        }
        protected void grvLinhVuc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvLinhVuc.PageIndex = e.NewPageIndex;
            LoadLV();
        }
        protected void grvNXB_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvNXB.PageIndex = e.NewPageIndex;
            LoadNXB();
        }
        protected void grvTacGiaa_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "Page")
            {
                GridViewRow gvr;
                gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int index = gvr.RowIndex;
                if (e.CommandName == "Sua")
                {
                    GridViewRow gvrow = grvTacGia.Rows[index];
                    typemodal.Value = "TG";
                    editType.Value = "edit"; //đoạn này
                    hdId.Value = grvTacGia.DataKeys[index].Value.ToString();
                    TacGia tg = tgbll.LayTacGia(hdId.Value);
                    txtTen.Text = tg.HoTenTacGia;
                    txtMoTa.Text = tg.MoTa;
                 
                }
                else
                    if (e.CommandName == "Xoa")
                    {
                        GridViewRow gvrow = grvTacGia.Rows[index];
                        string id = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
                        editType.Value = "edit";
                        idDelete.Value = id;
                        Delete.Value = "TG";
                        LoadTG();
                        tgbll.Xoa(id);
                        typemodal.Value = "hide";
                        LoadTG();
                       
                       
                    }
            }
        }
        protected void grvTheLoai_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "Page")
            {
                GridViewRow gvr;
                gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int index = gvr.RowIndex;
                if (e.CommandName == "Sua")
                {
                    GridViewRow gvrow = grvTheLoai.Rows[index];
                    typemodal.Value = "TL";
                    editType.Value = "edit"; 
                    hdId.Value = grvTheLoai.DataKeys[index].Value.ToString();
                    TheLoai tl = tlbll.LayTL(hdId.Value);
                    txtTen.Text = tl.TenTheLoai;
                    txtMoTa.Text = tl.MoTa;
                }
                else
                    if (e.CommandName == "Xoa")
                    {
                        GridViewRow gvrow = grvTheLoai.Rows[index];
                        string id = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
                        editType.Value = "edit";
                        idDelete.Value = id;
                       Delete.Value = "TL";
                       tlbll.Xoa(id);
                       typemodal.Value = "hide";
                       LoadTL();

                    }
            }
        }
        protected void grvNgonNgu_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "Page")
            {
                GridViewRow gvr;
                gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int index = gvr.RowIndex;
                if (e.CommandName == "Sua")
                {
                    GridViewRow gvrow = grvNgonNgu.Rows[index];
                    typemodal.Value = "NN";
                    editType.Value = "edit"; //đoạn này
                    hdId.Value = grvNgonNgu.DataKeys[index].Value.ToString();
                    NgonNgu nn = ngbll.LayNgonNgu(hdId.Value);
                    txtTen.Text = nn.TenNgonNgu;
                    
                }
                else
                    if (e.CommandName == "Xoa")
                    {
                        GridViewRow gvrow = grvNgonNgu.Rows[index];
                        string id = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
                        editType.Value = "edit";
                        idDelete.Value = id;
                        Delete.Value = "NN";
                        ngbll.Xoa(id);
                        typemodal.Value = "hide";
                        LoadNN();

                    }
            }
        }

        protected void grvNXB_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "Page")
            {
                GridViewRow gvr;
                gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int index = gvr.RowIndex;
                if (e.CommandName == "Sua")
                {
                    GridViewRow gvrow = grvNXB.Rows[index];
                    typemodal.Value = "NXB";
                    editType.Value = "edit"; //đoạn này
                    hdId.Value = grvNXB.DataKeys[index].Value.ToString();
                    NhaXuatBan nxb = nxbbll.LayNXB(hdId.Value);
                    txtTen.Text = nxb.TenNXB;
                    txtGhichu.Text = nxb.GhiChu;
                }
                else
                    if (e.CommandName == "Xoa")
                    {
                        GridViewRow gvrow = grvNXB.Rows[index];
                        string id = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
                        editType.Value = "edit";
                        idDelete.Value = id;
                        Delete.Value = "NXB";
                        nxbbll.Xoa(id);
                        typemodal.Value = "hide";
                        LoadNXB();

                    }
            }
        }
        protected void grvLinhVuc_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "Page")
            {
                GridViewRow gvr;
                gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int index = gvr.RowIndex;
                if (e.CommandName == "Sua")
                {
                    GridViewRow gvrow = grvLinhVuc.Rows[index];
                    typemodal.Value = "LV";
                    editType.Value = "edit"; //đoạn này
                    hdId.Value = grvLinhVuc.DataKeys[index].Value.ToString();
                    LinhVuc lv = lvbll.LayLV(hdId.Value);
                    txtTen.Text = lv.TenLinhVuc;
                    txtGhichu.Text = lv.GhiChu;
                }
                else
                    if (e.CommandName == "Xoa")
                    {
                        GridViewRow gvrow = grvLinhVuc.Rows[index];
                        string id = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
                        editType.Value = "edit";
                        idDelete.Value = id;
                        Delete.Value = "LV";
                        lvbll.Xoa(id);
                        typemodal.Value = "hide";
                        LoadLV();

                    }
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
             
            if (typemodal.Value == "TG")
            {
                TacGia tg = new TacGia();
                tg.HoTenTacGia = txtTen.Text;
                tg.MoTa = txtMoTa.Text;
                if (editType.Value == "add")
                {
                    tg.MaTacGia = Tool.SinhMa();         
                    int t = tgbll.Them(tg);
                    LoadTG();
                    typemodal.Value = "hide";
                }
                else
                {
                    tg.MaTacGia = hdId.Value;
                    tgbll.Sua(tg);
                    LoadTG();
                    typemodal.Value = "hide";
                }
        }
            if (typemodal.Value == "TL")
            {
                TheLoai tl = new TheLoai();
                tl.TenTheLoai = txtTen.Text;
                tl.MoTa = txtMoTa.Text;
                if (editType.Value == "add")
                {
                    tl.MaTheLoai = Tool.SinhMa();
                    int t = tlbll.Them(tl);
                    LoadTL();
                    typemodal.Value = "hide";
                }
                else
                {
                    tl.MaTheLoai = hdId.Value;
                    tlbll.Sua(tl);
                    LoadTL();
                    typemodal.Value = "hide";
                }
            }
            if (typemodal.Value == "LV")
            {
                LinhVuc lv = new LinhVuc();
                lv.TenLinhVuc = txtTen.Text;
                lv.GhiChu = txtGhichu.Text;
                if (editType.Value == "add")
                {
                    lv.MaLinhVuc = Tool.SinhMa();
                    int t = lvbll.Them(lv);
                    LoadLV();
                    typemodal.Value = "hide";
                }
                else
                {
                    lv.MaLinhVuc = hdId.Value;
                    lvbll.Sua(lv);
                    LoadLV();
                    typemodal.Value = "hide";
                }
            }
            if (typemodal.Value == "NN")
            {
                NgonNgu ng = new NgonNgu();
                ng.TenNgonNgu = txtTen.Text;
                
                if (editType.Value == "add")
                {
                    ng.MaNgonNgu = Tool.SinhMa();
                    int t = ngbll.Them(ng);
                    LoadNN();
                    typemodal.Value = "hide";
                }
                else
                {
                    ng.MaNgonNgu = hdId.Value;
                    ngbll.Sua(ng);
                    LoadNN();
                    typemodal.Value = "hide";
                }
            }
            if (typemodal.Value == "NXB")
            {
               
                NhaXuatBan nxb = new NhaXuatBan();
                nxb.TenNXB = txtTen.Text;
                nxb.GhiChu = txtGhichu.Text;
                if (editType.Value == "add")
                {
                    nxb.MaNXB = Tool.SinhMa();
                    int t = nxbbll.Them(nxb);
                    LoadNXB();
                    typemodal.Value = "hide";
                    //nxb.UrlLogo = Up(fileAnh);
                }
                else
                {
                   
                        nxb.MaNXB = hdId.Value;
                        nxbbll.Sua(nxb);
                        LoadNXB();
                        typemodal.Value = "hide";
                    
                }
            }
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            string id = idDelete.Value;
            tgbll.Xoa(id);
            tlbll.Xoa(id);
            lvbll.Xoa(id);
            ngbll.Xoa(id);
            nxbbll.Xoa(id);
            Delete.Value = "hide";
            LoadTG();
            LoadTL();
            LoadNN();
            LoadLV();
            LoadNXB();

               
            
        }
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
      
    }
}