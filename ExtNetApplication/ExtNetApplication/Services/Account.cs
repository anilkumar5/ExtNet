using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using Ext.Net;

namespace ExtNetApplication.Services
{
    public class Account
    {
        
        public static void Logout()
        {
            FormsAuthentication.SignOut();
            HttpContext.Current.Session.Abandon();
        }

        
    }
}