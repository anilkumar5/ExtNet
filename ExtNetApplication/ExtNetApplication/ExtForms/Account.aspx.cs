using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace ExtNetApplication.ExtForms
{
    public partial class Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [DirectMethod]
        public string RegisterUser()
        {
            string message = string.Empty;
            try
            {
                Membership.CreateUser(txtUser.Value.ToString(), txtPassword.Value.ToString(), txtEmail.Value.ToString());
                txtUser.Text = string.Empty;
                txtPassword.Text = string.Empty;
                txtEmail.Text = string.Empty;
                txtConfirmPassword.Text = string.Empty;
                return message = "User Created Successfully <a href='/ExtForms/Login.aspx'>Go to login page</a>";
            }
            catch (Exception ex)
            {
                return message = ex.Message;
            }
        }


        protected void ValidateControl(object sender, RemoteValidationEventArgs e)
        {
            TextField textField = (TextField)sender;
            if (string.IsNullOrEmpty(textField.Text))
            {
                e.Success = false;
                e.ErrorMessage = "Required";
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
                if (textField.Text == this.txtPassword.Text)
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