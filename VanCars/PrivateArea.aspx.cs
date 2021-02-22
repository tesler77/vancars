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
using Newtonsoft.Json;
using SearchBLL;
using System.Configuration;

namespace VanCars
{
    public partial class PrivateArea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //קוד שרץ בעת טעינת הדף הראשונית
            if (!IsPostBack)
            {

                //בדיקה האם מדובר במשתמש רשום
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
                ltlNo.Text = "<script>var numbers = " + RptOrders.Items.Count + "\n var creditCards = " + GlobFuncs.GetCreditCards(per.CustomId) + " \n let messages = " + GlobFuncs.getChathMasseges(per.CustomId) + " \n var customerOrders = " + GlobFuncs.getCustomerOrders(per.CustomId) + ";\n let allOrders = " + GlobFuncs.getOrdersByCustomerIdJson(per.CustomId) + "\n let searchs = "+GlobFuncs.getAllSearchesByUser(per.CustomId) + "</script>";

                //קבלת פרטי הלקוח והזנתו בשדות במסך
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

                //יצירת רשימות נפתחות עבור ערים ודרגות רישיון
                ddlCity = GetDropDownList(ddlCity, "CityTable", "CityId", "CityName");
                DdlLicensCode = GetDropDownList(DdlLicensCode, "LicenseLevelTable", "LicenseId", "LicenseName");
                ddlCity.SelectedValue = us.City.ToString();
                DdlLicensCode.SelectedValue = us.LicenseLevel.ToString();

                //יצירת אובייקט כרטיסי אשראי
                creaditCardBLL creaditCard = new creaditCardBLL() { customerId = per.CustomId };

                //הזנת פרטי כרטיס האשראי בתוך רפיטר של כרטיסי אשראי
                rptCards.DataSource = creaditCard.getCards();
                rptCards.DataBind();
            }
        }

        //מתודה המביאה את פרטי המשתמש
        private Users GetUser(int id)
        {
            Users us = new Users(id);
            us.GetPerson();
            return us;
        }

        //מתודה המאפשרת עריכה לשדות פרטי המשתמש
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

        //מתודה המקבלת רשימה נפתחת ומביאה את הנתונים שלו
        private DropDownList GetDropDownList(DropDownList ddl,string table,string idField,string textField)
        {
            ddl.DataSource = GlobFuncs.GetDDL(table, idField, textField);
            ddl.DataValueField = "id";
            ddl.DataTextField = "name";
            ddl.DataBind();
            return ddl;
        }

        //מתודה השומרת את פרטי המשתמש החדשים לאחר השינוי והופכת את השדות למצב קריאה בלבד
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

        //מתודה השומרת פרטי כרטיס אשראי חדשים
        protected void addCreditCard_Click(object sender,EventArgs e)
        {
            if(txtCradNumber.Text == "")
            {
                showErrorMwssage(1005);
            }
            else if(txtCardMonth.Text == "")
            {
                showErrorMwssage(2002);
            }
            else if(txtCardYear.Text == "")
            {
                showErrorMwssage(2003);

            }
            else if(txtCardCvv.Text == "")
            {
                showErrorMwssage(2004);
            }
            else if(txtOwnerId.Text == "")
            {
                showErrorMwssage(2005);
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
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "hideModal", "hideAddCreditCardModal()", true);                
                Response.Redirect("PrivateArea.aspx#CreditCards");
            }
        }

        //מתודה השומרת עדכון פרטים לכרטיסי אשראי
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
                customerId = per.CustomId
            };
            creaditCardBLL.getCardDetails(bt.CommandArgument);
            if(txteEitNumber.Text != "")
            {
                creaditCardBLL.number = txteEitNumber.Text;
            }
            if(txtEditCardMonth.Text != "")
            {
                creaditCardBLL.month = txtEditCardMonth.Text;
            }
            if(txtEditYear.Text != "")
            {
                creaditCardBLL.year = txtEditYear.Text;
            }
            if(txtEditCardCvv.Text != null)
            {
                creaditCardBLL.digitNo = txtEditCardCvv.Text;
            }
            int ret = creaditCardBLL.updateCard();
            if(ret == 1)
            {
                Response.Redirect(Request.RawUrl);             
            }
        }

        //מתודה המוחקת כרטיס אשראי
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

        //מתודה המקפיצה הודעת שגיאה לפי קוד שגיאה בצד לקוח
        private void showErrorMwssage(int id)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "messgae", "showModalMessage('" + GlobFuncs.getErrorText(id) + "')", true);
        }

        //מתודה שרצה בזמן יצירת הרפיטר ובודקת אם ההזמנה בסטטוס ממתינה לביצוע
        //במידה וכן היא מציגה בהזמנה כפתור ערוך הזמנה
        protected void RptOrders_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            Button btn = (Button)e.Item.FindControl("btnEditOrder");
            order order = (order)e.Item.DataItem;
            if(order.Status == "ממתין לתאריך")
            {
                btn.Visible = true;
            }
            else
            {
                btn.Visible = false;
            }

        }

        //מתודה שרצה כאשר המשתמש הקליק על כפתור ערוך הזמנה
        //המתודה מעבירה את המשתמש לדף עריכת הזמנה עבור ההזמנה הספציפית
        protected void RptOrders_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int orderIndex = e.Item.ItemIndex;
            person person = new person();
            person = (person)Session["person"];
            List<order> orders = GlobFuncs.getOrdersByCustomerId(person.CustomId);
            searchBLL search = new searchBLL(orders[orderIndex].PickupBranch.ToString(), orders[orderIndex].PickupDate.Substring(6,4)+"-"+ orders[orderIndex].PickupDate.Substring(3, 2) + "-" + orders[orderIndex].PickupDate.Substring(0, 2), orders[orderIndex].ReturnBranch.ToString(), orders[orderIndex].ReturnDate.Substring(6, 4) + "-" + orders[orderIndex].ReturnDate.Substring(3, 2) + "-" + orders[orderIndex].ReturnDate.Substring(0, 2));
            Session["search"] = search;
            Response.Redirect("Order.aspx?Comapny=" + GlobFuncs.getComanyIdByName(orders[orderIndex].CompanyId) + "&CarId=" + orders[orderIndex].CarId+"&id="+int.Parse(orders[orderIndex].RentId.ToString())*1825.8976);
        }
    }
}