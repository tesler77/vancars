using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL;
using System.Web.ClientServices;
using VanCars.App_Code;

namespace BLL
{
    public class Users
    {
        public int UserId { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public int City { get; set; }
        public string Id { get; set; }
        public string BirthDay { get; set; }
        public string LicenseNumber { get; set; }
        public int LicenseLevel { get; set; }
        public string DateOfIssuanceLicense { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Phone { get; set; }
        public string Temporary { get; set; }

        public Users()
        {
            this.UserId = UserId;
            this.Name = Name;
            this.Address = Address;
            this.City = City;
            this.Id = Id;
            this.BirthDay = BirthDay;
            this.LicenseNumber = LicenseNumber;
            this.LicenseLevel = LicenseLevel;
            this.DateOfIssuanceLicense = DateOfIssuanceLicense;
            this.Email = Email;
            this.Password = Password;
            this.Phone = Phone;
            this.Temporary = Temporary;

        }

        public Users(int userId)
        {
            this.UserId = userId;
        }

        public Users(string Email, string Password)
        {
            this.Email = Email;
            this.Password = Password;
        }

        public Users(int UserId, string Name, string Address, int City, string Id, DateTime BirthDay, string LicenseNumber, int LicenseLevel,DateTime DateOfIssuanceLicense, string Email, string Password, string Phone)
        {
            this.UserId = UserId;
            this.Name = Name;
            this.Address = Address;
            this.City = City;
            this.Id = Id;
            this.BirthDay =GetDate(BirthDay);
            this.LicenseNumber = LicenseNumber;
            this.LicenseLevel = LicenseLevel;
            this.DateOfIssuanceLicense =GetDate(DateOfIssuanceLicense);
            this.Email = Email;
            this.Password = Password;
            this.Phone = Phone;
            Random rd = new Random();
            this.Temporary = rd.Next(1, 1000000).ToString();
        }
        public string GetDate(DateTime date)
        {
            string NewDate = date.ToString("yyyy-MM-dd");
            return NewDate;
        }
        public person Login()
        {
            UserDAL ud = new UserDAL(this.Email,this.Password);
            person pers = new person();
            pers = ud.Login();
            return pers;
        }

        public person RegUser()
        {
            UserDAL ud = new UserDAL();
            person per = new person();
            per = ud.RegUser(Name, Address, City, Id, BirthDay, LicenseNumber, LicenseLevel, DateOfIssuanceLicense, Email, Password, Phone,Temporary);
            return per;
        }

        public void GetPerson()
        {
            UserDAL ud = new UserDAL()
            {
                UserId = this.UserId
            };
            ud.GetUsers();
            this.UserId                 = ud.UserId;
            this.Name                   = ud.Name;
            this.Address                = ud.Address;
            this.City                   = ud.City;
            this.Id                     = ud.Id;
            this.BirthDay               = ud.BirthDay;
            this.LicenseNumber          = ud.LicenseNumber;
            this.LicenseLevel           = ud.LicenseLevel;
            this.DateOfIssuanceLicense  = ud.DateOfIssuanceLicense;
            this.Email                  = ud.Email;
            this.Phone                  = ud.Phone;


            return;
        }
        public void saveChange()
        {
            UserDAL ud = new UserDAL()
            {
                UserId                  = this.UserId,
                Name                    = this.Name,
                Address                 = this.Address,
                City                    = this.City,
                Id                      = this.Id,
                BirthDay                = this.BirthDay,
                LicenseNumber           = this.LicenseNumber,
                LicenseLevel            = this.LicenseLevel,
                DateOfIssuanceLicense   = this.DateOfIssuanceLicense,
                Email                   = this.Email,
                Phone                   = this.Phone,
            };
            string success = ud.saveChange();
        }
        


    }
}