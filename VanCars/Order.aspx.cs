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
using System.Collections.Specialized;

namespace VanCars
{
    public partial class Order : System.Web.UI.Page
    {
        string Company;
        string Car;
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (!IsPostBack) {
                Company = (string)Request["Comapny"];
                Car = (string)Request["CarId"];
                string tot = GetOrder();
            string[] arr = GetTemplate(Company, int.Parse(Car)).Split('#');
            LtlMsg.Text ="<script>var temp = JSON.parse(" +arr[0]+ "\")</script>";
            LtlMsg1.Text ="<script>var extention = JSON.parse(\"" +arr[1]+ ")</script>";
            LtlMsg2.Text = "<script>var cards = " + GetCreditCards() + "</script>";
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
            data = data.Replace("}", ",\\\"Days\\\":" + GetOrder() + "}");            
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
            Response.Redirect("OrderConfirmation.aspx?Company="+Company+"&CarId="+Car);
        }
    }
}