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
    public partial class QLTaiKhoan : System.Web.UI.Page
    {
        TaiKhoanBLL tkbll = new TaiKhoanBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadTK();
        }

        private void LoadTK()
        {
            List<TaiKhoan> mylist = tkbll.DSTaiKhoan();
            grvTK.DataSource = mylist;
            grvTK.DataBind();
        }

        protected void grvTK_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvTK.PageIndex = e.NewPageIndex;
            LoadTK();
        }

        protected void grvTK_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    GridViewRow gvr;
        //    try
        //    {
        //        gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
        //    }
        //    catch { return; }
        //    int index = gvr.RowIndex;
        //    if (e.CommandName == "Sua")
        //    {
        //        GridViewRow gvrow = grvTK.Rows[index];
        //        hdTenDN.Value = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
        //        txtTenDangNhap.Text = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
        //        txtHoVaTen.Text = HttpUtility.HtmlDecode(gvrow.Cells[1].Text).ToString();
        //        txtMatKhau.Text = HttpUtility.HtmlDecode(gvrow.Cells[2].Text).ToString();
        //        txtQuyenHan.Text = HttpUtility.HtmlDecode(gvrow.Cells[3].Text).ToString();
        //        //filAnh.Text = HttpUtility.HtmlDecode(gvrow.Cells[4].Text).ToString();
        //        //txtTrangThai.Text = HttpUtility.HtmlDecode(gvrow.Cells[5].Text).ToString();
        //        txtMoTa.Text = HttpUtility.HtmlDecode(gvrow.Cells[6].Text).ToString();
        //        if (tk.TrangThai) rdTK.Checked = true;
        //        else rdKTK.Checked = true;
        //        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        //        sb.Append(@"<script type='text/javascript'>");
        //        sb.Append("$('#modalEdit').modal('show');");
        //        sb.Append(@"</script>");
        //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);

        //    }
        //    else
        //        if (e.CommandName == "Xoa")

        //        {
        //            GridViewRow gvrow = grvTK.Rows[index];
        //            string id = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();

        //            tkbll.Xoa(id);
        //            LoadTK();
        //    }
        //}
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
                TaiKhoan tk = new TaiKhoan();
                GridViewRow gvrow = grvTK.Rows[index];
                txtTenDangNhap.Enabled = false;
                txtTenDangNhap.Text = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
                tk = tkbll.LayTaiKhoan(txtTenDangNhap.Text);
                txtHoVaTen.Text = tk.HoVaTen;
                txtMatKhau.Text = tk.MatKhau;
                txtQuyenHan.Text = tk.QuyenHan.ToString();
                txtMoTa.Text = tk.MoTa;
                if (tk.TrangThai) rdTK.Checked = true;
                else rdKTK.Checked = true;
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#modalTK').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);

            }
            else
                if (e.CommandName == "Xoa")
                {
                    GridViewRow gvrow = grvTK.Rows[index];
                    string id = HttpUtility.HtmlDecode(gvrow.Cells[0].Text).ToString();
                    tkbll.Xoa(id);
                    LoadTK();
                }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            TaiKhoan tk = new TaiKhoan();
            tk.TenDangNhap = txtTenDangNhap.Text;
            tk.HoVaTen = txtHoVaTen.Text;
            tk.MatKhau = txtMatKhau.Text;
            tk.QuyenHan = Convert.ToByte(txtQuyenHan.Text);
            tk.MoTa = txtMoTa.Text;
            tk.TrangThai = rdTK.Checked;
            

            if (txtTenDangNhap.Enabled == true)
            {
                tk.TenDangNhap = txtTenDangNhap.Text;
                tkbll.Them(tk);
                LoadTK();
            }
            else
            {
                tk.TenDangNhap = txtTenDangNhap.Text;
                tkbll.Sua(tk);
                LoadTK();
            }
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#modalTK').modal('hide');");
            //sb.Append("$('body').removeClass('modal-open');");
            sb.Append("$('.modal-backdrop').remove();");
            sb.Append(@"</script>"); 
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);
        }
    }
}