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
            if (!IsPostBack)
            {

            }
        }

        protected void BtnSend_Click(object sender, EventArgs e)
        {
            try
            {

                GlobFuncs.SendEmail(TxtEmail.Text.ToString(), "התקבלה פניה במערכת vancars", "<div style=\"text-align:center\"><h1>שלום " + TxtName.Text.ToString() + "</h1><h1>פנייתך נשלחה למערכת vancars</h1><br/><h4>להלן פרטי הפנייה שנשלחו אלינו</h4><br/>" + TxtMsg.Text.ToString()+"</br><h4>אנו נעשה כמיטב יכולתינו לטפל בפנייתך בהקדם</h4></div>");
                GlobFuncs.SendEmail("pa8501100@gmail.com", "התקבלה פניה מאת " + TxtName.Text.ToString() + " בנושא " + TxtSubject.Text.ToString(), "<div style=\"text-align:center\">" +  TxtMsg.Text.ToString() + "</div>");
                showErrorMwssage(2010, "");
            }
            catch (Exception Ex)
            {
                showErrorMwssage(0, Ex.Message);
            }
        }

        private void showErrorMwssage(int id, string message)
        {
            if (id == 0)
            {

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "messgae", "showModalMessage('" + message + "')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "messgae", "showModalMessage('" + GlobFuncs.getErrorText(id) + "')", true);

            }
        }
    }
}