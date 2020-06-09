using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Glob;
using VanCars;
using System.Data;
using Data;

namespace VanCars.App_Code.DAL
{
    public class creditCardDAL
    {
        public string id { get; set; }
        public string number { get; set; }
        public string month { get; set; }
        public string year { get; set; }
        public string digitNo {get;set;}
        public string ownerId {get;set;}
        public int customerId { get; set; }

        public string addCard()
        {
            this.number = GlobFuncs.EncryptString(this.number, "b1bbc4ca589133e2e8a4e4a2315a1916");
            DataBase db = new DataBase();
            string sql = "insert into CreditCardsTable(id,Number,month,year,DigitNo,OwnerId,CustomerId) " +
                "values ('" + this.id + "','" + this.number + "','" + this.month + "','" + this.year + "','" + this.digitNo + "','" + this.ownerId + "'," + this.customerId + ")";
            int success = db.ExecuteNonQuery(sql);
            if(success > 0)
            {
                return this.id;
            }
            else
            {
                return "error";
            }

        }

        public List<creditCardDAL> getCards()
        {
            DataBase db = new DataBase();
            creditCardDAL cardItem;
            List<creditCardDAL> cardsList = new List<creditCardDAL>();
            DataTable dt = new DataTable();
            string sql = "select id,Number,month,year,DigitNo,OwnerId,CustomerId from CreditCardsTable where CustomerId = " + this.customerId;
            dt = db.ExecuteReader(sql);
            if(dt.Rows.Count > 0)
            {
                for(int i = 0; i < dt.Rows.Count; i++)
                {
                    cardsList.Add(cardItem = new creditCardDAL()
                    {
                        id = dt.Rows[i]["id"].ToString(),
                        number = GlobFuncs.decription(dt.Rows[i]["Number"].ToString(), "b1bbc4ca589133e2e8a4e4a2315a1916"),
                        month = dt.Rows[i]["month"].ToString(),
                        year = dt.Rows[i]["year"].ToString(),
                        digitNo = dt.Rows[i]["DigitNo"].ToString(),
                        ownerId = dt.Rows[i]["OwnerId"].ToString(),

                    } ) ;
                }
                return cardsList;
            }
            return cardsList;
        }
        public int updateCard()
        {
            this.number = GlobFuncs.EncryptString(this.number, "b1bbc4ca589133e2e8a4e4a2315a1916");
            string sql = "update CreditCardsTable set Number = '" + this.number + "',month =  '" + this.month + "', year = '" + this.year + "', DigitNo = '" + this.digitNo + "' where id = '" + this.id + "'";
            DataBase db = new DataBase();
            return db.ExecuteNonQuery(sql);
        }
        public int deleteCard()
        {
            string sql = "delete from CreditCardsTable where id = '" + this.id + "'";
            DataBase db = new DataBase();
            return db.ExecuteNonQuery(sql);
        }

        public void getCardDetails()
        {
            string sql = "select * from CreditCardsTable where id = '" + this.id+"'";
            DataBase dataBase = new DataBase();
            DataTable dataTable = dataBase.ExecuteReader(sql);
            if(dataTable.Rows.Count == 0)
            {
                this.id = "-1";
                return ;
            }
            else
            {
                DataRow row = dataTable.Rows[0];
                this.id = row["id"].ToString();
                this.number = GlobFuncs.decription( row["number"].ToString(), "b1bbc4ca589133e2e8a4e4a2315a1916");
                this.month = row["month"].ToString();
                this.year = row["year"].ToString();
                this.digitNo = row["digitNo"].ToString();
                this.ownerId = row["ownerId"].ToString();
                return ;
            }
        }
    }
}