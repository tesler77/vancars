using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VanCars.App_Code;
using BLL;

namespace WebApplication2
{
    public partial class MainMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                person per = new person();
                per = (person)Session["Person"];
                if (per != null)
                {
                    Users users = new Users(per.CustomId);
                    guest.InnerHtml = "שלום " + per.FullName +" "+ users.getUserRole();
                }
            
            }

        }

        protected void disconnectClick(object sender, EventArgs e)
        {
            Session["Person"] = null;
            guest.InnerHtml = "שלום אורח";
            Response.Redirect("reg.aspx");

        }

        protected void dis_Click(object sender, EventArgs e)
        {

        }
    }
}