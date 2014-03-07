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

        protected void IsValidPassword(object sender, RemoteValidationEventArgs e)
        {
            TextField textField = (TextField)sender;
            if (string.IsNullOrEmpty(textField.Text))
            {
                e.Success = false;
                e.ErrorMessage = "You forget to enter your old password?";
            }
            else
            {
                e.Success = true;
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
                if (!string.IsNullOrEmpty(txtNewPassword.Text))
                {
                    if (txtNewPassword.Text == txtConfirmNewPassword.Text)
                    {
                        e.Success = true;
                    }
                    else
                    {
                        e.Success = false;
                        e.ErrorMessage = "New password and confirm new password must match.";
                    }
                }
                else
                {
                    e.Success = false;
                    e.ErrorMessage = "Please enter new pasword first!";
                }
            }
        }

        [DirectMethod]
        public void ChangePasswords()
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Session["User"])))
            {
                MembershipUser user = Membership.GetUser(Session["User"].ToString(), false);
                if (!string.IsNullOrEmpty(txtOldPassword.Text) && !string.IsNullOrEmpty(txtNewPassword.Text))
                {
                    if (user.ChangePassword(txtOldPassword.Text, txtNewPassword.Text))
                    {
                        Response.Redirect("/ExtForms/Home.aspx");
                    }
                    else
                    {
                        this.lblError.Text = "Unable to change password";
                    }
                }
                else
                {
                    this.lblError.Text = "Please fill all fields.";
                }
            }
            else
            {
                Response.Redirect("/ExtForms/Login.aspx");
            }
        }

    }
}