using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VanCars.App_Code
{
    public class custom
    {
        private int CustomId { get; set; }
        private string FullName { get; set; }

        public custom(int CustomId,string FullName)
        {
            this.CustomId = CustomId;
            this.FullName = FullName;
        }
    }

    
}