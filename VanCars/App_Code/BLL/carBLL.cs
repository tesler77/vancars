using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VanCars.App_Code.DAL;

namespace VanCars.App_Code.BLL
{
    public class carBLL
    {
        public string Company { get; set; }
        public int id { get; set; }

        public carBLL(string Company,int id)
        {
            this.Company = Company;
            this.id = id;
        }

        public string GetDetail()
        {
            carDAL carDAL = new carDAL(this.Company, this.id);
            return carDAL.GetDetails();
        }
    }
}