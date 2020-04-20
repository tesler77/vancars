using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Data
{
    public class DataBase
    {
        public string ConnStr { get; set; }
        public SqlConnection con { get; set; }
        public SqlCommand cmd { get; set; }
        public SqlDataReader dr { get; set; }
        public SqlDataAdapter da { get; set; }
        

        public DataBase()
        {
            ConnStr = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
            con = new SqlConnection(ConnStr);
            con.Open();
        }
        public void open()
        {
            con.Open();
        }
        public void close()
        {
            con.Close();
        }
        public DataTable ExecuteReader(string sql)
        {
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            cmd = new SqlCommand(sql, con);            
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);            
            return dt;
            }
        public int ExecuteNonQuery(string sql)
        {
            int reccount = 0;
            cmd = new SqlCommand(sql, con);
            reccount = cmd.ExecuteNonQuery();
            cmd.Dispose();
            return reccount;
        }
        public int GetMaxId(string TableName, string PrimaryKeyName)
        {
            int MaxId = 0;
            string sql = "select max(" + PrimaryKeyName + ") from " + TableName;
            cmd = new SqlCommand(sql, con);
            MaxId = (int)cmd.ExecuteScalar();
            cmd.Dispose();
            return MaxId;
        }
        public string ExecuteScalar( string sql) 
        {
            cmd = new SqlCommand(sql, con);
            if (cmd.ExecuteScalar() != null)
            {
                string scalar = cmd.ExecuteScalar().ToString();
                cmd.Dispose();
                return scalar;
            }
            else
            {
                cmd.Dispose();
                return "a";
            }
        }
        public int CheckPass(string sql)
        {
            cmd = new SqlCommand(sql, con);
            int simpleValue = (int)cmd.ExecuteScalar();
            cmd.Dispose();
            return simpleValue;
        }
        //public void aaa(string sql)
        //{
        //    cmd = new SqlCommand(sql, con);
        //    dr = cmd.ExecuteReader();
        //    if (dr.Read())
        //    {
        //        int a = 1;
        //    }
        //}
    }
}