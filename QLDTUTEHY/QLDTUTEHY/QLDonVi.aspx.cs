using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entities;
using BLL;
using System.Web.Services;

namespace QLDTUTEHY
{
    public partial class QLDonVi : System.Web.UI.Page
    {
        DonViBLL d = new DonViBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            LoadDV();

        }

        private void LoadDV()
        {
            List<DonVi> mylist = d.DSDV();
            grvDV.DataSource = mylist;
            grvDV.DataBind();
        }

        protected void grvDV_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvDV.PageIndex = e.NewPageIndex;
            LoadDV();
        }

        protected void grvDV_RowCommand(object sender, GridViewCommandEventArgs e)
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
                DonVi dv = new DonVi();
                GridViewRow gvrow = grvDV.Rows[index];
                txtMaDonVi.Enabled = false;
                txtMaDonVi.Text = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
                dv = d.LayDV(txtMaDonVi.Text);
                txtDiaChi.Text = dv.DiaChi;
                txtEmail.Text = dv.EMail;
                txtTenDV.Text = dv.TenDonVI;
                txtWeb.Text = dv.Website;
                txtTruongDonVi.Text = dv.TruongDonVI;
                txtSDT.Text = dv.SoDienThoai;

                EditState.Value = "edit";
                editType.Value = "edit";

            }
            if (e.CommandName == "Xoa")
            {
                GridViewRow gvrow = grvDV.Rows[index];
                string id = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
                idDelete.Value = id;
                EditState.Value = "delete";

            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            DonVi dv = new DonVi();
            dv.MaDonVi = txtMaDonVi.Text;
            dv.TenDonVI = txtTenDV.Text;
            dv.SoDienThoai = txtSDT.Text;
            dv.TruongDonVI = txtTruongDonVi.Text;
            dv.Website = txtWeb.Text;
            dv.DiaChi = txtDiaChi.Text;
            dv.EMail = txtEmail.Text;
            if (editType.Value == "add")
            {


                int t = d.Them(dv);
                LoadDV();
            }
            else
            {
                d.Sua(dv);
                LoadDV();
                EditState.Value = "hide";
            }
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            string id = idDelete.Value;
            d.Xoa(id);
            EditState.Value = "hide";
            LoadDV();
        }
       
         [WebMethod]
         [System.ComponentModel.ToolboxItem(false)]
         
        public string CheckIDDV(string id)
        {
            if (id != null || id != "")
            {
                DonViBLL ql = new DonViBLL();
                return ql.CheckDonVi(id).ToString();
            }
            return "true";
        }
    }
    
}