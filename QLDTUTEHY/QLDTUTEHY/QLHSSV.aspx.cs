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
    public partial class QLHSSV : System.Web.UI.Page
    {
        HSSVBLL hssvbll = new HSSVBLL();
        private string FilePath = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            LoadHSSV();
        }

        private void LoadHSSV()
        {
            List<HSSV> mylist = hssvbll.DSHSSV();
            grvHSSV.DataSource = mylist;
            grvHSSV.DataBind();
        }
        protected void grvHSSV_RowCommand(object sender, GridViewCommandEventArgs e)
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
                HSSV hssv = new HSSV();
                GridViewRow gvrow = grvHSSV.Rows[index];
                txtMaHSSV.Enabled = false;
                txtMaHSSV.Text = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
                hssv = hssvbll.LayHSSV(txtMaHSSV.Text);
                txtHoTen.Text = hssv.HoTen;
                txtMaLop.Text = hssv.MaLop;
                if (hssv.GioiTinh) rdbNam.Checked = true;
                else rdbNu.Checked = true;
                txtNgaySinh.Text = hssv.NgaySinh.ToShortDateString(); 
                txtNoiSinh.Text = hssv.NoiSinh;
                txtQueQuan.Text = hssv.QueQuan;
                txtNoiOHienNay.Text = hssv.NoiOHienNay;
                txtDienThoai.Text = hssv.DienThoai;
                txtEMail.Text = hssv.EMail;
                txtGhiChu.Text = hssv.GhiChu;
                if (hssv.TrangThai) rdHD.Checked = true;
                else rdKHD.Checked = true;
                EditState.Value = "edit";
                editType.Value = "edit";

            }
            else
                if (e.CommandName == "Xoa")
                {
                    GridViewRow gvrow = grvHSSV.Rows[index];
                    string id = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
                    idDelete.Value = id;
                    EditState.Value = "delete";

                }
        }

        protected void grvHSSV_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvHSSV.PageIndex = e.NewPageIndex;
            LoadHSSV();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            HSSV hssv = new HSSV();
            hssv.HoTen = txtHoTen.Text;
            hssv.MaLop = txtMaLop.Text;
            hssv.GioiTinh = rdbNam.Checked;
            hssv.NgaySinh = DateTime.Parse(txtNgaySinh.Text);
            hssv.NoiSinh = txtNoiSinh.Text;
            hssv.QueQuan = txtQueQuan.Text;
            hssv.NoiOHienNay = txtNoiOHienNay.Text;
            hssv.DienThoai = txtDienThoai.Text;
            hssv.EMail = txtEMail.Text;
            hssv.GhiChu = txtGhiChu.Text;
            hssv.MatKhau = txtMatKhau.Text;
            hssv.TrangThai = rdHD.Checked;
            if (fileAnh.HasFile)
            {
                hssv.UrlPhoto = Up(fileAnh);

            }
            if (editType.Value == "add")
            {               
                hssv.MaHSSV = txtMaHSSV.Text;
                int t = hssvbll.Them(hssv);
                LoadHSSV();
            }
            else
            {              
                hssv.MaHSSV = txtMaHSSV.Text;
                hssvbll.Sua(hssv);
                LoadHSSV();
                EditState.Value = "hide";
            }
           
            EditState.Value="hide";   

            //if (fileAnh.HasFile)
            //{
            //    hssv.UrlPhoto = Up(fileAnh);

            //}
            //if (editType.Value == "add")
            //{

            //    hssv.MaHSSV = txtMaHSSV.Text;
            //    int t = hssvbll.Them(hssv);
            //    LoadHSSV();
            //}
            //else
            //{
            //    hssv.MaHSSV = txtMaHSSV.Text;
            //    hssvbll.Sua(hssv);
            //    LoadHSSV();
            //    EditState.Value = "hide";
            //}

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

        protected void btnThem_Click(object sender, EventArgs e)
        {

        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            string id = idDelete.Value;
            hssvbll.Xoa(id);
            EditState.Value = "hide";
            LoadHSSV();
        }
    }
}