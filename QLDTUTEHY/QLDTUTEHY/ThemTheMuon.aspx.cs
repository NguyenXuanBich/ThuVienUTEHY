using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL;
using Entities;

namespace QLDTUTEHY
{
    public partial class ThemTheMuon : System.Web.UI.Page
    {
        QuaTrinhMuonTraBLL qtrbll = new QuaTrinhMuonTraBLL();
        QuaTrinhMuonTra qtr = new QuaTrinhMuonTra();
        ChiTietMuonTraBLL ctbll = new ChiTietMuonTraBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string page = (Request.QueryString["ID"] + "" != "") ? ("" + Request.QueryString["ID"]) : "";
                lblMa.InnerHtml = page;
                lbTen.InnerHtml = qtrbll.LayTen(page);
                List<ChiTietMuonTra> dt = new List<ChiTietMuonTra>();
                ViewState["table"] = dt;
                Loadtb();
                DataTable tbno = qtrbll.DocGiaSachNo(page);
                ViewState["SachNo"] = tbno;
                DataTable tbxo = tbno.Clone();
                ViewState["Xoa"] = tbxo;
                loadsno();

            }
        }
        private void loadsno()
        {
            DataTable dt = (DataTable)ViewState["SachNo"];
            grvSachNo.DataSource = dt;
            grvSachNo.DataBind();
        }
        private void Loadtb()
        {
            List<ChiTietMuonTra> tb = (List<ChiTietMuonTra>)ViewState["table"];
            grvMuonTra.DataSource = tb;
            grvMuonTra.DataBind();

        }
        protected void grvMuonTra_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow gvr;
            try
            {
                gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            }
            catch { return; }
            int index = gvr.RowIndex;
            DataTable no = (DataTable)ViewState["SachNo"];
            DataTable xoa = (DataTable)ViewState["Xoa"];
            List<ChiTietMuonTra> tb = (List<ChiTietMuonTra>)ViewState["table"];
           
            if (e.CommandName == "Xoa")
            {
                string Masac = tb[index].MaSach;
                tb.RemoveAt(index);
                int i = 0;
                foreach(DataRow r in xoa.Rows)
                {
                    if (r["MaSach"].ToString() == Masac)
                    {
                        no.Rows.Add(r.ItemArray);
                        xoa.Rows.Remove(r); break;
                    }
                }
                ViewState["SachNo"] = no;
                ViewState["Xoa"] = xoa;
                ViewState["table"] = tb;
                loadsno();
                Loadtb();                              
            }
        }

        protected void grvMuonTra_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvMuonTra.PageIndex = e.NewPageIndex;
            Loadtb();
        }

        protected void btnXong_Click(object sender, EventArgs e)
        {
            qtr.MaQuaTrinhMuonTra = Tool.SinhMa();
            qtr.MaCanBo_HSSV = lblMa.InnerText;
            qtr.MaThuThu = Session["ID"].ToString();
            qtr.GhiChu = txtGhiChu.Text;
            qtr.ThoiGianMuonTra = DateTime.Now;
            qtrbll.Them(qtr);
            List<ChiTietMuonTra> tb = (List<ChiTietMuonTra>)ViewState["table"];
            foreach (ChiTietMuonTra ct in tb)
            {
                ct.MaQuaTrinhTraSach = qtr.MaQuaTrinhMuonTra;
                ctbll.Them(ct);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            List<ChiTietMuonTra> tb = (List<ChiTietMuonTra>)ViewState["table"];
            ChiTietMuonTra ct = new ChiTietMuonTra();
            ct.MaQuaTrinhTraSach = qtr.MaQuaTrinhMuonTra;
            ct.MaSach = txtMaSach.Text;
            ct.MaSoCaBiet = txtMSCaBiet.Text;
            ct.MuonHayTra = 0;
            ct.SoNgayMuon = int.Parse(txtSoNgay.Text);
            ct.TinhTrang = txtTinhTrang.Text;
            bool check = true;
            foreach (ChiTietMuonTra c in tb)
            {
                if (c.MaSach == ct.MaSach) check = false;
                break;
            }
            if (check)
                tb.Add(ct);
            Loadtb();
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow gvr;
            try
            {
                gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            }
            catch { return; }
            int index = gvr.RowIndex;
            DataTable no = (DataTable)ViewState["SachNo"];
            DataTable xoa = (DataTable)ViewState["Xoa"];
            List<ChiTietMuonTra> tb = (List<ChiTietMuonTra>)ViewState["table"];
            if (e.CommandName == "BaoMat" || e.CommandName == "Tra")
            {
                DataRow r = no.NewRow();
                r = no.Rows[index];
                short t = 1;
                if (e.CommandName == "BaoMat") t = 2;
                ChiTietMuonTra ct = new ChiTietMuonTra("", r["MaSach"].ToString(), "", r["MaSoCaBiet"].ToString(), t, 0);
                xoa.Rows.Add(r.ItemArray);
                no.Rows.RemoveAt(index);
                tb.Add(ct);
                ViewState["SachNo"] = no;
                ViewState["Xoa"] = xoa;
                ViewState["table"] = tb;
                loadsno();
                Loadtb();
            }
        }

        protected void grvSachNo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvSachNo.PageIndex = e.NewPageIndex;
            loadsno();
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {

        }
    }
}