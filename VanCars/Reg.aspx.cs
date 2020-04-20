using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlTypes;
using Glob;
using BLL;
using VanCars.App_Code;
using System.Data;


namespace WebApplication2
{
    public partial class Reg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack) {
                GetCityList();
                GetLicenseCode();
                
            }
        }
        private void GetCityList() {
            TxtCity.DataSource = GlobFuncs.GetDDL("CityTable", "CityId", "CityName");
            TxtCity.DataTextField = "name";
            TxtCity.DataValueField = "id";
            TxtCity.DataBind();            

        }
        private void GetLicenseCode()
        {
            DdlLicensCode.DataSource = GlobFuncs.GetDDL("LicenseLevelTable", "LicenseId", "LicenseName");
            DdlLicensCode.DataTextField = "name";
            DdlLicensCode.DataValueField = "id";
            DdlLicensCode.DataBind();
        }

        protected void BtnReg_Click(object sender, EventArgs e)
        {
            if (TxtCity.SelectedValue == "-1")
            {
                LtlMsg.Text = "<script> alert('נא בחר עיר')</script>";
                TxtCity.Focus();
            }
            else if (DdlLicensCode.SelectedValue == "-1")
            {
                LtlMsg.Text = "<script> alert('נא בחר דרגת רישיון')</script>";
                DdlLicensCode.Focus();
            }
            else {           
                if(GlobFuncs.IsExist(TxtEmail.Text.ToString()) == true)
                {
                    LtlMsg.Text = "<script> alert('כבר קיים משתמש עם אותו כתובת אימייל')</script>";
                    TxtEmail.Focus();
                }
                else if(checkbox1.Checked != true)
                {
                    LtlMsg.Text = "<script> alert('נא אשר את התקנון')</script>" ;
                } 
                else if(TxtName.Text.Length == 0) {
                    LtlMsg.Text = "<script> alert('נא הזן שם')</script>";
                    TxtName.Focus();
                }
                else if (TxtAddress.Text.Length == 0)
                {
                    LtlMsg.Text = "<script> alert('נא הזן כתובת')</script>";
                    TxtAddress.Focus();
                }
                else if (TxtId.Text.Length == 0)
                {
                    LtlMsg.Text = "<script> alert('נא הזן מספר זהות')</script>";
                    TxtId.Focus();
                }
                else if (TxtDateOfBirth.Text.Length == 0)
                {
                    LtlMsg.Text = "<script> alert('נא הזן תאריך לידה')</script>";
                    TxtDateOfBirth.Focus();
                }
                else if (TxtLicenseNumber.Text.Length == 0)
                {
                    LtlMsg.Text = "<script> alert('נא הזן מספר רישיון')</script>";
                    TxtLicenseNumber.Focus();
                }
                else if (TxtDateOfIssuanceLicense.Text.Length == 0)
                {
                    LtlMsg.Text = "<script> alert('נא הזן תאירך הנפקת רישיון')</script>";
                    TxtDateOfIssuanceLicense.Focus();
                }
                else if (TxtEmail.Text.Length == 0)
                {
                    TxtEmail.Text = "<script> alert('נא הזן אימייל')</script>";
                    TxtDateOfBirth.Focus();
                }
                else if (TxtPass.Text.Length == 0)
                {
                    LtlMsg.Text = "<script> alert('נא הזן סיסמה')</script>";
                    TxtPass.Focus();
                }
                else if (TxtPhone.Text.Length == 0)
                {
                    LtlMsg.Text = "<script> alert('נא הזן טלפון')</script>";
                    TxtPhone.Focus();
                }
                else {
                    string pass = GlobFuncs.Hash(TxtPass.Text.ToString());
                    Users Us = new Users(-1, TxtName.Text.ToString(), TxtAddress.Text.ToString(), int.Parse(TxtCity.Text.ToString()), TxtId.Text.ToString(), DateTime.Parse(TxtDateOfBirth.Text), TxtLicenseNumber.Text.ToString(), int.Parse(DdlLicensCode.Text.ToString()), DateTime.Parse(TxtDateOfIssuanceLicense.Text), TxtEmail.Text.ToString(),pass, TxtPhone.Text.ToString());
                    person per = new person();
                    per = Us.RegUser();
                    LtlMsg.Text = "המשתמש נרשם בהצלחה";
                    Session["Person"] = per;
                    Response.Redirect("PrivateArea.aspx");                    
                }
            }
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
                Response.Redirect("PrivateArea.aspx");
            }
            else {
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
