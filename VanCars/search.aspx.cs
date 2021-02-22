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
                showErrorMwssage(2006);
            }
            else if (DdlReturnLocation.SelectedValue == "-1")
            {
                showErrorMwssage(2007);
            }
            else if(ReturnDate.Text.Length <= 10)
            {
                showErrorMwssage(2008);
            }
            else
            {                
                Session["search"] = new searchBLL(DdlPickupLocation.Text.ToString(), ReturnDate.Text.ToString().Substring(0,10), DdlReturnLocation.Text.ToString(), ReturnDate.Text.ToString().Substring(13));
            }

        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            CreateSearch();
            if (Session["person"] != null)
            {
                person per = (person)Session["person"];
                GlobFuncs.addSearch(ReturnDate.Text.ToString().Substring(0, 10), ReturnDate.Text.ToString().Substring(13), DdlPickupLocation.Text.ToString(), DdlReturnLocation.Text.ToString(), per.CustomId);                
            }
            Response.Redirect("results.aspx");

        }

        private void CreateAlert(string text)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('"+text+"')", true);
        }

        private void showErrorMwssage(int id)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "messgae", "showModalMessage('" + GlobFuncs.getErrorText(id) + "')", true);
        }

    }
}