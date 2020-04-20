using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using Newtonsoft.Json;
using System.Data;
using Glob;
using Data;
using VanCars.App_Code;
using SearchBLL;

namespace WebApplication2
{
    public partial class results : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

                getJson();
            }
        }
        


        protected void getJson() {
            searchBLL search = (searchBLL)Session["search"];
            search.PickupDate = search.PickupDate.Substring(0, 10);
            search.ReturnDate = search.ReturnDate.Substring(0, 10);
            string pickdate = search.PickupDate.Substring(6, 4);
            string retdate = search.ReturnDate.Substring(6, 4);
            pickdate = pickdate + "-";
            retdate = retdate + "-";
            pickdate = pickdate + search.PickupDate.Substring(0, 2);
            retdate = retdate + search.ReturnDate.Substring(0, 2);
            pickdate = pickdate + "-";
            retdate = retdate + "-";
            pickdate = pickdate + search.PickupDate.Substring(3, 2);
            retdate = retdate + search.ReturnDate.Substring(3, 2);
            search.PickupDate = pickdate;
            search.ReturnDate = retdate;
            string ret = search.GetList();
            LtlMsg.Text = "<script>var cars=JSON.parse(" + ret + ")\n var companys = "+GlobFuncs.GetCompanyList()+"</script>";


        }
    }
}