using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BLL;
using Data;
using System.Data;
using VanCars.App_Code;





namespace DAL
{
    public class UserDAL
    {
        public int UserId { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public int City { get; set; }
        public string Id { get; set; }
        public string BirthDay { get; set; }
        public string LicenseNumber { get; set; }
        public int LicenseLevel { get; set; }
        public string Email { get; set; }
        public string DateOfIssuanceLicense { get; set; }
        public string Password { get; set; }
        public string Phone { get; set; }
        public string Temporary { get; set; }

        public UserDAL()
        {
            this.UserId = UserId;
            this.Name = Name;
            this.Address = Address;
            this.City = City;
            this.Id = Id;
            this.BirthDay = BirthDay;
            this.LicenseNumber = LicenseNumber;
            this.LicenseLevel = LicenseLevel;
            this.Email = Email;
            this.Password = Password;
            this.Phone = Phone;
            this.Temporary = Temporary;

        }

        public UserDAL(string Email, string Password)
        {
            this.Email = Email;
            this.Password = Password;
        }

        public person Login()
         {

            string sql = "select * from CustomersTable where Email = '" + this.Email + "' and Password = '" + this.Password + "'";
            DataBase db = new DataBase();
            DataTable dt = db.ExecuteReader(sql);
            person per = null;
            if (dt.Rows[0]["CustomId"] != null)
            {
                 per = new person((int)dt.Rows[0]["CustomId"],
                                       dt.Rows[0]["FullName"].ToString(),
                                       dt.Rows[0]["Email"].ToString());
                per.CustomId = (int)dt.Rows[0]["CustomId"];
                per.FullName = dt.Rows[0]["FullName"].ToString();
                per.LiccensNumber = dt.Rows[0]["LicenseNumber"].ToString();
                per.TelNumber = dt.Rows[0]["Phone"].ToString();
                per.PhoneNumber = dt.Rows[0]["Phone"].ToString();
            }
            return per;
        }

        public person RegUser(string TxtName, string TxtAddress, int TxtCity, string TxtId, string TxtDateOfBirth, string TxtLicenseNumber, int DdlLicensCode, string TxtDateOfIssuanceLicense,string Email,string Password,string Phone,string Temporary)
        {
            DataBase db = new DataBase();
            person per = new person();
            string sql = "insert into CustomersTable (FullName,Address,City,id,BirthDay,LicenseNumber,LicenseLevel,LicenseProductionDate,Email,Password,Phone,ForgetPass) values ('" + TxtName+"','"+TxtAddress+"','"+TxtCity+"','"+TxtId+"','"+TxtDateOfBirth+"','"+TxtLicenseNumber+"','"+DdlLicensCode+"','"+TxtDateOfIssuanceLicense+"','"+Email+"','"+Password+"','"+Phone+"','"+Temporary+"')";
            int RecCount = db.ExecuteNonQuery(sql);
            if (RecCount != 0)
            {
                sql= "select CustomId,FullName,Email from CustomersTable where Email = '"+Email+"'";
                DataTable dt = db.ExecuteReader(sql);
                per.CustomId = (int)dt.Rows[0]["CustomId"];
                per.FullName = dt.Rows[0]["FullName"].ToString();
                per.Email = dt.Rows[0]["Email"].ToString();
                per.IdNumber = TxtId;
                per.LiccensNumber = TxtLicenseNumber;
                per.TelNumber = Phone;
                per.PhoneNumber = Phone;
            }
            return per;
        }

        public void GetUsers()
        {
            DataBase db = new DataBase();
            DataTable dt = new DataTable();
            string sql = "select CustomId,FullName,Address,City,id,BirthDay,LicenseNumber,LicenseLevel,Email,Phone from CustomersTable where CustomId = " + this.UserId;
            dt = db.ExecuteReader(sql);
            this.Name = dt.Rows[0]["FullName"].ToString();
            this.Address = dt.Rows[0]["Address"].ToString();
            this.City = (int)dt.Rows[0]["City"];
            this.Id = dt.Rows[0]["id"].ToString();
            this.BirthDay = dt.Rows[0]["BirthDay"].ToString();
            this.LicenseNumber = dt.Rows[0]["LicenseNumber"].ToString();
            this.LicenseLevel = (int)dt.Rows[0]["LicenseLevel"];
            this.Email = dt.Rows[0]["Email"].ToString();
            this.Phone = dt.Rows[0]["Phone"].ToString();
            
            return;
        }
        public string saveChange()
        {
            DataBase db = new DataBase();
            string sql = "update CustomersTable set FullName = '" + this.Name + "' , Address = '" + this.Address + "', City = " + this.City + " , id = '" + this.Id + "' , BirthDay = '" + this.BirthDay + "' , LicenseNumber = '" + this.LicenseNumber + "' , LicenseLevel = " + this.LicenseLevel + " , LicenseProductionDate = '" + this.DateOfIssuanceLicense + "' , Phone = '" + this.Phone + "'  where CustomId = "+this.UserId;
            int success = db.ExecuteNonQuery(sql);
            if(success > 0)
            {
                return "success";
            }
            else
            {
                return "error";
            }
        }


    }
}