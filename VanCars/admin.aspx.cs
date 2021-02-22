using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Glob;
using configurationFields;
using VanCars.App_Code;


namespace VanCars
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //פונקציות שרצות בעת הטעינה הראשונית של הדף
            if (!IsPostBack)
            {
                //קריאה ארבע פעמים לפונקציה שמאתחלת נתונים בתוך רשימה נפתחת 
                getDdlSource(companyDdl, "CompanysTable", "CompanyId", "CompanyName", "חברה נוספת");
                getDdlSource(ddlCity, "CityTable", "CityId", "CityName", " עיר נוספת ");
                getDdlSource(carLevelDdl, "CarLevelTable", "IdLevel", "LevelName", " דרגת רכב נוסף ");
                getDdlSource(companyDdl1, "CompanysTable", "CompanyId", "CompanyName", "");

                //הבאת נתונים מצד השרת ושתילתו בתוך משתנים בצד הלקוח
                string[] arr = GlobFuncs.getUnreadChats();
                ltlAllOrders.Text = "<script>var allOrders = " + GlobFuncs.getAllOrders() + "</script>";
                ltlAllCustomers.Text = "<script>var allCustomers= " + GlobFuncs.getAllCustomers() + "</script>";
                ltlChatsUnread.Text = "<script>var chatsUnread = " + arr[0] + "</script>";

                //פונקציה הבודקת אם המשתמש רשום או אינו מורשה לגשת לדף זה
                checkeIsAdmin();
            }
        }

        //פונקציה שרצה כאשר נבחר אחד מהשדות באחד מהרשימות הנפתחות
        protected void checkSelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList drop = (DropDownList)sender;
            if (drop.ID == "companyDdl")
            {
                //בדיקה האם נבחר שדה של חברה קיימת
                string index = companyDdl.SelectedValue;
                if (index != "-1" && index != "9999")
                {
                    company company = new company();
                    company = systemFields.getComapnyData(int.Parse(index));
                    txtApiAddress.Text = company.apiAddress;
                    txtCompanyLogo.Text = company.logo;
                    txtCompanyName.Text = company.CompanyName;
                    txtContuctName.Text = company.contact;
                    txtRemarks.Text = company.remarks;
                    txtSiteAddress.Text = company.siteAddress;
                }                
                else if (companyDdl.SelectedValue == "9999")//במידה ונבחר הוספת חברה חדשה
                {
                    txtApiAddress.Text = "";
                    txtCompanyLogo.Text = "";
                    txtCompanyName.Text = "";
                    txtContuctName.Text = "";
                    txtRemarks.Text = "";
                    txtSiteAddress.Text = "";
                }
                companyBlok.Visible = true;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "navigate", "goToCompanys()", true);
            }
            else if (drop.ID == "companyDdl1")//בדיקה האם מדובר ברשימת חברות שנפתחת כאשר רוצים לערוך סניף
            {
                branchDdl.DataSource = GlobFuncs.addMoreLine(GlobFuncs.getDDlWithCondition("BranchTable", "BranchId", "Address", "CompanyId", int.Parse(drop.SelectedValue)), " סניף נוסף ");
                branchDdl.DataTextField = "name";
                branchDdl.DataValueField = "id";
                branchDdl.DataBind();
                brancDdlhBlok.Visible = true;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "navigate", "goToBranchs()", true);
            }
            else if (drop.ID == "branchDdl")//בדיקה האם מדובר ברשימה נפתחת של סניפים
            {
                branchBlok.Visible = true;
                if (branchDdl.SelectedValue != "9999" && branchDdl.SelectedValue != "-1")//בדיקה האם נבחר ערך של סניף קיים
                {
                    configurationFields.branch branch = new configurationFields.branch();
                    branch = systemFields.getBranchData(int.Parse(branchDdl.SelectedValue));
                    txtBranchAddress.Text = branch.Address;
                    txtBranchPhone.Text = branch.Phone;
                    cityForBranchDdl.DataSource = GlobFuncs.GetDDL("CityTable", "CityId", "CityName");
                    cityForBranchDdl.DataTextField = "name";
                    cityForBranchDdl.DataValueField = "id";
                    cityForBranchDdl.DataBind();
                    cityForBranchDdl.SelectedValue = branch.CityId.ToString();
                }
                else//במידה ולא נבחר ערך של סניף קיים
                {
                    cityForBranchDdl.DataSource = GlobFuncs.GetDDL("CityTable", "CityId", "CityName");
                    cityForBranchDdl.DataTextField = "name";
                    cityForBranchDdl.DataValueField = "id";
                    cityForBranchDdl.DataBind();
                    txtBranchAddress.Text = "";
                    txtBranchPhone.Text = "";
                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "navigate", "goToBranchs()", true);
            }
            else if (drop.ID == "ddlCity")//בדיקה האם מדובר ברשימה נפתחת של ערים
            {
                cityBlok.Visible = true;
                if (ddlCity.SelectedValue != "9999" && ddlCity.SelectedValue != "-1")
                {
                    txtCity.Text = systemFields.getCityName(int.Parse(ddlCity.SelectedValue));
                }
                else
                {
                    txtCity.Text = "";
                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "navigate", "goToCity()", true);
            }
            else if (drop.ID == "carLevelDdl")//בדיקה האם מדובר ברשימה נפתחת של דרגות רכבים
            {
                carLevelBlok.Visible = true;
                if (carLevelDdl.SelectedValue != "9999" && carLevelDdl.SelectedValue != "-1")
                {
                    txtCarLevel.Text = systemFields.getCarLevelName(int.Parse(carLevelDdl.SelectedValue));
                }
                else
                {
                    txtCarLevel.Text = "";
                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "navigate", "goToCarLevel()", true);
            }
        }

        //פונקציה שרצה כאשר אני שומר שינויים בחברות
        protected void btnComanySave_Click(object sender, EventArgs e)
        {
            if (companyDdl.SelectedValue == "-1")
                return;
            company company = new company();
            if (companyDdl.SelectedValue != "9999")
            {
                company.CompanyId = int.Parse(companyDdl.SelectedValue);
            }
            company.apiAddress = txtApiAddress.Text;
            company.logo = txtCompanyLogo.Text;
            company.CompanyName = txtCompanyName.Text;
            company.contact = txtContuctName.Text;
            company.remarks = txtRemarks.Text;
            company.siteAddress = txtSiteAddress.Text;
            int newId = systemFields.saveCompany(company);
            getDdlSource(companyDdl, "CompanysTable", "CompanyId", "CompanyName", " חברה נוספת");
        }

        //פונקציה שרצה בעת שינוי של פרטי סניפים
        protected void btnBranchSave_Click(object sender, EventArgs e)
        {
            if (branchDdl.SelectedValue == "-1")
                return;
            configurationFields.branch branch = new configurationFields.branch();
            if (branchDdl.SelectedValue != "9999")
            {
                branch.BranchId = int.Parse(branchDdl.SelectedValue);
            }
            branch.CompanyId = int.Parse(companyDdl1.SelectedValue);
            branch.CityId = int.Parse(cityForBranchDdl.SelectedValue);
            branch.Address = txtBranchAddress.Text;
            branch.Phone = txtBranchPhone.Text;
            int newId = systemFields.saveBranchData(branch);
            branchDdl.DataSource = GlobFuncs.addMoreLine(GlobFuncs.getDDlWithCondition("BranchTable", "BranchId", "Address", "CompanyId", int.Parse(companyDdl1.SelectedValue)), " סניף נוסף ");
            branchDdl.DataTextField = "name";
            branchDdl.DataValueField = "id";
            branchDdl.DataBind();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "navigate", "goToBranchs(0,2)", true);//קריאה לפונקציית ג'אווה סקריפט מצד שרת
        }

        //פונקציה שרצה בעת שמירת פרטי ערים
        protected void btnSaveCity_Click(object sender, EventArgs e)
        {
            if (ddlCity.SelectedValue == "-1")
                return;
            city city = new city();
            if (ddlCity.SelectedValue != "9999")
            {
                city.CityId = int.Parse(ddlCity.SelectedValue);
            }
            city.CityName = txtCity.Text;
            int newid = systemFields.saveCityData(city);
            getDdlSource(ddlCity,"CityTable", "CityId", "CityName", " עיר נוספת ");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "navigate", "goToCity()", true);//קריאה לפונקציית ג'אווה סקריפט מצד שרת
        }

        //פונקציה שרצה בעת שמירת פרטי דרגות רכבים
        protected void btnSaveCarLevel_Click(object sender, EventArgs e)
        {
            if (carLevelDdl.SelectedValue == "-1")
                return;
            carLevel carLevel = new carLevel();
            if (carLevelDdl.SelectedValue != "9999")
            {
                carLevel.IdLevel = int.Parse(ddlCity.SelectedValue);
            }
            carLevel.LevelName = txtCarLevel.Text;
            int newid = systemFields.saveCarLevelData(carLevel);
            getDdlSource(carLevelDdl, "CarLevelTable", "IdLevel", "LevelName", " דרגת רכב נוסף ");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "navigate", "goToCarLevel()", true);
        }

        //פונקציה שמביאה את כמות הגולשים באתר ברגע זה
        public int checkCount()
        {
            var app = (VanCars.Global)HttpContext.Current.ApplicationInstance;
            int counter = int.Parse(app.Application["counter"].ToString());
            return counter;
        }

        //פונקציה שבודקת האם מי שמנסה לגשת לדף הוא משתמש רשום ובעל הרשאות גישה לדף
        private void checkeIsAdmin()
        {
            if (Session["person"] == null)
            {
                Response.Redirect("Reg.aspx");
            }
            else
            {
                person person = (person)Session["person"];
                if (person.role != 3)
                {
                    Response.Redirect("PrivateArea.aspx");
                }
            }
            return;
        }

        //פונקציה המקבלת אובייקת רשימה נפתחת וטבלת ערכים ומאתחלת את הרשימה
        private void getDdlSource(DropDownList dropDownList, string tableName, string idName, string valueName, string moreLine)
        {
            if (moreLine.Length > 0)
            {
                dropDownList.DataSource = GlobFuncs.addMoreLine(GlobFuncs.GetDDL(tableName, idName, valueName), moreLine);
            }
            else
            {
                dropDownList.DataSource = GlobFuncs.GetDDL(tableName, idName, valueName);
            }
            dropDownList.DataTextField = "name";
            dropDownList.DataValueField = "id";
            dropDownList.DataBind();
        }
    }
}