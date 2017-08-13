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
    public partial class QLMuonTra : System.Web.UI.Page
    {
        QuaTrinhMuonTraBLL qtbl = new QuaTrinhMuonTraBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadDSMT();
            }
        }

        private void LoadDSMT()
        {
            List<QuaTrinhMuonTra> qtr = qtbl.DSQTMT();
            grvMuonTra.DataSource = qtr;
            grvMuonTra.DataBind();
        }

        protected void grvMuonTra_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Xoa")
            {
                GridViewRow gvr;
                try
                {
                    gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                }
                catch { return; }
                int index = gvr.RowIndex;

                string id = grvMuonTra.DataKeys[index].Value.ToString();
                idDelete.Value = id;
                delete.Value = "show";

            }
        }

        protected void grvMuonTra_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvMuonTra.PageIndex = e.NewPageIndex;
            LoadDSMT();
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            string id = idDelete.Value;
            qtbl.Xoa(id);
            delete.Value = "hide";
            LoadDSMT();
        }
    }
}