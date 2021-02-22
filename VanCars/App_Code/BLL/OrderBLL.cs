using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SearchBLL;
using VanCars.App_Code.DAL;
using VanCars.App_Code.BLL;

namespace VanCars.App_Code.BLL
{
    public class OrderBLL
    {
        public int Company { get; set; }
        public int totalPrice { get; set; }
        public int PickupBranch { get; set; }
        public int ReturnBranch { get; set; }
        public DateTime PickupDate { get; set; }
        public DateTime ReturnDate { get; set; }
        public int CarId { get; set; }
        public List<Extention> extetions { get; set; }
        public searchBLL Search { get; set; }
        public person person { get; set; }
        public creaditCardBLL creaditCard { get; set; }
        public string notes { get; set; }

        public OrderBLL(int company,int totalPrice,  int pickupBranch, int returnBranch, DateTime pickupDate, DateTime returnDate, int carId, List<Extention> extetions, searchBLL search, person person, creaditCardBLL creaditCard,string notes)
        {
            Company = company;
            this.totalPrice = totalPrice;
            PickupBranch = pickupBranch;
            ReturnBranch = returnBranch;
            PickupDate = pickupDate;
            ReturnDate = returnDate;
            CarId = carId;

            this.extetions = extetions;
            Search = search;
            this.person = person;
            this.creaditCard = creaditCard;
            this.notes = notes;
        }

        public List<string> CreateOrder()
        {

            OrderDAL order = new OrderDAL(this.Company,this.totalPrice,this.PickupBranch,this.ReturnBranch,this.PickupDate,this.ReturnDate,this.CarId,this.extetions,this.Search,this.person,this.creaditCard,this.notes);
            return order.CreateExtOrder();             
        }
    }
}