using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;
using DAL;

namespace BLL
{
    public class Sach_CaBietBLL
    {
        Sach_CaBietDAL s_cbdal = new Sach_CaBietDAL();
        public int Them(Sach_CaBiet s_cb)
        {
            return s_cbdal.Them(s_cb);
        }
        public void ThemDSSachCB(string MaSach,int soLuong)
        {
            for(int t=1;t<=soLuong;t++)
            {
                string macb = "000" + t.ToString();
                macb = macb.Substring(macb.Length - 3);
                Them(new Sach_CaBiet(MaSach, macb, 1, ""));
            }
           
        }
        public int Sua(Sach_CaBiet s_cb)
        {
            return s_cbdal.Sua(s_cb);

        }
        public int Xoa(string ma)
        {
            return s_cbdal.Xoa(ma);
        }
        public int Check(string mas,string mcb)
        {
            return s_cbdal.Check(mas, mcb);
        }
        public Sach_CaBiet LayCB(string ma)
        {
            return s_cbdal.LaySach_CaBiet(ma);
        }
        public List<Sach_CaBiet> DSSCB()
        {
            return s_cbdal.DSSach_CaBiet();
        }
    }
}
