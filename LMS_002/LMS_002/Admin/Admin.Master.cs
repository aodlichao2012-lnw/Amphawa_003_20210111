using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS_002.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void login_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect(@"~/Page/Login.aspx");
        }

        protected void logout_login_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect(@"~/Page/Login.aspx");
        }
    }
}