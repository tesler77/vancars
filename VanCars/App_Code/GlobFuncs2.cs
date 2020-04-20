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

namespace Glob

{
    public static partial class GlobFuncs
    {
        public static string EncryptString(string plainText,string key )
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
            public static string decription(string inputText,string key)
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
            Double num =  random.NextDouble() * (max - min) + min;
            string number = num.ToString();
            number = number.Replace('.','5');
            DataBase db = new DataBase();
            string sql = "select id from CreditCardsTable where id = '" + number +"'";
            string ret = db.ExecuteScalar(sql);
            if(ret == "a")
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
            string sql = "select * from chathTable where customerId = " + id;
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
        
    }
}

