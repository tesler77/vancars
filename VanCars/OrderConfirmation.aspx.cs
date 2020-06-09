using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VanCars.App_Code;
using SearchBLL;
using VanCars.App_Code.DAL;
using Newtonsoft.Json;
using System.Data;
using Newtonsoft.Json.Linq;
using VanCars.App_Code.BLL;
using System.Web.Script.Serialization;
using Glob;



namespace VanCars
{
    public class temp
    {
        public int CarId { get; set; }
        public int CarLevel { get; set; }
    }
    public partial class OrderConfirmation : System.Web.UI.Page
    {
        string Company;
        string Car;
        string creditCardId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                person person = (person)Session["person"];
                searchBLL search = (searchBLL)Session["search"];
                List<Extention> extention = new List<Extention>();
                Company = Request["Company"];
                Car = Request["CarId"];
                creditCardId = Request["card"];
                carDAL carDAL = new carDAL(Company, int.Parse(Car));
                CarDetails carDetails = new CarDetails();
                creaditCardBLL creditCard = new creaditCardBLL();
                creditCard.getCardDetails(creditCardId);
                string[] arr = carDAL.GetDetails().Split('#');
                string str = arr[0].Substring(2, arr[0].Length - 3).Replace("\\","");
                carDetails = JsonConvert.DeserializeObject<CarDetails>(str);
                extention = GlobFuncs.convertExtensionToList(Session["selectedExt"].ToString());
                OrderBLL order = new OrderBLL(int.Parse(Company),  int.Parse(search.PickupLocation), int.Parse(search.ReturnLocarion), DateTime.Parse(search.PickupDate), DateTime.Parse(search.ReturnDate), int.Parse(Car), extention, search, person,creditCard);
                List<string> OrderId = order.CreateOrder();
                string o = "";
                int num = 1;
                foreach(string i in OrderId)
                {
                    o += "var a" + num + " = " + i +";";
                    num++;
                }
                Order.Text = "<script>var or = " + JsonConvert.SerializeObject(order) + "\n var car = JSON.parse("+ arr[0] +"\") \n var companys = "+ Application["Companys"] +"\n "+o+"</script>";
                DataTable dtAdr = new DataTable();
                dtAdr = GlobFuncs.GetFullAddress(person.CustomId);
                LtlOrdId.Text = OrderId[0];
                LtlName.Text = person.FullName;
                LtlPhone.Text = person.PhoneNumber;
                LtlEmail.Text = person.Email;
                LtlAddress.Text = dtAdr.Rows[0]["Address"] +" "+ dtAdr.Rows[0]["CityName"].ToString();
                GlobFuncs.SendEmail(person.Email, "אישןר ביצוע הזמנה מס' " + OrderId, "");
                sendMessages(person.CustomId, OrderId[1], person.FullName);
                
            }
            
        }

        private void sendMessages(int customerId,string orderId ,string name)
        {
            chatMessage message = new chatMessage(customerId, int.Parse(orderId), 0, " היי " + name + " , ");
            message.addMessage();
            message.messageText = " הזמנתך שמספרו הוא " + orderId + " בוצעה בהצלחה ";
            message.addMessage();
        }
    }
}