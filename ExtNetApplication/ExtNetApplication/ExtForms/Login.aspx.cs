using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using System.Web.Security;

namespace ExtNetApplication.ExtForms
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Login login = new Login();
        }

        [DirectMethod]
        public string LoginUser()
        {
            string message = string.Empty;
            try
            {
                if (Membership.ValidateUser(txtUserName.Text.ToString(), txtPassword.Text.ToString()))
                {
                    Session["User"] = txtUserName.Text.ToString();
                    Response.Redirect("/ExtForms/Home.aspx");
                }
                else
                {
                    labelError.Hidden = false;
                    labelError.Text = "Invalid Username/Password";
                }
                return message = "User Created Successfully";
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
        [DirectMethod]
        public void RedirectToRegister()
        {
            Response.Redirect("/ExtForms/Account.aspx");

        }
    }

    public partial class Login
    {
        public string UserName { get; set; }
        public string UserAnil { get; set; }
    }
}