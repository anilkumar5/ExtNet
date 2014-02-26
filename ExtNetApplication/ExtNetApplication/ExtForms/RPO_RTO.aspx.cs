using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using ExtNetApplication.Models;

namespace ExtNetApplication.ExtForms
{
    public partial class RPO_RTO : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                this.Store1.DataSource = this.Data;
                this.Store1.DataBind();
            }

        }
        //private object[] Data
        //{
        //    get
        //    {
        //        return new object[]
        //    {
        //        new object[] { "Gold", "8 Hours", "20 Minutes", "3 Month", "Gold Service" },
        //        new object[] { "Silver", "12 Hours","40 Minutes","6 Months", "Silver service" },
        //        new object[] { "Bronze","24 Hours", "60 Minutes", "1 year" ,"Bronze"},
        //    };
        //    }
        //}

        private RpoRto[] Data
        {
            get
            {
                return new RpoRto[]
            {
                new RpoRto { Name= "Gold", Rpo= "8 Hours",Rto= "20 Minutes",ManualTest= "3 Month",Description= "Gold Service" },
                new RpoRto {   Name="Silver",Rpo= "12 Hours",Rto="40 Minutes",ManualTest="6 Months",Description= "Silver service" },
                new RpoRto { Name="Bronze",Rpo="24 Hours", Rto="60 Minutes",ManualTest= "1 year" ,Description="Bronze"},
            };
            }
        }
    }
}