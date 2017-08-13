using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Entities;

namespace DAL
{
    public class NgonNguDAL
    {
        private const string PARM_MANGONNGU = "@MaNgonNgu";
        private const string PARM_TENNGONNGU = "@TenNgonNgu";//ở đây khai báo các tên cột với @ ở trước
        public int Them(NgonNgu nn)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MANGONNGU,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TENNGONNGU,SqlDbType.NVarChar,30)
                //khai báo thứ tự như trong cái store đó
                //(-thuộc tính thứ nhất lấy từ tên khai báo ở trên-tiếp theo là kiểu dữ liệu-tiếp nữa là độ dài kiểu dữ liệu)
                //nếu là kiểu dữ liệu k có độ dài thì mình bỏ cái thuộc tính thứ 3 ví dụ như new sqlparameter(PARM_....,SqlDbType.Int)
            };
            parm[0].Value = nn.MaNgonNgu;
            parm[1].Value = nn.TenNgonNgu;
            //chỗ này thì phải truyền đúng theo thứ tự khai báo ở trên
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblNgonNgu_Them", parm); //các thuộc tính của hàm này không thay đổi trong mọi hàm trừ tên store với có hàm lấy tất thì đổi cả tên và parm là null
        }
        //hàm sửa thì có thể coppy nguyên hàm tên và đổi tên store
        public int Sua(NgonNgu nn)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MANGONNGU,SqlDbType.NVarChar,30),
                new SqlParameter(PARM_TENNGONNGU,SqlDbType.NVarChar,30)
                //khai báo thứ tự như trong cái store đó
                //(-thuộc tính thứ nhất lấy từ tên khai báo ở trên-tiếp theo là kiểu dữ liệu-tiếp nữa là độ dài kiểu dữ liệu)
                //nếu là kiểu dữ liệu k có độ dài thì mình bỏ cái thuộc tính thứ 3 ví dụ như new sqlparameter(PARM_....,SqlDbType.Int)
            };
            parm[0].Value = nn.MaNgonNgu;
            parm[1].Value = nn.TenNgonNgu;
            //chỗ này thì phải truyền đúng theo thứ tự khai báo ở trên
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblNgonNgu_Sua", parm);
        }
        /// <summary>
        /// Hàm xóa thì chỉ truyền vào  những khóa chính.ví dụ có 2 mã chính thì phải là Xoa(kiểu_dữ_liệu khóa_1,kiểu_dữ_liệu khóa_2, )
        /// </summary>
        /// <param name="Ma"></param>
        /// <returns></returns>
        public int Xoa(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MANGONNGU,SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            return DALHelper.ExecuteNonQuery(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblNgonNgu_Xoa", parm);
        }
        public List<NgonNgu> DSNgonNgu()
        {
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblNgonNgu_DS", null);//chỗ này để ý cuối là null
            List<NgonNgu> mylist = new List<NgonNgu>();
            while (d.Read())
            {
                NgonNgu nn = new NgonNgu();
                //chỗ này truyền thuộc tính phải đúng thứ tự như trong bảng sql
                nn.MaNgonNgu = d[0].ToString();
                nn.TenNgonNgu = d[1].ToString();
                mylist.Add(nn);
            }
            d.Dispose();
            return mylist;
        }
        /// <summary>
        /// Chỗ này truyền vào tương tự hàm sửa.cũng theo khóa chính
        /// </summary>
        /// <param name="Ma"></param>
        /// <returns></returns>
        public NgonNgu LayNgonNgu(string Ma)
        {
            SqlParameter[] parm = new SqlParameter[]{
                new SqlParameter(PARM_MANGONNGU,SqlDbType.NVarChar,30)
            };
            parm[0].Value = Ma;
            SqlDataReader d = DALHelper.ExecuteReader(DALHelper.ConnectionString, CommandType.StoredProcedure, "tblNgonNgu_Lay1", parm);
            NgonNgu nn = new NgonNgu();
            if (d.Read())
            {

                nn.MaNgonNgu = d[0].ToString();
                nn.TenNgonNgu = d[1].ToString();
            }
            return nn;
        }
    }
}
