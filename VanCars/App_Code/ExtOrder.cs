using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VanCars.App_Code;

namespace ExternalOrder
{
    public class ExtOrder
    {
        public string IdNumber { get; set; }
        public string Name { get; set; }
        public string TelNo { get; set; }
        public string Phone { get; set; }
        public string LicenssNo { get; set; }
        public int PickupBranch { get; set; }
        public int ReturnBranch { get; set; }
        public string PickupDate { get; set; }
        public string ReturnDate { get; set; }
        public int CarId { get; set; }
        public int RentersAge { get; set; }
        public string ContainExtensions { get; set; }
        public string cardNumber { get; set; }
        public string cardMonth { get; set; }
        public string cardYear { get; set; }
        public string digitNo { get; set; }
        public string ownerId { get; set; }
        public string notes { get; set; }

        public ExtOrder(string idNumber, string name, string telNo, string phone, string licenssNo, int pickupBranch, int returnBranch, string pickupDate, string returnDate, int carId, int rentersAge,string containExtensions,string cardNumber,string cardMonth,string cardYear,string digitNo,string ownerId,string notes)
        {
            IdNumber = idNumber;
            Name = name;
            TelNo = telNo;
            Phone = phone;
            LicenssNo = licenssNo;
            PickupBranch = pickupBranch;
            ReturnBranch = returnBranch;
            PickupDate = pickupDate;
            ReturnDate = returnDate;
            CarId = carId;
            RentersAge = rentersAge;
            ContainExtensions = containExtensions;
            this.cardNumber = cardNumber;
            this.cardMonth = cardMonth;
            this.cardYear = cardYear;
            this.digitNo = digitNo;
            this.ownerId = ownerId;
            this.notes = notes;
                
        }
    }
}