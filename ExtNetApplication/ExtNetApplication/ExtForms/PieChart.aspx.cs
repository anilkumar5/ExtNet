using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

namespace ExtNetApplication.ExtForms
{
    public partial class PieChart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void ReloadData(object sender, DirectEventArgs e)
        {
            Store store = this.Chart1.GetStore();

            store.DataSource = ExtNetApplication.Services.Products.GetProducts();
            store.DataBind();
        }
    }
}