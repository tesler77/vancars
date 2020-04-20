using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VanCars.App_Code;
using Glob;

namespace VanCars
{

    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(! IsPostBack) {
                
            }
        }

        protected void BtnSend_Click(object sender, EventArgs e)
        {
            bool send = GlobFuncs.UpdateDb("Contuct", "email,subject,details", "'"+TxtEmail.Text.ToString() + "','"+TxtSubject.Text.ToString()+"','" + TxtMsg.Text.ToString() + "'");
            if(send == true) {
                GlobFuncs.SendEmail(TxtEmail.Text.ToString(), "התקבלה פניה במערכת vancars", "<h1>שלום " + TxtName.Text.ToString() + "</h1><h1>פנייתך נשלחה למערכת vancars</h1><br/><h4>להלן פרטי הפנייה שנשלחו אלינו</h4><br/>" + TxtMsg.Text.ToString());
            }
            else {
                ltlJs.Text = "<script>alert('התרחשה שגיאה בעת שליחת הפניה נא נסה שוב מאוחר יותר')</script>";
            }
            
        }
    }
}