using Glob;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VanCars.App_Code;

namespace VanCars
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        private static string TimingPass { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void BtnForget_Click(object sender, EventArgs e)
        {
            if (TxtForget.Text == null)
            {
                TxtForget.Focus();
            }
            else
            {
                TimingPass = GlobFuncs.ForgetPass(TxtForget.Text.ToString());
                TxtTemporary.Visible = true;
                LtlMsg.Visible = true;
                BtnGo.Visible = true;
                //GlobFuncs.SendEmail(TxtForget.Text.ToString(), "שחזור סיסמה ממערכת VanCar", "הקוד הזמני הוא: " + TimingPass.ToString());
                GlobFuncs.SendEmail(TxtForget.Text.ToString(), "שחזור סיסמה ממערכת VanCar", "<h1>התקבלה בקשה לשחזור סיסמתך במערכת vancars</h1> <h3>הקוד לשחזור הסיסמה הוא:"+ TimingPass.ToString() + "</h3>");
            }
        }

        protected void BtnGo_Click(object sender, EventArgs e)
        {   
            if(TxtTemporary.Text.ToString() == TimingPass)
            {
                pass.Visible = true;
                pass2.Visible = true;
                LtlMsg2.Visible = true;
                Msg2.Visible = false;
                BtnChange.Visible = true;
                LtlMsg.Visible = false;
                TxtForget.Visible = false;
                BtnForget.Visible = false;
                TxtTemporary.Visible = false;
                BtnGo.Visible = false;
                Msg3.Visible = false;
                LtlMsg2.Text = " משתמש " + TxtForget.Text.ToString() + " נא הזן סיסמה חדשה ";
            }
            

        }

        protected void BtnChange_Click(object sender, EventArgs e)
        {
            if (pass.Text != pass2.Text)
            {
                Msg3.Visible = true;
                Msg3.Text = "אימות סיסמה נכשל נא הזן שוב אימות סיסמה";
                pass2.Focus();
            }
            else
            {
                bool b = GlobFuncs.UpdateDB("CustomersTable", "Password", pass.Text.ToString(), "Email", TxtForget.Text.ToString());
                if(b == true)
                {
                    person per = new person();
                    Session["Person"] = per;
                    Response.Redirect("index.aspx");
                    per = (person)Session["Person"];
                }
                else
                {
                    Msg3.Text = "התרחשה שגיאה בעת עדכון הסיסמה, נא נסה שנית";
                }
            }
            
        }
    }
}