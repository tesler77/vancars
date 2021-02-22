using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using Data;
using System.Data;
using Newtonsoft.Json;
using VanCars.App_Code;
using VanCars.App_Code.BLL;
using SearchBLL;

namespace Glob

{
    public static partial class GlobFuncs
    {
        public static string EncryptString(string plainText, string key)
        {
            byte[] iv = new byte[16];
            byte[] array;

            using (Aes aes = Aes.Create())
            {
                aes.Key = Encoding.UTF8.GetBytes(key);
                aes.IV = iv;

                ICryptoTransform encryptor = aes.CreateEncryptor(aes.Key, aes.IV);

                using (MemoryStream memoryStream = new MemoryStream())
                {
                    using (CryptoStream cryptoStream = new CryptoStream((Stream)memoryStream, encryptor, CryptoStreamMode.Write))
                    {
                        using (StreamWriter streamWriter = new StreamWriter((Stream)cryptoStream))
                        {
                            streamWriter.Write(plainText);
                        }

                        array = memoryStream.ToArray();
                    }
                }
            }

            return Convert.ToBase64String(array);

        }
        public static string decription(string inputText, string key)
        {
            byte[] iv = new byte[16];
            byte[] buffer = Convert.FromBase64String(inputText);
            Aes aes = Aes.Create();
            aes.Key = Encoding.UTF8.GetBytes(key);
            aes.IV = iv;
            ICryptoTransform decription = aes.CreateDecryptor(aes.Key, aes.IV);
            MemoryStream memoryStream = new MemoryStream(buffer);
            CryptoStream cryptoStream = new CryptoStream((Stream)memoryStream, decription, CryptoStreamMode.Read);
            StreamReader streamReader = new StreamReader((Stream)cryptoStream);
            return streamReader.ReadToEnd();
        }
        public static string createCreditCardId()
        {
            Double min = 100000000;
            Double max = 999999999;
            Random random = new Random();
            Double num = random.NextDouble() * (max - min) + min;
            string number = num.ToString();
            number = number.Replace('.', '5');
            DataBase db = new DataBase();
            string sql = "select id from CreditCardsTable where id = '" + number + "'";
            string ret = db.ExecuteScalar(sql);
            if (ret == "a")
            {
                return number;
            }
            else
            {
                createCreditCardId();
            }
            return number;
        }
        public static string getErrorText(int id)
        {
            string sql = "select text from errorsTable where id = " + id;
            DataBase dataBase = new DataBase();
            return dataBase.ExecuteScalar(sql);
        }
        public static string getChathMasseges(int id)
        {
            string sql = "select * from chathTable where customerId = " + id ;
            DataBase db = new DataBase();
            DataTable dt = new DataTable();
            dt = db.ExecuteReader(sql);
            return JsonConvert.SerializeObject(dt);
        }
        public static string getCustomerOrders(int id)
        {
            string sql = "select RentId from OrderTable where CustomId = " + id;
            DataBase db = new DataBase();
            DataTable dt = new DataTable();
            dt = db.ExecuteReader(sql);
            return JsonConvert.SerializeObject(dt);
        }
        public static List<Item> addMoreLine(List<Item> ddlList, string name)
        {
            ddlList.Add(new Item(9999, " להוספת" + name));
            return ddlList;
        }

        public static string getAllOrders()
        {
            DataBase db = new DataBase();
            string sql = "select RentId,CustomId,DateOrder,PickupDate,ReturnDate,branchs.Address+' '+citys.CityName as PickupBranch,companys .CompanyName from OrderTable inner join CompanysTable as companys on OrderTable.CompanyId = companys.CompanyId inner join BranchTable as branchs on OrderTable.PickupBranch = branchs.BranchId inner join CityTable as citys on branchs.CityId = citys.CityId order by RentId desc";
            DataTable dt = db.ExecuteReader(sql);
            return JsonConvert.SerializeObject(dt);
        }

        public static string getAllCustomers()
        {
            DataBase db = new DataBase();
            string sql = "select CustomId,FullName, Address + ' '+ citys.CityName as Address,Email,Phone,numberIncorrects from CustomersTable inner join CityTable as citys on CustomersTable.City = citys.CityId";
            DataTable dt = db.ExecuteReader(sql);
            return JsonConvert.SerializeObject(dt);
        }

        public static string getCountOrders(int days)
        {
            DataBase db = new DataBase();
            DataTable dt = new DataTable();
            DataColumn count = dt.Columns.Add("count", typeof(int));

            for (int i = 1; i < 4; i++)
            {
                string sql = "select COUNT(RentId) as count from OrderTable where DateOrder > GETDATE()-" + days + " and status = " + i;
                string ret = db.ExecuteScalar(sql);
                DataRow row = dt.NewRow();
                row["count"] = int.Parse(ret);
                dt.Rows.Add(row);
            }
            return JsonConvert.SerializeObject(dt);
        }

        public static List<Extention> convertExtensionToList(string ext)
        {
            DataTable table = new DataTable();
            table = JsonConvert.DeserializeObject<DataTable>(ext);
            List<Extention> extentions = new List<Extention>();
            if (table.Rows.Count > 0)
            {
                foreach (DataRow dr in table.Rows)
                {
                    extentions.Add(new Extention(int.Parse(dr["id"].ToString()), dr["description"].ToString(), int.Parse(dr["Price"].ToString())));
                }
            }
            return extentions;
        }

        public static string convertExtensionToString(List<Extention> extentions)
        {
            string temp = "";
            if (extentions.Count > 0)
            {
                foreach (Extention ext in extentions)
                {
                    temp += ext.id.ToString() + ",";
                }
                temp = temp.Substring(0, temp.Length - 1);
            }
            return temp;
        }

        public static DataTable getCarsApis()
        {
            string sql = "select CompanyId,ApiAddress from CompanysTable";
            DataBase db = new DataBase();
            DataTable table = db.ExecuteReader(sql);
            return table;
        }

        public static string getExtByOrderId(string orderId) {
            string sql = "select ExtentionId from ExtensInOrder where OrderId = " + orderId;
            DataBase db = new DataBase();
            DataTable table = db.ExecuteReader(sql);
            return JsonConvert.SerializeObject(table);
        }

        public static string getCreditCardOfOrder(int orderId)
        {
            string sql = "select creditCardId from OrderTable where RentId = " + orderId;
            DataBase db = new DataBase();
            return db.ExecuteScalar(sql);
        }

        public static string getExtenalOrderIdByOrderId(int orderId)
        {
            string sql = "select ExternalRentId from OrderTable where RentId = " + orderId;
            DataBase db = new DataBase();
            return db.ExecuteScalar(sql);
        }

        public static string[] getUnreadChats()
        {
            string sql = "select * from chathTable where orderId in ( select distinct orderId from chathTable where messageStatus = 1 ) order by orderId,sendDate";
            DataBase db = new DataBase();
            DataTable unRead = db.ExecuteReader(sql);
            sql = "select * from chathTable where orderId not in ( select distinct orderId from chathTable where messageStatus = 1 ) and orderId not in   ( select distinct orderId from chathTable where messageStatus = 4 ) order by orderId,sendDate";
            DataTable readed = db.ExecuteReader(sql);
            string[] ret = new string[2];
            ret[0] = JsonConvert.SerializeObject(unRead);
            ret[1] = JsonConvert.SerializeObject(readed);
            return ret;
        }
        public static void addSearch(string fromDate,string toDate,string fromLocation,string toLocation,int customId)
        {
            string sql = "insert into SearchTable (CustomerId,FromDate,FromLocation,ToLocation,ToDate) values(" + customId + ",'" + fromDate + "','" + fromLocation + "','" + toLocation + "','" + toDate + "')";
            DataBase db = new DataBase();
            db.ExecuteNonQuery(sql);
        }

        public static string getAllSearchesByUser(int userId)
        {
            string sql = "select * from UserSearchesView where CustomerId = " + userId + "ORDER BY searchDate DESC";
            DataBase db = new DataBase();
            DataTable dt = new DataTable();
            dt = db.ExecuteReader(sql);
            return JsonConvert.SerializeObject(dt);
        }
        public static searchBLL getSearchById(int id)
        {
            string sql = "select * from SearchTable where id = " + id;
            DataBase db = new DataBase();
            DataTable dt = db.ExecuteReader(sql);
            searchBLL search = new searchBLL(dt.Rows[0]["FromLocation"].ToString(), dt.Rows[0]["FromDate"].ToString(), dt.Rows[0]["ToLocation"].ToString(), dt.Rows[0]["ToDate"].ToString());
            return search;
        }

        public static DataTable getOrderDataByOrderId(int orderId)
        {
            DataBase db = new DataBase();
            string sql = "select * from FullOrdersDataView where RentId = " + orderId;
            return db.ExecuteReader(sql);
        }
    }
}

