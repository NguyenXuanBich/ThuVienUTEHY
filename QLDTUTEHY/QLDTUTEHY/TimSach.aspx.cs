using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entities;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using BLL;
using System.IO;

namespace QLDTUTEHY
{
    public partial class TimSach : System.Web.UI.Page
    {
        SachBLL sbll = new SachBLL();
        TacGiaBLL tgbll = new TacGiaBLL();
        NgonNguBLL ngvbll = new NgonNguBLL();
        TheLoaiBLL tlbll = new TheLoaiBLL();
        LinhVucBLL lvbll = new LinhVucBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            LoadTS();
        }
        private void LoadTS()
        {
            List<Sach> mylist = sbll.TimSach(txtKey.Text);
            grvTimSach.DataSource = mylist;
            grvTimSach.DataBind();
        }
        protected void grvTimSach_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvTimSach.PageIndex = e.NewPageIndex;
            LoadTS();
        }

        protected void grvTimSach_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {

            String Key = txtKey.Text;
            
            List<Sach> TimSach = sbll.TimSach(txtKey.Text);
            grvTimSach.DataSource=TimSach;
            grvTimSach.DataBind();
        }
    }
}