﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VanCars.App_Code;


namespace VanCars
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                person per = new person();
                per = (person)Session["Person"];
                LtlMsg.Text = " שלום" + per.FullName;
            }

        }
    }
}