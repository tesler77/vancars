using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VanCars.App_Code;

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
                    LtlHeader.Text = "שלום " + per.FullName+", משתמש";
                }
            }

        }
    }
}