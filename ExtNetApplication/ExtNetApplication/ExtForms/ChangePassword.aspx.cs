using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Ext.Net;

namespace ExtNetApplication.ExtForms
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void ChangeUserPassword()
        {
            MembershipUser user = Membership.GetUser(User.Identity.Name);
            if (user.ChangePassword("", ""))
            {

            }
        }
        protected void MatchPassword(object sender, RemoteValidationEventArgs e)
        {
            TextField textField = (TextField)sender;
            if (string.IsNullOrEmpty(textField.Text))
            {
                e.Success = false;
                e.ErrorMessage = "Required";
            }
            else
            {
                if (textField.Text == this.txtNewPassword.Text)
                {
                    e.Success = true;
                }
                else
                {
                    e.Success = false;
                    e.ErrorMessage = "Password and cofirm password must match";
                }

            }
        }
    }
}