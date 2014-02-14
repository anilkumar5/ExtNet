using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExtNetApplication.Services
{
    public class Products
    {
        public long TotalProduction { get; set; }
        public long Pending { get; set; }
        public long InProgress { get; set; }
        public string Name { get; set; }
        public int Data1 { get; set; }
        public int Data2 { get; set; }

        public static List<Products> GetProducts()
        {
            List<Products> listProducts = new List<Products>();
            Products products = null;
            for (int i = 0; i < 2; i++)
            {
                products = new Products();
                products.TotalProduction = 10;
                products.Pending = 20;
                products.InProgress = i;
                products.Name = "Name" + i;
                products.Data1 = 1 + i;
                products.Data2 = i + 23;
                listProducts.Add(products);
            }
            return listProducts;
        }
    }
}