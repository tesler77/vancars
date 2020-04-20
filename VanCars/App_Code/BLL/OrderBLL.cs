using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SearchBLL;
using VanCars.App_Code.DAL;

namespace VanCars.App_Code.BLL
{
    public class OrderBLL
    {
        public int Company { get; set; }
        public int PickupBranch { get; set; }
        public int ReturnBranch { get; set; }
        public DateTime PickupDate { get; set; }
        public DateTime ReturnDate { get; set; }
        public int CarId { get; set; }
        public List<Extention> extetions { get; set; }
        public searchBLL Search { get; set; }
        public person person { get; set; }

        public OrderBLL(int company,  int pickupBranch, int returnBranch, DateTime pickupDate, DateTime returnDate, int carId, List<Extention> extetions, searchBLL search, person person)
        {
            Company = company;
            PickupBranch = pickupBranch;
            ReturnBranch = returnBranch;
            PickupDate = pickupDate;
            ReturnDate = returnDate;
            CarId = carId;

            this.extetions = extetions;
            Search = search;
            this.person = person;
        }

        public List<string> CreateOrder()
        {
            OrderDAL order = new OrderDAL(this.Company,this.PickupBranch,this.ReturnBranch,this.PickupDate,this.ReturnDate,this.CarId,this.extetions,this.Search,this.person);
            return order.CreateExtOrder();             
        }
    }
}