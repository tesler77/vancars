using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Data;
using System.Data;
using Newtonsoft.Json;

namespace VanCars.App_Code
{
    public class order
    {
        public int RentId { get; set; }
        public int CustomId { get; set; }
        public string ExternalRentId { get; set; }
        public string CarName { get; set; }
        public int CarId { get; set; }
        public int CarLevel { get; set; }
        public string CompanyId { get; set; }
        public int Seats { get; set; }
        public string GearBox { get; set; }
        public int EngineCapacity { get; set; }
        public int Doors { get; set; }
        public int Beags { get; set; }
        public int PickupBranch { get; set; }
        public string PickupBranchText { get; set; }
        public string PickupDate { get; set; }
        public int ReturnBranch { get; set; }
        public string ReturnBranchText { get; set; }
        public string ReturnDate { get; set; }
        public string DateOrder { get; set; }
        public string Status { get; set; }

        public order(int rentId, int customId, string externalRentId, string carName,int carId, int carLevel, string companyId, int seats, string gearBox, int engineCapacity, int doors, int beags, int pickupBranch, string pickupBranchText, string pickupDate, int returnBranch, string returnBranchText, string returnDate, string dateOrder, string status)
        {
            RentId = rentId;
            CustomId = customId;
            ExternalRentId = externalRentId;
            CarName = carName;
            CarId = carId;
            CarLevel = carLevel;
            CompanyId = companyId;
            Seats = seats;
            GearBox = gearBox;
            EngineCapacity = engineCapacity;
            Doors = doors;
            Beags = beags;
            PickupBranch = pickupBranch;
            PickupBranchText = pickupBranchText;
            PickupDate = pickupDate;
            ReturnBranch = returnBranch;
            ReturnBranchText = returnBranchText;
            ReturnDate = returnDate;
            DateOrder = dateOrder;
            Status = status;
        }
        public order() { }

        public string getOrder()
        {
            DataBase db = new DataBase();
            string sql = "select RentId ,CustomId,ExternalRentId,CarName,CarId,carLevel.LevelName,companys.CompanyName,Seats,GearBox,EngineCapacity,Doors,Beags,pickupBranchs.Address + ' ' + pickupCity.CityName as PickupBranchText,PickupDate,returnBranchs.Address + ' ' + returnCitys.CityName as ReturnBranchText,ReturnDate,DateOrder,statuses.statusName as Status from OrderTable inner join CarLevelTable as carLevel on OrderTable.CarLevel = carLevel.IdLevel inner join CompanysTable as companys on OrderTable.CompanyId = companys.CompanyId inner join  BranchTable as pickupBranchs on OrderTable.PickupBranch = pickupBranchs.BranchId inner join CityTable as pickupCity on pickupBranchs.CityId = pickupCity.CityId inner join BranchTable as returnBranchs on OrderTable.ReturnBranch = returnBranchs.BranchId inner join CityTable as returnCitys on returnBranchs.CityId = returnCitys.CityId inner join statusesTable as statuses on OrderTable.Status = statuses.statusId where RentId = " + this.RentId;
            DataTable dt = db.ExecuteReader(sql);
            if(dt.Rows.Count > 0)
            {
                return JsonConvert.SerializeObject(dt.Rows[0]);
            }
            return "";
        }
    }
}