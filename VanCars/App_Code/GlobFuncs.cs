using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Data;
using System.Net;
using System.Net.Mail;
using System.Web;
using VanCars.App_Code;
using System.Security.Cryptography;
using System.Text;
using Newtonsoft.Json;
using System.Text.RegularExpressions;

namespace Glob
{
    public static partial class GlobFuncs
    {
        public static List<Item> GetDDL(string TableName, string id, string name)
        {
            List<Item> DDllist = new List<Item>();
            string sql = "select " + id + "," + name + " from " + TableName;
            DataBase db = new DataBase();
            DataTable dt = db.ExecuteReader(sql);
            DDllist.Add(new Item(-1, "נא בחר ערך מתוך הרשימה"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DDllist.Add(new Item((int)dt.Rows[i][id], (string)dt.Rows[i][name]));
            }
            return DDllist;
        }

        public static List<Item> getDDlWithCondition(string TableName, string id, string name,string condField,int condValue)
        {
            List<Item> DDllist = new List<Item>();
            string sql = "select " + id + "," + name + " from " + TableName +" where "+condField +" = "+ condValue;
            DataBase db = new DataBase();
            DataTable dt = db.ExecuteReader(sql);
            DDllist.Add(new Item(-1, "נא בחר ערך מתוך הרשימה"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DDllist.Add(new Item((int)dt.Rows[i][id], (string)dt.Rows[i][name]));
            }
            return DDllist;
        }

        public static Boolean IsExist(string Email) {
            DataBase db = new DataBase();
            string sql = "select Email from CustomersTable where Email = '" + Email + "'";
            string CheckUserName = db.ExecuteScalar(sql);
            if (CheckUserName == Email)
            {
                return true;
            }
            else {
                return false;
            }
        }
        public static string ForgetPass(string Email)
        {
            string sql = "select ForgetPass from CustomersTable where Email = '" + Email + "'";
            DataBase db = new DataBase();
            string Temporary = db.ExecuteScalar(sql).ToString();
            Random rand = new Random();
            int random = rand.Next(100000, 999999);
            sql = "update CustomersTable set ForgetPass = '" + random.ToString() + "' where email = '" + Email + "'";
            //sql = "insert into CustomersTable (ForgetPass) values '" + random.ToString() + "' where email = '"+Email+"'";
            int reccount = db.ExecuteNonQuery(sql);
            return Temporary;
        }
        public static void SendEmail(string Receiever, string Subject, string Body)
        {
            try
            {

                MailMessage mail = new MailMessage();
                mail.From = new System.Net.Mail.MailAddress("pa8501100@gmail.com");
                SmtpClient smtp = new SmtpClient();
                smtp.Port = 587;   // [1] You can try with 465 also, I always used 587 and got success
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network; // [2] Added this
                smtp.UseDefaultCredentials = false; // [3] Changed this
                smtp.Credentials = new NetworkCredential(mail.From.ToString(), "Pa96396396");  // [4] Added this. Note, first parameter is NOT string.
                smtp.Host = "smtp.gmail.com";
                mail.To.Add(new MailAddress(Receiever));
                mail.IsBodyHtml = true;
                mail.Subject = Subject;
                mail.Body = Body;
                smtp.Send(mail);

            }
            catch (Exception Ex)
            {
                Console.WriteLine("Error: " + Ex.Message);
            }
        }
        public static bool UpdateDB(string Table, string column, string value, string ConditionFiled, string ConditionValue)
        {
            string sql = "update " + Table + " set " + column + " = '" + value + "' where " + ConditionFiled + " = '" + ConditionValue + "'";
            DataBase db = new DataBase();
            int a = db.ExecuteNonQuery(sql);
            if (a > 0)
            {
                return true;
            }
            return false;
        }
        public static person GetSession(string Email)
        {
            string sql = sql = "select CustomId,FullName,Email from CustomersTable where Email = '" + Email + "'";
            DataBase db = new DataBase();
            DataTable dt = db.ExecuteReader(sql);
            person per = new person();
            per.CustomId = (int)dt.Rows[0]["CustomId"];
            per.FullName = dt.Rows[0]["FullName"].ToString();
            per.Email = dt.Rows[0]["Email"].ToString();
            return per;
        }
        public static bool UpdateDb(string table, string columns, string data) {
            string sql = "insert into " + table + "(" + columns + ") values (" + data + ")";
            DataBase db = new DataBase();
            int check = db.ExecuteNonQuery(sql);
            if (check == 0)
                return false;
            return true;
        }
        public static DataTable GetCars(string Table, string columns) {
            string sql = "select " + columns + " from " + Table;
            DataBase db = new DataBase();
            DataTable dt = db.ExecuteReader(sql);
            return dt;
        }
        public static string Hash(string Source)
        {
            StringBuilder sb = new StringBuilder();
            SHA256 hash = SHA256Managed.Create();
            Encoding enc = Encoding.UTF8;
            byte[] res = hash.ComputeHash(enc.GetBytes(Source));
            foreach (Byte b in res)
            {
                sb.Append(b.ToString("x2"));
            }
            return sb.ToString();
        }
        public static string GetCreditCards(int CustId)
        {
            string sql = "select id,Number from CreditCardsTable Where CustomerId = " + CustId;
            DataBase db = new DataBase();
            DataTable dt = new DataTable();
            dt = db.ExecuteReader(sql);
            foreach (DataRow row in dt.Rows)
            {
                string number = row["Number"].ToString();
                number = decription(number, "b1bbc4ca589133e2e8a4e4a2315a1916");                    
                number = number.Substring(number.Length - 5, 4);
                number = number + " - ****";
                row["Number"] = number;
            }
            string Cards = JsonConvert.SerializeObject(dt);
            return Cards;
        }

        public static List<Year> GetYearList()
        {

            Year y = new Year();
            List<Year> years = new List<Year>();
            y.value = -1;
            y.year = "שנה";
            years.Add(y);
            y = null;
            y = new Year();
            for (int i = 0; i < 7; i++)
            {
                y.value = DateTime.Now.Year + i;
                y.year = y.value.ToString();
                years.Add(y);
                y = null;
                y = new Year();
            }
            return years;
        }

        public static string GetApiAddress(int Company, string Request)
        {
            string sql = "select ApiAddress from CompanysTable where CompanyId = " + Company;
            DataBase db = new DataBase();
            return db.ExecuteScalar(sql) + Request;
        }

        public static string GetDetails(int company, int CarId)
        {
            string Address = "";
            if (company == 1)
            {
                Address = "https://localhost:44361/api/CarDetail";
            }
            else
            {
                Address = GetApiAddress(company, "CarDetail");
            }
            string ret = GetApi.PostApi(CarId.ToString(), Address);
            return ret;
        }
        public static string GetCompanyList()
        {
            string sql = "select CompanyId,CompanyName from CompanysTable";
            DataBase db = new DataBase();
            DataTable dt = db.ExecuteReader(sql);
            return JsonConvert.SerializeObject(dt);
        }
        public static string ConvertDateToString(DateTime date)
        {
            string NewDate = date.ToString("yyyy-MM-dd");
            return NewDate;
        }
        public static List<Extention> addExt()
        {
            Extention extention = new Extention(1, "aaa");
            Extention extention2 = new Extention(2, "bbb");
            List<Extention> ext = new List<Extention>();
            ext.Add(extention);
            ext.Add(extention2);
            return ext;
        }
        public static DataTable GetFullAddress(int CustomerId)
        {
            string sql = "select Custom.Address,City.CityName from CustomersTable as Custom inner join CityTable as city on Custom.City = City.CityId where CustomId = " + CustomerId;
            DataBase db = new DataBase();
            return db.ExecuteReader(sql);
        }
        public static string GetBranchs()
        {
            string Companys = GetCompanyList();
            DataTable dt = new DataTable();
            dt = JsonConvert.DeserializeObject<DataTable>(Companys);
            string Branchs = "[";
            for(var i = 0; i < dt.Rows.Count; i++)
            {
                string Url = GetApiAddress(int.Parse(dt.Rows[i][0].ToString()), "Branch");
                Url = "https://localhost:44361/api/Branch";
                string result = GetApi.PostApi("", Url);
                result = result.Replace("[", "");
                result = result.Substring(1, result.Length - 3)+",";
                Branchs = Branchs + result;
            }
            Branchs = Branchs.Substring(0, Branchs.LastIndexOf(","))+"]";
            //Branchs.Replace("\\","");
            return Branchs;
        }
        public static string GetUnitBranch(int company,int Id)
        {            
            return GetApiAddress(company, "Branch");
        }
        public static string GetBranchName(int Branch,int Company)
        {
            string url = GetApiAddress(Company, "Branch/") + Branch.ToString();
            string ret = GetApi.Get(url);
            ret = ret.Substring(1, ret.Length - 2);
            Regex rg = new Regex(@"\\");
            ret = rg.Replace(ret, "");
            DataTable dt = new DataTable();
            dt = JsonConvert.DeserializeObject<DataTable>(ret);
            if (dt != null)
            {
                foreach(DataRow dr in dt.Rows)
                {
                    return dr["BranchName"].ToString() +" "+ dr["CityName"].ToString();
                }
            }
            return "Not found";            
        }
        public static string getOrders(string customerId)
        {
            string sql = "select * from OrderTable where CustomId = " + customerId;
            DataBase db = new DataBase();
            DataTable dt = new DataTable();
            dt = db.ExecuteReader(sql);
            string ret = JsonConvert.SerializeObject(dt);
            return ret;
        }
        public static List<order> getOrdersByCustomerId(int customerId)
        {
            List<order> orderList = new List<order>();
            DataBase db = new DataBase();
            DataTable dt,dt1 = new DataTable();
            dt1 = JsonConvert.DeserializeObject<DataTable>(GetCompanyList());
            string sql = "select * from OrderTable where CustomId = " + customerId;
            dt = db.ExecuteReader(sql);
            var CompanyName = "a";
            order or = new order();
            
            foreach (DataRow dr in dt.Rows)
            {
                foreach(DataRow row in dt1.Rows)
                {
                    if(row["CompanyId"].ToString() == dr["CompanyId"].ToString())
                    {
                        CompanyName = row["CompanyName"].ToString();
                    }
                }
                orderList.Add(or = new order((int)dr["rentId"],
                    (int)dr["CustomId"], dr["ExternalRentId"].ToString(),
                    dr["CarName"].ToString(),
                    (int)dr["CarLevel"],
                    CompanyName.ToString(),
                    //dr["CompanyId"].ToString(),
                    (int)dr["Seats"],
                    dr["GearBox"].ToString(), 
                    (int)dr["EngineCapacity"],
                    (int)dr["Doors"], 
                    (int)dr["Beags"],
                    (int)dr["PickupBranch"],
                    dr["PickupBranchText"].ToString(),
                    dr["PickupDate"].ToString(), 
                    (int)dr["ReturnBranch"],
                    dr["ReturnBranchText"].ToString(),
                    dr["ReturnDate"].ToString(), 
                    dr["DateOrder"].ToString(),
                    dr["Status"].ToString()));
            }
            return orderList;
        }
        public static string getOrdersByCustomerIdJson(int customerId)
        {
            DataBase db = new DataBase();
            DataTable dt = new DataTable();
            string sql = "select * from OrderTable where CustomId = " + customerId;
            dt = db.ExecuteReader(sql);
            return JsonConvert.SerializeObject(dt);
        }
        public static string getUnitValue(int id,string idName,string valueName,string tableName)
        {
            string sql = "select "+ valueName + " from "+ tableName + " where "+ idName + " = " + id;
            DataBase db = new DataBase();
            return db.ExecuteScalar(sql);

        }

    }
    public class Year
    {
        public string year { get; set; }
        public int value { get; set; }
    }
    public class branch
    {
        public int BranchId { get; set; }
        public string BranchName { get; set; }
        public int CityId { get; set; }
        public string lat { get; set; }
        public string lng { get; set; }
        public string CityName { get; set; }
    }


}

