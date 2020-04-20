using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VanCars.App_Code.DAL;
using Glob;

namespace VanCars.App_Code.BLL
{
    public class creaditCardBLL
    {
        public string id { get; set; }
        public string number { get; set; }
        public string month { get; set; }
        public string year { get; set; }
        public string digitNo { get; set; }
        public string ownerId { get; set; }
        public int customerId { get; set; }

        public string AddCard()
        {
            creditCardDAL card = new creditCardDAL()
            {
                id = this.id,
                number = this.number,
                month = this.month,
                year = this.year,
                digitNo = this.digitNo,
                ownerId = this.ownerId,
                customerId = this.customerId
            };
            return card.addCard();
        }
        public List<creditCardDAL> getCards()
        {
            creditCardDAL creditCard = new creditCardDAL()
            {
                customerId = this.customerId
            };
            List<creditCardDAL> cardList = new List<creditCardDAL>();
            cardList = creditCard.getCards();
            foreach(creditCardDAL credit in cardList)
            {
                credit.number = credit.number.Substring(credit.number.Length - 4, 4) + " - **** - **** - ****";
            }
            return cardList;
        }
        public int updateCard()
        {
            creditCardDAL creditCard = new creditCardDAL()
            {
                id = this.id,
                number = this.number,
                month = this.month,
                year = this.year,
                digitNo = this.digitNo
            };
            return creditCard.updateCard();
        }

        public int deleteCard()
        {
            creditCardDAL creditCard = new creditCardDAL()
            {
                id = this.id
            };
            return creditCard.deleteCard();
        }
        
    }
}