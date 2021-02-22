using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SearchBLL;
using VanCars.App_Code;
using System.Net;
using Newtonsoft.Json;
using System.IO;
using System.Data;
using Glob;

namespace searchDAL
{
    public class SearchDAL
    {
        public string FromLocation { get; set; }
        public string FromDate { get; set; }
        public string ReturnLocation { get; set; }
        public string ReturnDate { get; set; }
        public string Company { get; set; }

        public SearchDAL(string FromLocation, string FromDate, string ReturnLocation, string ReturnDate)
        {
            this.FromLocation = FromLocation;
            this.FromDate = FromDate;
            this.ReturnLocation = ReturnLocation;
            this.ReturnDate = ReturnDate;

        }


        public string GetCars()
        {
            string result = "\"[";
            string json = JsonConvert.SerializeObject(this);
            DataTable dt = new DataTable();
            dt = GlobFuncs.getCarsApis();
            foreach (DataRow row in dt.Rows)
            {
                string res = GetApi.PostApi(json, row["ApiAddress"].ToString() + "CarsBLL");
                if (res.Length > 0)
                {
                    res = res.Replace("}", ",\\\"Company\\\":"+row["CompanyId"] +"\\r\\n  }");
                    res = res.Substring(2, res.Length - 4) + ",";
                    result = result + res;
                }

            }
            result = result.Substring(0, result.Length - 1);
            result = result + "]\"";
            return result;
        }
    }

}