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
            if (!IsPostBack)
            {
                GetCityList();
                GetLicenseCode();

            }
        }
        private void GetCityList()
        {
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
                TxtCity.Focus();
                showErrorMwssage(4);
            }
            else if (DdlLicensCode.SelectedValue == "-1")
            {
                DdlLicensCode.Focus();
                showErrorMwssage(5);
            }
            else
            {
                if (GlobFuncs.IsExist(TxtEmail.Text.ToString()) == true)
                {
                    TxtEmail.Focus();
                    showErrorMwssage(6);
                }
                else if (checkbox1.Checked != true)
                {
                    showErrorMwssage(7);
                }
                else if (TxtName.Text.Length == 0)
                {
                    TxtName.Focus();
                    showErrorMwssage(8);
                }
                else if (TxtAddress.Text.Length == 0)
                {
                    TxtAddress.Focus();
                    showErrorMwssage(9);
                }
                else if (TxtId.Text.Length == 0)
                {
                    TxtId.Focus();
                    showErrorMwssage(10);
                }
                else if (TxtDateOfBirth.Text.Length == 0)
                {
                    TxtDateOfBirth.Focus();
                    showErrorMwssage(11);
                }
                else if (TxtLicenseNumber.Text.Length == 0)
                {
                    TxtLicenseNumber.Focus();
                    showErrorMwssage(12);
                }
                else if (TxtDateOfIssuanceLicense.Text.Length == 0)
                {
                    TxtDateOfIssuanceLicense.Focus();
                    showErrorMwssage(13);
                }
                else if (TxtEmail.Text.Length == 0)
                {
                    TxtEmail.Focus();
                    showErrorMwssage(14);
                }
                else if (TxtPass.Text.Length == 0)
                {
                    TxtPass.Focus();
                    showErrorMwssage(15);
                }
                else if (TxtPhone.Text.Length == 0)
                {
                    TxtPhone.Focus();
                    showErrorMwssage(16);
                }
                else
                {
                    string pass = GlobFuncs.Hash(TxtPass.Text.ToString());
                    Users Us = new Users(-1, TxtName.Text.ToString(), TxtAddress.Text.ToString(), int.Parse(TxtCity.Text.ToString()), TxtId.Text.ToString(), DateTime.Parse(TxtDateOfBirth.Text), TxtLicenseNumber.Text.ToString(), int.Parse(DdlLicensCode.Text.ToString()), DateTime.Parse(TxtDateOfIssuanceLicense.Text), TxtEmail.Text.ToString(), pass, TxtPhone.Text.ToString());
                    person per = new person();
                    per = Us.RegUser();
                    sendRegMessage(per.CustomId, 0.ToString(), per.FullName);
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
                if (persn.CustomId > 0)
                {
                    Session["Person"] = persn;
                    if (persn.role == 1)
                    {
                        Response.Redirect("PrivateArea.aspx");
                    }
                    else if (persn.role == 3)
                    {
                        Response.Redirect("admin.aspx");
                    }
                }
                else if (persn.CustomId == -2)
                {
                    showErrorMwssage(1);
                }
                else if (persn.CustomId == -3)
                {
                    showErrorMwssage(2);
                }
                else
                {
                    showErrorMwssage(3);
                }
            }

        }

        protected void LinkForget_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgetPassword.aspx");
        }

        private void sendRegMessage(int customerId, string orderId, string name)
        {
            chatMessage message = new chatMessage(customerId, int.Parse(orderId), 0, " היי " + name + " , ");
            message.addMessage();
            message.messageText = "ברכות על רישומך למערכת \n מספר הלקוח שלך הוא " + customerId;
            message.addMessage();
        }

        private void showErrorMwssage(int id)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "messgae", "showModalMessage('" + GlobFuncs.getErrorText(id) + "')", true);
        }

        private void checkValues()
        {
            bool emailCheck = checkValiditEmail(TxtEmail.Text);
            if (emailCheck == false)
            {
                TxtEmail.Focus();
                showErrorMwssage(3010);
                return;
            }
            if (TxtPhone.Text.Length < 9 || TxtPhone.Text.Length > 11)
            {
                TxtPhone.Focus();
                showErrorMwssage(3011);
                return;
            }
            string m_PERID = TxtId.Text;
            char[] digits = m_PERID.PadLeft(9, '0').ToCharArray();
            int[] oneTwo = { 1, 2, 1, 2, 1, 2, 1, 2, 1 };
            int[] multiply = new int[9];
            int[] oneDigit = new int[9];
            for (int i = 0; i < 9; i++)
                multiply[i] = Convert.ToInt32(digits[i].ToString()) * oneTwo[i];
            for (int i = 0; i < 9; i++)
                oneDigit[i] = (int)(multiply[i] / 10) + multiply[i] % 10;
            int sum = 0;
            for (int i = 0; i < 9; i++)
                sum += oneDigit[i];
            if (sum % 10 != 0)
            {
                showErrorMwssage(3012);
                TxtId.Focus();
                return;
            }
        }

        private bool checkValiditEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return true;
            }
            catch
            {
                return false;
            }
        }

    }
}
