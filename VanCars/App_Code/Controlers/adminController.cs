using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Newtonsoft.Json;
using System.Web.Http.Cors;
using Glob;

namespace VanCars.App_Code.Controlers
{
    public class AdminController : ApiController
    {
        // GET: api/admin
        [EnableCors(origins: "*", headers: "*", methods: "*", exposedHeaders: "X-My-Header")]
        public string Get()
        {
                admin admin = new admin();
                int a = admin.checkCount();
                string b = JsonConvert.SerializeObject(a);
                return b;
        }

        // GET: api/admin/5
        [EnableCors(origins: "*", headers: "*", methods: "*", exposedHeaders: "X-My-Header")]
        public string Get(int id)
        {
            return GlobFuncs.getCountOrders(id);
        }

        // POST: api/admin
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/admin/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/admin/5
        public void Delete(int id)
        {
        }
    }
}
