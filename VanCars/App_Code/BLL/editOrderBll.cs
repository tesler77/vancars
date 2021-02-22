using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SearchBLL;
using VanCars.App_Code.DAL;
using Data;

namespace VanCars.App_Code.BLL
{
    public class editOrderBll : OrderBLL
    {
        public string orderId { get; set; }
        public string externalId { get; set; }

        public editOrderBll(int company, int totalPrice, int pickupBranch, int returnBranch, DateTime pickupDate, DateTime returnDate, int carId, List<Extention> extetions, searchBLL search, person person, creaditCardBLL creaditCard ,string orderId,string notes):base( company,  totalPrice,  pickupBranch,  returnBranch,  pickupDate,  returnDate,  carId, extetions,  search,  person,  creaditCard,notes)
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
            this.orderId = orderId;
            this.externalId = getExtIdByOrderId(orderId);
            this.notes = notes;
        }

        public int editOrder()
        {
            editOrderDal editOrder = new editOrderDal(int.Parse(this.orderId), int.Parse(this.externalId), this.Company, this.totalPrice, this.PickupBranch, this.ReturnBranch, this.PickupDate, this.ReturnDate, this.CarId, this.extetions, this.Search, this.person, this.creaditCard,this.notes);
            return editOrder.editOrder();
        }
        private string getExtIdByOrderId(string orderId)
        {
            DataBase db = new DataBase();
            string sql = "select ExternalRentId from OrderTable where RentId = " + orderId;
            return db.ExecuteScalar(sql);
        }
    }
}