using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VanCars.App_Code
{
    public class person
    {
        public int CustomId { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string IdNumber { get; set; }
        public string LiccensNumber { get; set; }
        public string TelNumber { get; set; }
        public string PhoneNumber { get; set; }

        public person(int CustomId,string FullName,string Email)
        {
            this.CustomId = CustomId;
            this.FullName = FullName;
            this.Email = Email;
        }

        public person()
        {
            this.CustomId = -1;
        }
    }
}