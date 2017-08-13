using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entities;
using BLL;
using System.Data;

namespace QLDTUTEHY
{
    public partial class ChiTietNguoiDung : System.Web.UI.Page
    {
        QuaTrinhMuonTraBLL qtrbll = new QuaTrinhMuonTraBLL();
        QuaTrinhMuonTra qtr = new QuaTrinhMuonTra();
        ChiTietMuonTraBLL ctbll = new ChiTietMuonTraBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            string page = (Request.QueryString["ID"] + "" != "") ? ("" + Request.QueryString["ID"]) : "";
            hMa.InnerHtml = page;
            hTen.InnerHtml = qtrbll.LayTen(page);
            List<ChiTietMuonTra> dt = new List<ChiTietMuonTra>();
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
            grvSachMuon.DataSource = dt;
            grvSachMuon.DataBind();
        }
        protected void grvSachMuon_RowCommand(object sender, GridViewCommandEventArgs e)
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
            }
        }

        protected void grvSachMuon_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvSachMuon.PageIndex = e.NewPageIndex;
            loadsno();
        }
    }
}