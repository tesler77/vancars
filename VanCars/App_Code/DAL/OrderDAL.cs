using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VanCars.App_Code;
using Data;
using Glob;
using Newtonsoft.Json;
using SearchBLL;
using VanCars.App_Code;
using System.Data;
using ExternalOrder;

namespace VanCars.App_Code.DAL
{
    public class OrderDAL
    {
        public int Company { get; set; }
        public int PickupBranch { get; set; }
        public int ReturnBranch { get; set; }
        public string PickupDate { get; set; }
        public string ReturnDate { get; set; }
        public int CarId { get; set; } 
        public List<Extention> extetions { get; set; }   
        public searchBLL Search { get; set; }
        public person person { get; set; }

        public OrderDAL(int company,  int pickupBranch, int returnBranch, DateTime pickupDate, DateTime returnDate, int carId, List<Extention> extetions, searchBLL search, person person)
        {
            Company = company;
            PickupBranch = pickupBranch;
            ReturnBranch = returnBranch;
            PickupDate = GetDate(pickupDate);
            ReturnDate = GetDate(returnDate);
            CarId = carId;
            this.extetions = extetions;
            Search = search;
            this.person = person;
        }

        public List<string> CreateExtOrder()
        {
            string external = "{%%ExtId%%:5,%%Description%%:%%נהג נוסף%%}^{%%ExtId%%:8,%%Description%%:%%ביטול השתתפות עצמית%%}";
            this.extetions = GlobFuncs.addExt();
            bool ExtensionFlag = false;
            if (extetions.Count > 0)
                ExtensionFlag = true;
            var j = JsonConvert.SerializeObject(this);
            ExtOrder ext = new ExtOrder(this.person.IdNumber,this.person.FullName,this.person.PhoneNumber,this.person.PhoneNumber,this.person.LiccensNumber,this.PickupBranch,this.ReturnBranch, this.PickupDate,this.ReturnDate,this.CarId,18,external);
            string ApiAddress = GlobFuncs.GetApiAddress(this.Company, "OrderBll");
            string Json = JsonConvert.SerializeObject(ext);
            string a = GetApi.PostApi(Json, ApiAddress);
            List<string> ordNo = new List<string>();
            if (a != null)
            {
                a = a.Substring(1, a.Length - 2);
                ordNo.Add(a);
                string b = GlobFuncs.GetDetails(this.Company, this.CarId);
                CarDetails carDetails = new CarDetails();
                string[] arr = b.Split('#');
                string str = arr[0].Substring(2, arr[0].Length - 3).Replace("\\", "");
                carDetails = JsonConvert.DeserializeObject<CarDetails>(str);
                string pickBr = GlobFuncs.GetBranchName(this.PickupBranch, this.Company);
                string RetBr = GlobFuncs.GetBranchName(this.ReturnBranch,this.Company);
                DataBase db = new DataBase();
                string sql = "insert into OrderTable (CustomId,ExternalRentId,CarName,CarLevel,CompanyId,Seats,GearBox,EngineCapacity,Doors,Beags,PickupBranch,PickupBranchText,PickupDate,ReturnBranch,ReturnBranchText,ReturnDate,Status)values" +
                    " ('" + this.person.CustomId + "','" + a + "','" + carDetails.CarName + "','" + carDetails.CarLevel + "','" + this.Company + "','" + carDetails.Seats + "','" + carDetails.GearBox + "','" + carDetails.EngineCapacity + "','" + carDetails.Doors + "','" + carDetails.Baegs + "','" + this.PickupBranch + "','"+pickBr+"','" + this.PickupDate + "','" + this.ReturnBranch + "','"+RetBr+"','" + this.ReturnDate + "','In execution')";
                int SuccessFlag = db.ExecuteNonQuery(sql);
                if (SuccessFlag > 0)
                {
                    ordNo.Add(db.GetMaxId("OrderTable", "RentId").ToString());
                    return ordNo;
                }
                ordNo.Add("Error");
            }
            else
            {
                ordNo.Add("Error");
            }
            return ordNo;
        }
        public string GetDate(DateTime date)
        {
            string NewDate = date.ToString("yyyy-MM-dd");
            return NewDate;
        }
    }

    
}