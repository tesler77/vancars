using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
//using System.Web.UI.WebControls;
using Glob;
using Data;
using SearchBLL;
using VanCars.App_Code;




namespace WebApplication2
{
    public partial class search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetDdlCitys();
                
            }
        }

        private void GetDdlCitys()
        {
            DdlPickupLocation.DataSource = GlobFuncs.GetDDL("CityTable", "CityId", "CityName");
            DdlPickupLocation.DataTextField = "name";
            DdlPickupLocation.DataValueField = "id";
            DdlPickupLocation.DataBind();
            DdlReturnLocation.DataSource = GlobFuncs.GetDDL("CityTable", "CityId", "CityName");
            DdlReturnLocation.DataTextField = "name";
            DdlReturnLocation.DataValueField = "id";
            DdlReturnLocation.DataBind();
        }
        public void CreateSearch()
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
            else if(PickupDate.Text.Length <= 10)
            {
                CreateAlert("נא הזן תאריך לקיחת רכב");
                PickupDate.Focus();
            }
            else if(ReturnDate.Text.Length <= 10)
            {
                CreateAlert("נא הזן תאריך החזרת רכב");
                ReturnDate.Focus();
            }
            else
            {                
                person per = new person();
                Session["search"] = new searchBLL(DdlPickupLocation.Text.ToString(), PickupDate.Text.ToString(), DdlReturnLocation.Text.ToString(), ReturnDate.Text.ToString());
                Response.Redirect("results.aspx");
            }

        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            if(Session["person"] != null)
            {
                CreateSearch();
            }
            else
            {      
                
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "PopUp", "ShowLoginModal()", true);
            }
        }

        private void CreateAlert(string text)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('"+text+"')", true);
        }

    }
}