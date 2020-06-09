using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Glob;
using BLL;
using VanCars.App_Code;

namespace VanCars
{
    public partial class login : System.Web.UI.Page
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
                if (persn.CustomId > 0)
                {
                    Session["Person"] = persn;
                    if (Session["orderQuery"] != null)
                    {
                        string sourceString = Session["orderQuery"].ToString();
                        if (sourceString.Contains("order.aspx"))
                        {
                            Response.Redirect(sourceString);
                        }
                    }
                    Response.Redirect("PrivateArea.aspx");

                }
                else if (persn.CustomId == -2) { LtlMsg.Text = "<script> alert('סיסמה שגויה')</script>"; }
                else if (persn.CustomId == -3) { LtlMsg.Text = "<script> alert('שם משתמש שגוי')</script>"; }
                else { LtlMsg.Text = "<script> alert('לקוח חסום - נא לפנות לתמיכה')</script>"; }
            }
            else
            {
                LtlMsg.Text = "<script> alert('הזנת סיסמה שגויה /n נא נסה שוב')</script>";
                TextBox2.Focus();
            }

        }
    }
}