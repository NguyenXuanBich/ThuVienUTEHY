using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace BLL
{
    static public class Tool
    {
        public static string SinhMa()
        {
            DateTime time = DateTime.Now;

            return time.Year.ToString() + "_" + (time.Month < 10 ? "0" + time.Month.ToString() : time.Month.ToString()) + "_" + (time.Day < 10 ? "0" + time.Day.ToString() : time.Day.ToString()) + "_" + (time.Hour < 10 ? "0" + time.Hour.ToString() : time.Hour.ToString()) + "_" + (time.Minute < 10 ? "0" + time.Minute.ToString() : time.Minute.ToString()) + "_" + (time.Second < 10 ? "0" + time.Second.ToString() : time.Second.ToString()) + "_" + (time.Millisecond.ToString());
        }
        public static string convertToUnSign3(string s)
        {
            Regex regex = new Regex("\\p{IsCombiningDiacriticalMarks}+");
            string temp = s.Normalize(NormalizationForm.FormD);
            return regex.Replace(temp, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D');
        }  
    }
}
