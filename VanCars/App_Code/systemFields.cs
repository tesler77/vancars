using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Data;
using System.Data;
using Glob;

namespace configurationFields
{
    public static class systemFields
    {
        public static company getComapnyData(int id)
        {
            DataBase db = new DataBase();
            DataTable dt = new DataTable();
            string sql = "select * from CompanysTable where CompanyId = " + id ;
            dt = db.ExecuteReader(sql);
            company company = new company();
            company.CompanyId = id;
            company.CompanyName = dt.Rows[0]["CompanyName"].ToString();
            company.logo = dt.Rows[0]["logo"].ToString();
            company.contact = dt.Rows[0]["contact"].ToString();
            company.siteAddress = dt.Rows[0]["siteAddress"].ToString();
            company.apiAddress = dt.Rows[0]["apiAddress"].ToString();
            company.remarks = dt.Rows[0]["remarks"].ToString();
            return company;
        }
        public static int saveCompany(company company)
        {
            DataBase db = new DataBase();
            string sql;
            if(company.CompanyId == 0)
            {
                sql = "insert into CompanysTable (CompanyName,Logo,Contact,SiteAddress,ApiAddress,Remarks) values ('" + company.CompanyName + "','" + company.logo + "','" + company.contact + "','" + company.siteAddress + "','" + company.apiAddress + "','" + company.remarks + "')";
            }
            else
            {
                sql = "update CompanysTable set CompanyName = '" + company.CompanyName + "',Logo = '" + company.logo + "',Contact = '" + company.contact + "',SiteAddress = '" + company.siteAddress + "',ApiAddress = '" + company.apiAddress + "',Remarks = '" + company.remarks + "' where CompanyId = " + company.CompanyId;
            }
            int successFlag = db.ExecuteNonQuery(sql);
            if(successFlag > 0)
            {
                return db.GetMaxId("CompanysTable", "CompanyId");
            }
            return -1;
        }

        public static branch getBranchData(int id)
        {
            DataBase db = new DataBase();
            string sql = "select * from BranchTable where BranchId = " + id;
            DataTable dt = db.ExecuteReader(sql);
            branch branch = new branch();
            branch.BranchId = id;
            branch.CityId = int.Parse(dt.Rows[0]["CityId"].ToString());
            branch.Address = dt.Rows[0]["Address"].ToString();
            branch.Phone = dt.Rows[0]["Phone"].ToString();
            return branch;
        }

        public static int saveBranchData(branch branch)
        {
            DataBase db = new DataBase();
            string sql;
            if(branch.BranchId == 0)
            {
                sql = "insert into BranchTable(CompanyId,CityId,Address,Phone) values (" + branch.CompanyId + "," + branch.CityId + ",'" + branch.Address + "','" + branch.Phone + "')";
            }
            else
            {
                sql = "update BranchTable set CompanyId = " + branch.CompanyId + ",CityId = " + branch.CityId + ",Address = '" + branch.Address + "',Phone = '" + branch.Phone + "' where BranchId = " + branch.BranchId;
            }
            int successFlag = db.ExecuteNonQuery(sql);
            if (successFlag > 0)
            {
                return db.GetMaxId("BranchTable", "BranchId");
            }
            return -1;
        }

        public static string getCityName(int id)
        {
            DataBase db = new DataBase();
            string sql = "select CityName from CityTable where CityId = " + id;
            return db.ExecuteScalar(sql);
        }

        public static int saveCityData(city city)
        {
            DataBase db = new DataBase();
            string sql;
            if(city.CityId == 0)
            {
                sql = "insert into CityTable(CityId,CityName)values (" + city.CityId + ",'" + city.CityName + "')";
            }
            else
            {
                sql = "update CityTable set CityName = '" + city.CityName + "' where CityId = " + city.CityId;
            }
            int successFlag = db.ExecuteNonQuery(sql);
            if (successFlag > 0)
            {
                return db.GetMaxId("CityTable", "CityId");
            }
            return -1;
        }

        public static string getCarLevelName(int id)
        {
            DataBase db = new DataBase();
            string sql = "select LevelName from CarLevelTable where IdLevel = " + id;
            return db.ExecuteScalar(sql);
        }

        public static int saveCarLevelData(carLevel carLevel)
        {
            DataBase db = new DataBase();
            string sql;
            if (carLevel.IdLevel == 0)
            {
                sql = "insert into CarLevelTable(IdLevel,LevelName)values (" + carLevel.IdLevel + ",'" + carLevel.LevelName + "')";
            }
            else
            {
                sql = "update CarLevelTable set LevelName = '" + carLevel.LevelName + "' where IdLevel = " + carLevel.IdLevel;
            }
            int successFlag = db.ExecuteNonQuery(sql);
            if (successFlag > 0)
            {
                return db.GetMaxId("CarLevelTable", "IdLevel");
            }
            return -1;
        }
    }

    public class company
    {
        public int CompanyId { get; set; }
        public string CompanyName { get; set; }
        public string logo { get; set; }
        public string contact { get; set; }
        public string siteAddress { get; set; }
        public string apiAddress { get; set; }
        public string remarks { get; set; }
    }

    public class branch
    {
        public int BranchId { get; set; }
        public int CompanyId { get; set; }
        public int CityId { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
    }

    public class city
    {
        public int CityId { get; set; }
        public string CityName { get; set; }
    }

    public class carLevel
    {
        public int IdLevel { get; set; }
        public string LevelName { get; set; }
    }
}