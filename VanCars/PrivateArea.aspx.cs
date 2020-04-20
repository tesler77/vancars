using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VanCars.App_Code;
using BLL;
using Glob;
using VanCars.App_Code.BLL;

namespace VanCars
{
    public partial class PrivateArea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                person per = new person();
                per = (person)Session["person"];
                if(per == null)
                {
                    Response.Redirect("/Reg.aspx");
                }
                //יצירת אובייקט הזמנות חדש
                List<order> orders = new List<order>();
                //מילוי נתונים ברפיטר של ההזמנות
                RptOrders.DataSource = GlobFuncs.getOrdersByCustomerId(per.CustomId);
                RptOrders.DataBind();
                //העברת נתונים לצד לקוח .כמות הזמנות. פרטי כרטיסי אשראי .הודעות. מספר לקוח
                ltlNo.Text = "<script>var numbers = " + RptOrders.Items.Count + "\n var creditCards = " + GlobFuncs.GetCreditCards(per.CustomId) + " \n let messages = " + GlobFuncs.getChathMasseges(per.CustomId) + " \n var customerOrders = " + GlobFuncs.getCustomerOrders(per.CustomId) + ";\n let allOrders = " + GlobFuncs.getOrdersByCustomerIdJson(per.CustomId) + "</script>";
                Users us = GetUser(per.CustomId);
                TxtName.Text = us.Name;
                TxtAddress.Text = us.Address;
                TxtId.Text = us.Id;
                TxtCity.Text = GlobFuncs.getUnitValue(us.City, "CityId", "CityName", "CityTable");
                TxtDateOfBirth.Text = us.BirthDay.Substring(6, 4) + "-" + us.BirthDay.Substring(3, 2) + "-" + us.BirthDay.Substring(0, 2);
                TxtLicenseNumber.Text = us.LicenseNumber;
                if(us.DateOfIssuanceLicense != null)
                    TxtDateOfIssuanceLicense.Text = us.DateOfIssuanceLicense.Substring(6, 4) + "-" + us.DateOfIssuanceLicense.Substring(3, 2) + "-" + us.DateOfIssuanceLicense.Substring(0, 2);
                DdlLicensCode.Text = us.LicenseLevel.ToString();
                TxtPhone.Text = us.Phone;
                TxtLicenseCode.Text = GlobFuncs.getUnitValue(us.LicenseLevel, "LicenseId", "LicenseName", "LicenseLevelTable");
                ddlCity = GetDropDownList(ddlCity, "CityTable", "CityId", "CityName");
                DdlLicensCode = GetDropDownList(DdlLicensCode, "LicenseLevelTable", "LicenseId", "LicenseName");
                ddlCity.SelectedValue = us.City.ToString();
                DdlLicensCode.SelectedValue = us.LicenseLevel.ToString();
                creaditCardBLL creaditCard = new creaditCardBLL() { customerId = per.CustomId };
                rptCards.DataSource = creaditCard.getCards();
                rptCards.DataBind();
            }
        }

        
        private Users GetUser(int id)
        {
            Users us = new Users(id);
            us.GetPerson();
            return us;
        }

        protected void BtnChange_Click(object sender, EventArgs e)
        {
            TxtName.ReadOnly                    = false;
            TxtAddress.ReadOnly                 = false;
            TxtId.ReadOnly                      = false;
            TxtDateOfBirth.ReadOnly             = false;
            TxtLicenseNumber.ReadOnly           = false;
            TxtDateOfIssuanceLicense.ReadOnly   = false;
            TxtPhone.ReadOnly                   = false;
            ddlCity.Visible                     = true;
            TxtCity.Visible                     = false;
            TxtLicenseCode.Visible              = false;
            DdlLicensCode.Visible               = true;
            BtnChange.Visible                   = false;
            btnSaveChange.Visible               = true;
        }
        private DropDownList GetDropDownList(DropDownList ddl,string table,string idField,string textField)
        {
            ddl.DataSource = GlobFuncs.GetDDL(table, idField, textField);
            ddl.DataValueField = "id";
            ddl.DataTextField = "name";
            ddl.DataBind();
            return ddl;
        }

        

        protected void btnSaveChange_Click(object sender, EventArgs e)
        {
            person per = new person();
            per = (person)Session["person"];
            Users us = new Users()
            {
                UserId                  = per.CustomId,
                Name                    = TxtName.Text,
                Address                 = TxtAddress.Text,
                City                    = int.Parse(ddlCity.SelectedValue),
                Id                      = TxtId.Text,
                BirthDay                = TxtDateOfBirth.Text,
                LicenseNumber           = TxtLicenseNumber.Text,
                LicenseLevel            = int.Parse(DdlLicensCode.Text),
                DateOfIssuanceLicense   = TxtDateOfIssuanceLicense.Text,
                Phone                   = TxtPhone.Text
            };
            us.saveChange();
            TxtName.ReadOnly                    = true;
            TxtAddress.ReadOnly                 = true;
            TxtId.ReadOnly                      = true;
            TxtDateOfBirth.ReadOnly             = true;
            TxtLicenseNumber.ReadOnly           = true;
            TxtDateOfIssuanceLicense.ReadOnly   = true;
            TxtPhone.ReadOnly                   = true;
            ddlCity.Visible                     = false;
            TxtCity.Visible                     = true;
            TxtLicenseCode.Visible              = true;
            DdlLicensCode.Visible               = false;
            BtnChange.Visible                   = true;
            btnSaveChange.Visible               = false;
        }

        protected void addCreditCard_Click(object sender,EventArgs e)
        {
            if(txtCradNumber.Text == "")
            {
                //alert
                txtCradNumber.Focus();
            }
            else if(txtCardMonth.Text == "")
            {
                txtCardMonth.Focus();
            }
            else if(txtCardYear.Text == "")
            {
                txtCardYear.Focus();

            }
            else if(txtCardCvv.Text == "")
            {
                txtCardCvv.Focus();
            }
            else if(txtOwnerId.Text == "")
            {
                txtOwnerId.Focus();
            }
            else {
                person per = new person();
                per = (person)Session["person"];
                creaditCardBLL creaditCard = new creaditCardBLL()
                {
                    id = GlobFuncs.createCreditCardId(),
                    number = txtCradNumber.Text,
                    month = txtCardMonth.Text,
                    year = txtCardYear.Text,
                    digitNo = txtCardCvv.Text,
                    ownerId = txtOwnerId.Text,
                    customerId = per.CustomId
                };
                string txtCardId = creaditCard.AddCard();
                rptCards.DataSource = creaditCard.getCards();
                rptCards.DataBind();
                Response.Redirect("PrivateArea.aspx#CreditCards");
            }
        }

        protected void btnEditCreditCard_Click(object sender, EventArgs e)
        {
            Button bt = (Button)sender;
            person per = new person();
            per = (person)Session["person"];
            RepeaterItem repeaterItem = (RepeaterItem)((Control)sender).NamingContainer;
            var txteEitNumber = repeaterItem.FindControl("txtEditCardNumber") as TextBox;
            var txtEditCardMonth = repeaterItem.FindControl("txtEditCardMonth") as TextBox;
            var txtEditYear = repeaterItem.FindControl("txtEditYear") as TextBox;
            var txtEditCardCvv = repeaterItem.FindControl("txtEditCardCvv") as TextBox;
            creaditCardBLL creaditCardBLL = new creaditCardBLL()
            {
                id = bt.CommandArgument,
                number = txteEitNumber.Text,
                month = txtEditCardMonth.Text,
                year = txtEditYear.Text,
                digitNo = txtEditCardCvv.Text,
                customerId = per.CustomId
            };
            int ret = creaditCardBLL.updateCard();
            if(ret == 1)
            {
                Response.Redirect(Request.RawUrl);             
            }
        }

        protected void deleteCard_Click(object sender, EventArgs e)
        {
            Button bt = (Button)sender;
            creaditCardBLL creaditCard = new creaditCardBLL()
            {
                id = bt.CommandArgument
            };
            int ret = creaditCard.deleteCard();
            if(ret == 1)
            {
                Response.Redirect("PrivateArea.aspx");
            }
        }
    }
}