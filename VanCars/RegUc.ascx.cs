using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Glob;
using BLL;
using VanCars.App_Code;
using WebApplication2;

namespace VanCars
{
    public partial class RegUc : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string pass = GlobFuncs.Hash(TextBox2.Text.ToString());
            Users us = new Users(TextBox1.Text.ToString(), pass);
            person persn = new person();
            persn = us.Login();

            if (persn != null)
            {
                Session["Person"] = persn;

                string path = HttpContext.Current.Request.Url.AbsolutePath;

                if(path == "/reg.aspx")
                {
                    Response.Redirect("search.aspx");
                }
                else if(path == "/search.aspx")
                {                   
                    Visible = false;
                    Button b = this.Parent.FindControl("BtnSearch") as Button;
                    
                }

            }
            else
            {
                LtlMsg.Text = "<script> alert('הזנת סיסמה שגויה /n נא נסה שוב')</script>";
                TextBox2.Focus();
            }
        }
            protected void LinkForget_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgetPassword.aspx");
        }
    }
}