using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ExternalOrder;

namespace VanCars.App_Code
{
    public class editExtOrder:ExtOrder
    {
        public int orderId { get; set; }

        public editExtOrder(int orderId, string idNumber, string name, string telNo, string phone, string licenssNo, int pickupBranch, int returnBranch, string pickupDate, string returnDate, int carId, int rentersAge, string containExtensions, string cardNumber, string cardMonth, string cardYear, string digitNo, string ownerId,string notes):base( idNumber,  name,  telNo,  phone,  licenssNo,  pickupBranch,  returnBranch,  pickupDate,  returnDate,  carId,  rentersAge,  containExtensions,  cardNumber,  cardMonth,  cardYear,  digitNo, ownerId,notes)
        {
            this.orderId = orderId;
        }
    }
}