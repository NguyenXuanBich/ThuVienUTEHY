using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entities;
using BLL;
using System.IO;
using System.Web.Script.Serialization;
using System.Web.Script.Services;

namespace QLDTUTEHY
{
    public partial class QLCanBo : System.Web.UI.Page
    {
        CanBoBLL cbbll = new CanBoBLL();
        DonViBLL dvbll = new DonViBLL();
        private string FilePath = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            LoadCB();
        }

        private void LoadCB()
        {
            List<CanBo> listcb = cbbll.DSCB();
            grvCanBo.DataSource = listcb;
            grvCanBo.DataBind();

            List<DonVi> lidv = dvbll.DSDV();
            ddlDonVi.DataSource = lidv;
            ddlDonVi.DataValueField = "MaDonVi";
            ddlDonVi.DataTextField = "TenDonVI";
            ddlDonVi.DataBind();
        }

        protected void grvCanBo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvCanBo.PageIndex = e.NewPageIndex;
            LoadCB();
        }

        protected void grvCanBo_RowCommand(object sender, GridViewCommandEventArgs e)
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
                CanBo cb = new CanBo();
                GridViewRow gvrow = grvCanBo.Rows[index];
                txtMaCB.Text = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
                txtMaCB.Enabled = false;
                cb = cbbll.LayCB(txtMaCB.Text);
                txtHovaTen.Text = cb.HoVaTen;
                txtDienthoai.Text = cb.SoDienThoai;
                ddlDonVi.SelectedValue = cb.MaDonVi;
                txtNgaysinh.Text = cb.NgaySinh.ToShortDateString(); 
                txtQuequan.Text = cb.QueQuan;            
                if (cb.GioiTinh) rdbNam.Checked = true;
                else rdbNu.Checked = true;
                txtEmail.Text = cb.DiaChiEMail;
                txtGhichu.Text = cb.GhiChu;
                if (cb.TrangThai) rdHD.Checked = true;
                else rdKHD.Checked = true;
                EditState.Value = "edit";
                editType.Value = "edit";

            }
            else
                if (e.CommandName == "Xoa")
                {
                    GridViewRow gvrow = grvCanBo.Rows[index];
                    string id = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
                    idDelete.Value = id;
                    EditState.Value = "delete";

                }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            CanBo cb = new CanBo();
            cb.HoVaTen = txtHovaTen.Text;
            cb.QueQuan = txtQuequan.Text;
            cb.NgaySinh = DateTime.Parse(txtNgaysinh.Text);
            cb.MaDonVi = ddlDonVi.SelectedValue;
            cb.GioiTinh = rdbNam.Checked;
            cb.SoDienThoai = txtDienthoai.Text;
            cb.DiaChiEMail = txtEmail.Text;
            cb.GhiChu = txtGhichu.Text;
            cb.MatKhau = txtMatKhau.Text;
            cb.TrangThai = rdHD.Checked;

            if (filAnh.HasFile)
            {
                cb.UrlPhoto = Up(filAnh);

            }
            if (editType.Value == "add")
            {

                cb.MaCanBo = txtMaCB.Text;
                int t = cbbll.Them(cb);
                EditState.Value = "hide";
                LoadCB();
            }
            else
            {

                cb.MaCanBo = txtMaCB.Text;
                cbbll.Sua(cb);
                LoadCB();
                EditState.Value = "hide";
            }
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

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            string id = idDelete.Value;
            cbbll.Xoa(id);
            EditState.Value = "hide";
            LoadCB();
        }

        //protected void CheckKey_Click(object sender, EventArgs e)
        //{
        //    if (txtMaCB.Text == "123") idState.Value = "true";
        //    else idState.Value = "false";
        //}
    }
}