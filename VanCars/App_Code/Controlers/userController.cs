using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DAL;
using System.Web.Http.Cors;

namespace VanCars.App_Code.Controlers
{
    public class userController : ApiController
    {
        // GET api/<controller>
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        [EnableCors(origins: "*", headers: "*", methods: "*", exposedHeaders: "X-My-Header")]
        public string Get(int id)
        {
            UserDAL user = new UserDAL();
            return user.getUserData(id);
        }

        // POST api/<controller>
        public void Post([FromBody]string value)
        {
        }

        // PUT api/<controller>/5
        [EnableCors(origins: "*", headers: "*", methods: "*", exposedHeaders: "X-My-Header")]
        public void Put(int id)
        {
            UserDAL user = new UserDAL();
            user.releaseUser(id);
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}