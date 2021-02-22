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
                Company = Request["Company"];
                Car = Request["CarId"];
                creditCardId = Request["card"];
                if (Car == null || Company == null || creditCardId == null || Session["search"] == null || Session["selectedExt"] == null || Session["person"] == null)
                {
                    Response.Redirect("search.aspx");
                }
                person person = (person)Session["person"];
                searchBLL search = (searchBLL)Session["search"];
                List<Extention> extention = new List<Extention>();
                carDAL carDAL = new carDAL(Company, int.Parse(Car));
                CarDetails carDetails = new CarDetails();
                creaditCardBLL creditCard = new creaditCardBLL();
                creditCard.getCardDetails(creditCardId);
                string[] arr = carDAL.GetDetails().Split('#');
                string str = arr[0].Substring(2, arr[0].Length - 3).Replace("\\", "");
                carDetails = JsonConvert.DeserializeObject<CarDetails>(str);
                extention = GlobFuncs.convertExtensionToList(Session["selectedExt"].ToString());
                int totalPrice = int.Parse(Session["totPrice"].ToString());
                double orderId;
                OrderBLL order = new OrderBLL(int.Parse(Company), totalPrice, int.Parse(search.PickupLocation), int.Parse(search.ReturnLocarion), DateTime.Parse(search.PickupDate), DateTime.Parse(search.ReturnDate), int.Parse(Car), extention, search, person, creditCard,Session["notes"].ToString());
                if (Request["id"] == null)
                {
                    List<string> OrderId = order.CreateOrder();
                    string o = "";
                    int num = 1;
                    foreach (string i in OrderId)
                    {
                        o += "var a" + num + " = " + i + ";";
                        num++;
                    }
                    Order.Text = "<script>var or = " + JsonConvert.SerializeObject(order) + "\n var car = JSON.parse(" + arr[0] + "\") \n var companys = " + Application["Companys"] + "\n " + o + "</script>";
                    GlobFuncs.SendEmail(person.Email, "אישןר ביצוע הזמנה מס' " + OrderId[1], "");
                    sendMessages(person.CustomId, OrderId[1], person.FullName);
                    LtlOrdId.Text = OrderId[0];
                }
                else
                {
                    double o = double.Parse(Request["id"]);
                    orderId = o / 1825.8976;
                    editOrderBll editOrder = new editOrderBll(int.Parse(Company), totalPrice, int.Parse(search.PickupLocation), int.Parse(search.ReturnLocarion), DateTime.Parse(search.PickupDate), DateTime.Parse(search.ReturnDate), int.Parse(Car), extention, search, person, creditCard, orderId.ToString(),Session["notes"].ToString());
                    int retOrder = editOrder.editOrder();
                    LtlOrdId.Text = orderId.ToString();
                    Order.Text = "<script> var or = " + JsonConvert.SerializeObject(order) + "\n var car = JSON.parse(" + arr[0] + "\") \n var companys = " + Application["Companys"] + "\n var a1 = " + orderId + "\n var a2 = " + GlobFuncs.getExtenalOrderIdByOrderId(int.Parse(orderId.ToString())) + "</script>";
                    LtlOrdId.Text = orderId.ToString();
                }
                DataTable dtAdr = new DataTable();
                dtAdr = GlobFuncs.GetFullAddress(person.CustomId);
                LtlName.Text = person.FullName;
                LtlPhone.Text = person.PhoneNumber;
                LtlEmail.Text = person.Email;
                LtlAddress.Text = dtAdr.Rows[0]["Address"] + " " + dtAdr.Rows[0]["CityName"].ToString();
                Session["search"] = null;
                Session["orderQuery"] = null;
                Session["selectedExt"] = null;
                if (Request["id"] != null)
                {
                    Response.Redirect("PrivateArea.aspx");
                }

            }

        }

        private void sendMessages(int customerId, string orderId, string name)
        {
            chatMessage message = new chatMessage(customerId, int.Parse(orderId), 0, " היי " + name + " , ");
            message.addMessage();
            message.messageText = " הזמנתך שמספרו הוא " + orderId + " בוצעה בהצלחה ";
            message.addMessage();
        }
    }
}