using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Glob;
using configurationFields;


namespace VanCars
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
            if (!IsPostBack)
            {
                companyDdl.DataSource = GlobFuncs.addMoreLine(GlobFuncs.GetDDL("CompanysTable", "CompanyId", "CompanyName"), "חברה נוספת");
                companyDdl.DataTextField = "name";
                companyDdl.DataValueField = "id";
                companyDdl.DataBind();
                companyDdl1.DataSource = GlobFuncs.GetDDL("CompanysTable", "CompanyId", "CompanyName");
                companyDdl1.DataTextField = "name";
                companyDdl1.DataValueField = "id";
                companyDdl1.DataBind();
                ddlCity.DataSource = GlobFuncs.addMoreLine(GlobFuncs.GetDDL("CityTable", "CityId", "CityName"), " עיר נוספת ");
                ddlCity.DataTextField = "name";
                ddlCity.DataValueField = "id";
                ddlCity.DataBind();
                carLevelDdl.DataSource = GlobFuncs.addMoreLine(GlobFuncs.GetDDL("CarLevelTable", "IdLevel", "LevelName"), " דרגת רכב נוסף ");
                carLevelDdl.DataTextField = "name";
                carLevelDdl.DataValueField = "id";
                carLevelDdl.DataBind();
                ltlScript.Text = "<script>var allOrders = "+GlobFuncs.getAllOrders()+"\n var allCustomers = "+GlobFuncs.getAllCustomers()+"</script>";
            }
        }

        protected void checkSelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList drop = (DropDownList)sender;
            if (drop.ID == "companyDdl")
            {
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
                else if (companyDdl.SelectedValue == "9999")
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
            else if (drop.ID == "companyDdl1")
            {
                branchDdl.DataSource = GlobFuncs.addMoreLine(GlobFuncs.getDDlWithCondition("BranchTable", "BranchId", "Address", "CompanyId", int.Parse(drop.SelectedValue)), " סניף נוסף ");
                branchDdl.DataTextField = "name";
                branchDdl.DataValueField = "id";
                branchDdl.DataBind();
                brancDdlhBlok.Visible = true;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "navigate", "goToBranchs()", true);
            }
            else if (drop.ID == "branchDdl")
            {
                branchBlok.Visible = true;
                if (branchDdl.SelectedValue != "9999" && branchDdl.SelectedValue != "-1")
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
                else
                {
                    cityForBranchDdl.DataSource = GlobFuncs.GetDDL("CityTable", "CityId", "CityName");
                    cityForBranchDdl.DataTextField = "name";
                    cityForBranchDdl.DataValueField = "id";
                    cityForBranchDdl.DataBind();
                    txtBranchAddress.Text = "";
                    txtBranchPhone.Text = "";
                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "navigate", "goToBranchs()", true);
            }else if(drop.ID == "ddlCity")
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
            else if(drop.ID == "carLevelDdl")
            {
                carLevelBlok.Visible = true;
                if(carLevelDdl.SelectedValue != "9999" && carLevelDdl.SelectedValue != "-1")
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
            reRenderDdl(companyDdl, "CompanysTable", "CompanyId", "CompanyName", " חברה נוספת");
        }

        private void reRenderDdl(DropDownList ddl, string table, string idColumn, string nameColumn, string addLine)
        {
            ddl.DataSource = GlobFuncs.addMoreLine(GlobFuncs.GetDDL(table, idColumn, nameColumn), addLine);
            ddl.DataTextField = "name";
            ddl.DataValueField = "id";
            ddl.DataBind();
        }

        protected void btnBranchSave_Click(object sender, EventArgs e)
        {
            if (branchDdl.SelectedValue == "-1")
                return;
            configurationFields.branch branch = new configurationFields.branch();
            if(branchDdl.SelectedValue != "9999")
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
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "navigate", "goToBranchs(0,2)", true);
        }

        protected void btnSaveCity_Click(object sender, EventArgs e)
        {
            if (ddlCity.SelectedValue == "-1")
                return;
            city city = new city();
            if(ddlCity.SelectedValue != "9999")
            {
                city.CityId = int.Parse(ddlCity.SelectedValue);
            }
            city.CityName = txtCity.Text;
            int newid = systemFields.saveCityData(city);
            ddlCity.DataSource = GlobFuncs.addMoreLine(GlobFuncs.GetDDL("CityTable", "CityId", "CityName"), " עיר נוספת ");
            ddlCity.DataTextField = "name";
            ddlCity.DataValueField = "id";
            ddlCity.DataBind();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "navigate", "goToCity()", true);
        }

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
            carLevelDdl.DataSource = GlobFuncs.addMoreLine(GlobFuncs.GetDDL("CarLevelTable", "IdLevel", "LevelName"), " דרגת רכב נוסף ");
            carLevelDdl.DataTextField = "name";
            carLevelDdl.DataValueField = "id";
            carLevelDdl.DataBind();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "navigate", "goToCarLevel()", true);            
        }
        public int checkCount()
        {
            var app = (VanCars.Global)HttpContext.Current.ApplicationInstance;
            int counter = int.Parse(app.Application["counter"].ToString());
            return counter;
        }
    }
}