using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using System.Web.Security;

namespace ExtNetApplication.RemoteServices
{
    /// <summary>
    /// Summary description for ValidationService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    [ScriptService]
    public class ValidationService : System.Web.Services.WebService
    {
        [WebMethod]
        public object IsUserExist(string id, string value)
        {
            bool success = true;
            string user = Membership.GetUser(value) != null ? Membership.GetUser(value).UserName : string.Empty;
            if (!string.IsNullOrEmpty(user))
            {
                success = false;
            }
            //bool success = value == "Valid";
            //System.Threading.Thread.Sleep(1000);
            return new { valid = success, message = success ? "" : "User Already exists" };
        }
    }
}
