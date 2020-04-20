using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VanCars.App_Code;
using Newtonsoft.Json;
using System.Data;
using Glob;

namespace VanCars.App_Code.DAL
{
    public class carDAL
    {
        public string Company { get; set; }
        public int id { get; set; }

        public carDAL(string Company,int id)
        {
            this.Company = Company;
            this.id = id;
        }

        
        public string GetDetails()
        {
            string ObjId = JsonConvert.SerializeObject(this.id);
            string Address = GlobFuncs.GetApiAddress(int.Parse(this.Company), "CarDetail");            
            string ret = GetApi.PostApi(ObjId, Address);
            return ret;
        }
    }
}