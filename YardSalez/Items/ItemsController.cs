using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace YardSalez.Items
{
    public class ItemsController : ApiController
    {
        private readonly IList<Item> _items = new List<Item>(); 

        public IEnumerable<Item> Get()
        {
            return _items;
        }

        public Item Get(int id)
        {
            return _items.FirstOrDefault(x => x.Id == id);
        }

        public void Post([FromBody]Item item)
        {
            _items.Add(item);
        }

        public void Put(int id, [FromBody]string value)
        {
            throw new NotImplementedException();
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }
    }
}
