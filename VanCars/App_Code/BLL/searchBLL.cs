using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VanCars.App_Code;
using searchDAL;


namespace SearchBLL
{
    public class searchBLL
    {
        public string PickupLocation { get; set; }
        public string PickupDate { get; set; }
        public string ReturnLocarion { get; set; }
        public string ReturnDate { get; set; }


        public searchBLL()
        {

        }
        public searchBLL(string PickupLocation,string PickupDate,string ReturnLocarion,string ReturnDate)
        {
            this.PickupLocation = PickupLocation;
            this.PickupDate = PickupDate;
            this.ReturnLocarion = ReturnLocarion;
            this.ReturnDate = ReturnDate;
        }
        public string GetList()
        {
            SearchDAL search = new SearchDAL(this.PickupLocation, this.PickupDate, this.ReturnLocarion, this.ReturnDate);
            return search.GetCars();
        }
    }
}