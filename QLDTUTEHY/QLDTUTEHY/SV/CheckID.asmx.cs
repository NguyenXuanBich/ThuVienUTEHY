using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BLL;

namespace QLDTUTEHY
{
    /// <summary>
    /// Summary description for CheckID
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class CheckID : System.Web.Services.WebService
    {

        [WebMethod]
        public string CheckIDTT(string id)
        {
            if (id != null || id != "")
            {
                ThuThuBLL ql = new ThuThuBLL();
                return ql.CheckMa(id).ToString();
            }
            return "true";
        }
        [WebMethod]
        public  string CheckIDDV(string id)
        {
            if (id != null || id != "")
            {
                DonViBLL ql = new DonViBLL();
                return ql.CheckDonVi(id).ToString();
            }
            return "true";
        }
        [WebMethod]
        public string CheckMuon(string DG,string MS,string CB)
        {
            string mes="";
           if(DG.Length>0 && MS.Length>0 && CB.Length>0)
           {
               Sach_CaBietBLL scbbll = new Sach_CaBietBLL();
               if (scbbll.Check(MS, CB) > 0)
                   mes = "true";
               else mes = "Không tồn tại sách này hoặc đã có người mượn";
               if (mes == "true")
               {
                   QuaTrinhMuonTraBLL qtrbll = new QuaTrinhMuonTraBLL();
                   if (qtrbll.Check(MS, DG) > 0)
                       mes = "Độc giả này đang mượn đầu sách này rồi";
               }

           }
           return mes;
        }
        [WebMethod]
        public string CheckIDCB(string id)
        {
            if (id != null || id != "")
            {
                CanBoBLL ql = new CanBoBLL();
                return ql.CheckMaCB(id).ToString();
            }
            return "true";
        }
        [WebMethod]
        public string CheckIDHSSV(string id)
        {
            if (id != null || id != "")
            {
                HSSVBLL ql = new HSSVBLL();
                return ql.CheckMaHSSV(id).ToString();
            }
            return "true";
        }
        [WebMethod]
        public string CheckIDDG(string id)
        {
            if (id != null || id != "")
            {
                QuaTrinhMuonTraBLL qt = new QuaTrinhMuonTraBLL();
                return qt.LayTen(id);
            }
            return "";
        }
        [WebMethod]
        public string CheckIDLH(string id)
        {
            if (id != null || id != "")
            {
                LopHocBLL ql = new LopHocBLL();
                return ql.CheckMaLH(id).ToString();
            }
            return "true";
        }

    }
}
