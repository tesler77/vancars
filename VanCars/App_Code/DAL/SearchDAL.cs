using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SearchBLL;
using VanCars.App_Code;
using System.Net;
using Newtonsoft.Json;



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
            this.Company = "אלבר";
            string json = JsonConvert.SerializeObject(this);
            string a = GetApi.PostApi(json, "https://localhost:44361/api/CarsBLL");
            a = a.Replace("}", ",\\\"Company\\\":4\\r\\n  }");

            
            this.Company = "הרץ";
            string b = GetApi.PostApi(json, "https://localhost:44365/api/CarsBLL");
            b = b.Replace("}", ",\\\"Company\\\":3\\r\\n  }");
            a = a.Substring(0, a.Length - 2) + "," + b.Substring(2,b.Length-2);
            return a;
        }
    }

}