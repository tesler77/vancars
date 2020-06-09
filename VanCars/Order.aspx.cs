using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VanCars.App_Code.BLL;
using SearchBLL;
using VanCars.App_Code;
using Glob;
using System.Data;
using Newtonsoft.Json;
using System.Collections.Specialized;

namespace VanCars
{
    public partial class Order : System.Web.UI.Page
    {
        string Company;
        string Car;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                person per = new person();
                per = (person)Session["person"];
                if (per == null)
                {
                    Session["orderQuery"] = Request.RawUrl;
                    Response.Redirect("login.aspx");
                }

                Company = (string)Request["Comapny"];
                Car = (string)Request["CarId"];
                string tot = GetOrder();
                string[] arr = GetTemplate(Company, int.Parse(Car)).Split('#');
                LtlMsg.Text = "<script>var temp = JSON.parse(" + arr[0] + "\")\n var search = " + JsonConvert.SerializeObject((searchBLL)Session["search"]) + "</script>";
                LtlMsg1.Text = "<script>var extention = JSON.parse(\"" + arr[1] + ")</script>";
                LtlMsg2.Text = "<script>var cards = " + GetCreditCards() + "</script>";
                List<Extention> extentions = new List<Extention>();
                string ext = arr[1].Replace("\\", "");
                ext = ext.Substring(0, ext.Length - 1);
                DataTable table = new DataTable();
                table = JsonConvert.DeserializeObject<DataTable>(ext);
                foreach(DataRow row in table.Rows)
                {
                    extentions.Add(new Extention(int.Parse(row["id"].ToString()), row["description"].ToString(),int.Parse(row["Price"].ToString())));
                }
                rptExt.DataSource = extentions;
                rptExt.DataBind();
                CreateYearList();
            }
            else
            {
                Company = "4";
                Car = (string)Request["CarId"];
            }
        }
        private string GetTemplate(string Company, int id)
        {
            carBLL carBLL = new carBLL(Company, id);
            string data = carBLL.GetDetail();
            //data = data.Replace("}", ",\\\"Days\\\":" + GetOrder() + "}");
            return data;
        }
        public string GetOrder()
        {
            searchBLL search = (searchBLL)Session["search"];
            DateTime from = DateTime.Parse(search.PickupDate);
            DateTime ret = DateTime.Parse(search.ReturnDate);
            double tot = (ret - from).TotalDays;
            return tot.ToString();
        }
        public string GetCreditCards()
        {
            person per = new person();
            per = (person)Session["Person"];
            string list = GlobFuncs.GetCreditCards(per.CustomId);
            return list;
        }
        private void CreateYearList()
        {
            List<Year> years = new List<Year>();
            years = GlobFuncs.GetYearList();
            YearDdl.DataSource = years;
            YearDdl.DataTextField = "year";
            YearDdl.DataValueField = "value";
            YearDdl.DataBind();
        }

        protected void BtnOrder_Click(object sender, EventArgs e)
        {
            if (TxtOrdName.Text.Length < 1)
            {
                ltlAlert.Text = "<script>alert('שם פרטי ושם משפחה הינו שדה חובה')</script>";
                TxtOrdName.Focus();
            }
            else if (TxtOrdEmail.Text.Length < 1)
            {
                ltlAlert.Text = "<script>alert('כתובת אימייל הינו שדה חובה')</script>";
            }
            else
            {
                string cardId;
                if (hdnCard.Value == "-1")
                {
                    person person = new person();
                    person = (person)Session["person"];
                    creaditCardBLL creaditCard = new creaditCardBLL()
                    {
                        number = TxtCard.Text.ToString(),
                        month = monthDdl.SelectedValue.ToString(),
                        year = YearDdl.SelectedValue.ToString(),
                        digitNo = TxtCvv.Text.ToString(),
                        ownerId = TxtId.Text.ToString(),
                        customerId = person.CustomId
                    };
                    cardId = creaditCard.AddCard();
                }
                else
                {
                    cardId = hdnCard.Value;
                }
                Session["selectedExt"] = hdnSelectedExt.Value;
                Response.Redirect("OrderConfirmation.aspx?Company=" + Company + "&CarId=" + Car+"&card="+cardId);
            }
        }
    }
}