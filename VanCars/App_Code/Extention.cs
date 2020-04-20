using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VanCars.App_Code
{
    public class Extention
    {
        public int Id { get; set; }
        public string Description { get; set; }

        public Extention(int id, string description)
        {
            Id = id;
            Description = description;
        }
    }
}