using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SearchBLL;
using VanCars.App_Code.BLL;
using Glob;
using Newtonsoft.Json;
using Data;

namespace VanCars.App_Code.DAL
{
    public class editOrderDal:OrderDAL
    {
        public int externalOrderId { get; set; }
        public int orderId { get; set; }

        public editOrderDal(int orderId, int externalOrderId, int company, int totalPrice, int pickupBranch, int returnBranch, DateTime pickupDate, DateTime returnDate, int carId, List<Extention> extetions, searchBLL search, person person, creaditCardBLL creaditCard,string notes) : base(company, totalPrice, pickupBranch, returnBranch, pickupDate, returnDate, carId, extetions, search, person, creaditCard,notes)
        {
            this.orderId = orderId;
            this.externalOrderId = externalOrderId;
        }
        public int editOrder()
        {
            string external = GlobFuncs.convertExtensionToString(this.extetions);
            editExtOrder ext = new editExtOrder(this.externalOrderId, this.person.IdNumber, this.person.FullName, this.person.PhoneNumber, this.person.PhoneNumber, this.person.LiccensNumber, this.PickupBranch, this.ReturnBranch, this.PickupDate, this.ReturnDate, this.CarId, 18, external, this.CreditCard.number, this.CreditCard.month, this.CreditCard.year, this.CreditCard.digitNo, this.CreditCard.ownerId,this.notes);
            string ApiAddress = GlobFuncs.GetApiAddress(this.Company, "editOrderBll");
            string Json = JsonConvert.SerializeObject(ext);
            string returnFlag =  GetApi.PostApi(Json, ApiAddress);
            if (returnFlag != 0.ToString())
            {
                string b = GlobFuncs.GetDetails(this.Company, this.CarId);
                CarDetails carDetails = new CarDetails();
                string[] arr = b.Split('#');
                string str = arr[0].Substring(2, arr[0].Length - 3).Replace("\\", "");
                carDetails = JsonConvert.DeserializeObject<CarDetails>(str);
                string pickBr = GlobFuncs.GetBranchName(this.PickupBranch, this.Company);
                string RetBr = GlobFuncs.GetBranchName(this.ReturnBranch, this.Company);
                DataBase db = new DataBase();
                string sql = "update OrderTable set creditCardId = '" + this.CreditCard.id + "' where RentId = " + this.orderId+ ";delete from ExtensInOrder where OrderId = " + this.orderId;
                db.ExecuteNonQuery(sql);
                if(this.extetions.Count > 0)
                {
                    sql = "insert into ExtensInOrder (OrderId,ExtentionId,description,price) values";
                    foreach (Extention extention in this.extetions)
                    {
                        sql += "(" + int.Parse(db.GetMaxId("OrderTable", "RentId").ToString()) + "," + extention.id + ",'" + extention.description + "'," + extention.Price + "),";
                    }
                    sql = sql.Substring(0, sql.Length - 1);
                    db.ExecuteNonQuery(sql);
                }
                return 1;
            }
            return 0;
        }
    }
}