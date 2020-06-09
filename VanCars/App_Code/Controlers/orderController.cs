using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using VanCars.App_Code;
using System.Web.Http.Cors;

namespace VanCars.App_Code.Controlers
{
    public class orderController : ApiController
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
            order order = new order(){ RentId = id};            
            return order.getOrder();
        }

        // POST api/<controller>
        public void Post([FromBody]string value)
        {
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}