using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VanCars.App_Code
{
    public class Extention
    {
        public int id { get; set; }
        public string description { get; set; }
        public int Price { get; set; }


        public Extention(int id, string description, int price)
        {
            this.id = id;
            this.description = description;
            Price = price;
        }
        public Extention(int id, string description)
        {
            this.id = id;
            this.description = description;
        }
    }
}