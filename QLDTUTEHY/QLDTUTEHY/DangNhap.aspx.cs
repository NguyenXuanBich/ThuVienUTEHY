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
    public partial class DangNhap : System.Web.UI.Page
    {
        ThuThuBLL ttbll = new ThuThuBLL();
        CanBoBLL cbbll = new CanBoBLL();
        HSSVBLL hssvbll = new HSSVBLL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (chkTT.Checked)
            {
                Response.Redirect("~/QLMuonTra.aspx");

            }
            else
            {
                Response.Redirect("~/TimSach.aspx");
            }

        }
    }
}
