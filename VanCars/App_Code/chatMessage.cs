using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Data;

namespace VanCars.App_Code
{
    public class chatMessage
    {
        public int id { get; set; }
        public int customerId { get; set; }
        public int orderId { get; set; }
        public int customersMessage { get; set; }
        public string messageText { get; set; }

        public int addMessage()
        {
            DataBase db = new DataBase();
            string sql = "insert into chathTable (customerId,orderId,customersMessage,messageText) values (" + this.customerId + "," + this.orderId + "," + this.customersMessage + ",'" + this.messageText + "')";
            int ret = db.ExecuteNonQuery(sql);
            if(ret > 0)
            {
                ret = db.GetMaxId("chathTable", "id");
            }
            this.id = ret;
            return ret;
        }
    }
}