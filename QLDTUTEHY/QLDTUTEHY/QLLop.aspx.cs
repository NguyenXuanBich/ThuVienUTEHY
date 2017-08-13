using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entities;
using BLL;

namespace QLDTUTEHY
{
    public partial class QLLop : System.Web.UI.Page
    {
        LopHocBLL lhbll = new LopHocBLL();
        DonViBLL dvbll = new DonViBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            List<DonVi> lidv = dvbll.DSDV();
            ddlDonvi.DataSource = lidv;
            ddlDonvi.DataValueField = "MaDonVi";
            ddlDonvi.DataTextField = "TenDonVi";
            ddlDonvi.DataBind();
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            LoadLH();
        }
        private void LoadLH()
        {
            List<LopHoc> mylist = lhbll.DSL();
            grvLop.DataSource = mylist;
            grvLop.DataBind();
        }
        protected void grvLop_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvLop.PageIndex = e.NewPageIndex;
            LoadLH();
        }

        protected void grvLop_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow gvrLop;
            try
            {
                gvrLop = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            }
            catch { return; }
            int index = gvrLop.RowIndex;
            if (e.CommandName == "Sua")
            {
                LopHoc lh = new LopHoc();
                GridViewRow gvrow = grvLop.Rows[index];
                txtMaLop.Enabled = false;
                txtMaLop.Text = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
                lh = lhbll.LayLopHoc(txtMaLop.Text);
                txtTenLop.Text = lh.TenLop;
                txtHeDaoTao.Text = lh.HeDaoTao;
                txtKhoa.Text = lh.Khoa;
                ddlDonvi.Text = lh.MaKhoa;
                EditState.Value = "edit";
                editType.Value = "edit";

            }
            else
                if (e.CommandName == "Xoa")
                {
                    GridViewRow gvrow = grvLop.Rows[index];
                    string id = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
                    idDelete.Value = id;
                    EditState.Value = "delete";
                }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
        }

        protected void btnSave_Click1(object sender, EventArgs e)
        {
            LopHoc lh = new LopHoc();
            lh.MaKhoa = ddlDonvi.Text;
            lh.TenLop = txtTenLop.Text;
            lh.HeDaoTao = txtHeDaoTao.Text;
            lh.Khoa = txtKhoa.Text;

            if (editType.Value == "add")
            {

                lh.MaLop = txtMaLop.Text;
                EditState.Value = "hide";
                int t = lhbll.Them(lh);
                LoadLH();
            }
            else
            {
                lh.MaLop = txtMaLop.Text;
                lhbll.Sua(lh);
                LoadLH();
                EditState.Value = "hide";
            }

        }

        protected void btnXoa_Click1(object sender, EventArgs e)
        {
            string id = idDelete.Value;
            lhbll.Xoa(id);
            EditState.Value = "hide";
            LoadLH();
        }
    }
}
