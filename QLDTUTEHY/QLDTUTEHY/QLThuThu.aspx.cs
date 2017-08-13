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
    public partial class QLThuThu : System.Web.UI.Page
    {
        ThuThuBLL ttbll = new ThuThuBLL();
        private string FilePath = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            LoadTT();
        }

        private void LoadTT()
        {
            List<ThuThu> mylist = ttbll.DSThuThu();
            grvThuThu.DataSource = mylist;
            grvThuThu.DataBind();
        }
        protected void grvThuThu_RowCommand(object sender, GridViewCommandEventArgs e)
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
                ThuThu tt = new ThuThu();
                GridViewRow gvrow = grvThuThu.Rows[index];
                txtMaThuThu.Enabled = false;
                txtMaThuThu.Text = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
                tt = ttbll.LayThuThu(txtMaThuThu.Text);
                txtDienthoai.Text = tt.DienThoai;
                txtEmail.Text = tt.DiaChiEmail;
                txtHovaTen.Text = tt.HoTen;
                txtGhichu.Text = tt.GhiChu;
                if (tt.TrangThai) rdHD.Checked = true;
                else rdKHD.Checked = true;
                EditState.Value = "edit";
                editType.Value = "edit";

            }
            else
                if (e.CommandName == "Xoa")
                {
                    GridViewRow gvrow = grvThuThu.Rows[index];
                    string id = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
                    idDelete.Value = id;
                    EditState.Value = "delete";

                }
        }

        protected void grvThuThu_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvThuThu.PageIndex = e.NewPageIndex;
            LoadTT();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            ThuThu tt = new ThuThu();
            tt.HoTen = txtHovaTen.Text;
            tt.MatKhau = txtMatKhau.Text;
            tt.DiaChiEmail = txtEmail.Text;
            tt.DienThoai = txtDienthoai.Text;
            tt.GhiChu = txtGhichu.Text;
            tt.TrangThai = rdHD.Checked;
            //EditState.Value="hide";   
          
            if (filAnh.HasFile)
            {
                tt.UrlPhoto = Up(filAnh);
               
            }
            if (editType.Value == "add")
            {

                tt.MaThuThu = txtMaThuThu.Text;
                int t = ttbll.Them(tt);
                LoadTT();
            }
            else
            {
                tt.MaThuThu = txtMaThuThu.Text;
                ttbll.Sua(tt);
                LoadTT();
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

        protected void btnThem_Click(object sender, EventArgs e)
        {

        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            string id = idDelete.Value;
            ttbll.Xoa(id);
            EditState.Value = "hide";
            LoadTT();
        }
    }
}