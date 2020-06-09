using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using Newtonsoft.Json;
using System.Data;
using Glob;
using Data;
using VanCars.App_Code;
using SearchBLL;

namespace WebApplication2
{
    public partial class results : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                getJson();
            }
        }



        protected void getJson()
        {
            searchBLL search = (searchBLL)Session["search"];
            if (search.PickupDate.Contains("/"))
            {
                search.PickupDate = search.PickupDate.Substring(0, 10);
                search.ReturnDate = search.ReturnDate.Substring(0, 10);
                string pickdate = search.PickupDate.Substring(6, 4);
                string retdate = search.ReturnDate.Substring(6, 4);
                pickdate = pickdate + "-";
                retdate = retdate + "-";
                pickdate = pickdate + search.PickupDate.Substring(0, 2);
                retdate = retdate + search.ReturnDate.Substring(0, 2);
                pickdate = pickdate + "-";
                retdate = retdate + "-";
                pickdate = pickdate + search.PickupDate.Substring(3, 2);
                retdate = retdate + search.ReturnDate.Substring(3, 2);
                search.PickupDate = pickdate;
                search.ReturnDate = retdate;
            }
            string ret = search.GetList();
            LtlMsg.Text = "<script>var cars=JSON.parse(" + ret + ")\n var companys = " + GlobFuncs.GetCompanyList() + "</script>";
            DdlPickupLocation.DataSource = GlobFuncs.GetDDL("CityTable", "CityId", "CityName");
            DdlPickupLocation.DataTextField = "name";
            DdlPickupLocation.DataValueField = "id";
            DdlPickupLocation.DataBind();
            DdlPickupLocation.SelectedValue = search.PickupLocation;
            DdlReturnLocation.DataSource = GlobFuncs.GetDDL("CityTable", "CityId", "CityName");
            DdlReturnLocation.DataTextField = "name";
            DdlReturnLocation.DataValueField = "id";
            DdlReturnLocation.DataBind();
            DdlReturnLocation.SelectedValue = search.ReturnLocarion;
            string date = search.PickupDate + " - " + search.ReturnDate;
            ReturnDate.Text = date.Substring(5, 2) + "/" + date.Substring(8, 2) + "/" + date.Substring(0, 4) + " - " + date.Substring(18, 2) + "/" + date.Substring(21, 2) + "/" + date.Substring(13, 4);
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            if (DdlPickupLocation.SelectedValue == "-1")
            {
                CreateAlert("נא הזן סניף לקיחת רכב");
                DdlPickupLocation.Focus();
            }
            else if (DdlReturnLocation.SelectedValue == "-1")
            {
                CreateAlert("נא הזן סניף החזרת רכב");
                DdlReturnLocation.Focus();
            }
            else if (ReturnDate.Text.Length <= 10)
            {
                CreateAlert("נא הזן תאריך החזרת רכב");
                ReturnDate.Focus();
            }
            else
            {
                person per = new person();
                Session["search"] = new searchBLL(DdlPickupLocation.Text.ToString(), ReturnDate.Text.ToString().Substring(0, 10), DdlReturnLocation.Text.ToString(), ReturnDate.Text.ToString().Substring(13));
                Response.Redirect("results.aspx");
            }
        }
        private void CreateAlert(string text)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('" + text + "')", true);
        }
    }
}