using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Ext.Net;

namespace ExtNetApplication.ExtForms
{
    public partial class JobsData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!X.IsAjaxRequest)
            //{
            //    XElement document = XElement.Load(Server.MapPath("/Resources/DashboardSchema.xml"));
            //    string defaultIcon = document.Attribute("defaultIcon") != null ? document.Attribute("defaultIcon").Value : "";

            //    IEnumerable<object> query = from g in document.Elements("group")
            //                                select new
            //                                {
            //                                    Title = g.Attribute("title") != null ? g.Attribute("title").Value : "",
            //                                    Items = (from i in g.Elements("item")
            //                                             select new
            //                                             {
            //                                                 Title = i.Element("title") != null ? i.Element("title").Value : "",
            //                                                 Icon = i.Element("item-icon") != null ? i.Element("item-icon").Value : defaultIcon,
            //                                                 Id = i.Element("id") != null ? i.Element("id").Value : ""
            //                                             }
            //                                        )
            //                                };

            //    this.Store1.DataSource = query;
            //    this.Store1.DataBind();
            //}
        }
    }
}