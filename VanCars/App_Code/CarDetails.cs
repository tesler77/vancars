using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VanCars.App_Code
{
    public class CarDetails
    {
        public int CarId { get; set; }
        public int CarLevel { get; set; }
        public int Seats { get; set; }
        public string GearBox { get; set; }
        public int minimumAge { get; set; }
        public int EngineCapacity { get; set; }
        public int Doors { get; set; }
        public string CarName { get; set; }
        public int Baegs { get; set; }
        public DateTime AddDate { get; set; }
        public float PriceOfDay { get; set; }
        public string CarNumber { get; set; }
        public int IsInBranch { get; set; }
        public string PicName { get; set; }
    }
}