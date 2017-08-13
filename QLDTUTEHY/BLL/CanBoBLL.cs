using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities;
using DAL;

namespace BLL
{
    public class CanBoBLL
    {
        CanBoDAL cbdal = new CanBoDAL();
        public int Them(CanBo cb)
        {
            return cbdal.Them(cb);
        }
        public int Sua(CanBo cb)
        {
            return cbdal.Sua(cb);

        }
        public int Xoa(String ma)
        {
            return cbdal.Xoa(ma);
        }
        public CanBo LayCB(string ma)
        {
            return cbdal.LayCB(ma);
        }
        public List<CanBo> DSCB()
        {
            return cbdal.DSCB();
        }
        public bool CheckMaCB(string id)
        {
            return cbdal.CheckMaCB(id);
        }
        public CanBo Login(string ma,string pass)
        {
            return cbdal.Login(ma,pass);
        }
    }
}
