using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace YardSalez.YardSale
{
    public class YardSaleController : ApiController
    {
        [HttpOptions]
        [AcceptVerbs("GET", "OPTIONS")]
        public HttpResponseMessage Get()
        {
            var yardSales = new List<YardSale>{
                new YardSale
                {
                    Name = "PGH .NET Yard Sale 2014",
                    Date = new DateTime(),
                    Location = "1251 Waterfront Place Second Floor",
                    Items = new List<Item>
                        { new Item{ Name = "broken picture frame" },
                         new Item{ Name = "ugly christmas sweater" },
                         new Item{ Name = "my dog" }}
                }
            };
            return Request.CreateResponse(yardSales);
        }
        public HttpResponseMessage Get(int id)
        {
            return Request.CreateResponse(new YardSale
            {
                Name = "PGH .NET Yard Sale 2014",
                Date = new DateTime(),
                Location = "1251 Waterfront Place Second Floor",
                Items = new List<Item>
                    { new Item{ Name = "broken picture frame" },
                     new Item{ Name = "ugly christmas sweater" },
                     new Item{ Name = "my dog" }}
            });
        }
    }

    public class YardSale
    {
        public string Name { get; set; }
        public DateTime Date { get; set; }
        public string Location { get; set; }
        public List<Item> Items { get; set; }
    }

    public class Item
    {
        public string Name { get; set; }
    }
}
