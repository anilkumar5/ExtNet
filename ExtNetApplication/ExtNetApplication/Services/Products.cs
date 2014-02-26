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
            products = new Products();
            products.TotalProduction = 10;
            products.Pending = 20;
            products.InProgress = 1;
            products.Name = "Ok";
            products.Data1 = 2;
            products.Data2 = 23;
            listProducts.Add(products);

            products = new Products();
            products.TotalProduction = 10;
            products.Pending = 20;
            products.InProgress = 1;
            products.Name = "Warning";
            products.Data1 = 2;
            products.Data2 = 23;
            listProducts.Add(products);

            products = new Products();
            products.TotalProduction = 10;
            products.Pending = 20;
            products.InProgress = 1;
            products.Name = "Errors";
            products.Data1 = 2;
            products.Data2 = 23;
            listProducts.Add(products);

            return listProducts;
        }

        public static List<Products> GetBarProducts()
        {
            List<Products> listProducts = new List<Products>();
            Products products = null;

            products = new Products();
            products.Name = "January";
            products.Data1 = 6;
            products.Data2 = 2;
            listProducts.Add(products);

            products = new Products();
            products.Name = "February";
            products.Data1 = 2;
            products.Data2 = 3;
            listProducts.Add(products);

            products = new Products();
            products.Name = "March";
            products.Data1 = 8;
            products.Data2 = 4;
            listProducts.Add(products);

            products = new Products();
            products.Name = "April";
            products.Data1 = 4;
            products.Data2 = 5;
            listProducts.Add(products);
            return listProducts;
        }
    }
}