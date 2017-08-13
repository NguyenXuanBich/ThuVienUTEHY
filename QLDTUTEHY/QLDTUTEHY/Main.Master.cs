using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDTUTEHY
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string type = Session["type"].ToString();
            if(type==null||type=="")
                Response.Redirect("~/DangNhap.aspx");
            string url = "image/" + Session["anh"].ToString();
            anhdaidien.Src = url;
            anh2.Src = url;
            string ten = Session["Name"].ToString();
            h2Ten.InnerHtml = ten;
            lbTen2.InnerText = ten;
        }
    }
}