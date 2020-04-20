using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Glob
{
    public class Item
    {


        public int Id { get; set; }
        public string name { get; set; }

        public Item(int id, string name)
        {
            this.Id = id;
            this.name = name;
        }


    }
}