using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;
using DAL;

namespace BLL
{
    public class NhaXuatBanBLL
    {
        NhaXuatBanDAL nxbdal = new NhaXuatBanDAL();
        public int Them(NhaXuatBan nxb)
        {
            return nxbdal.Them(nxb);
        }
        public int Sua(NhaXuatBan nxb)
        {
            return nxbdal.Sua(nxb);

        }
        public int Xoa(String ma)
        {
            return nxbdal.Xoa(ma);
        }
        public NhaXuatBan LayNXB(string ma)
        {
            return nxbdal.LayNXB(ma);
        }
        public List<NhaXuatBan> DSNXB()
        {
            return nxbdal.DSNXB();
        }
    }
}
