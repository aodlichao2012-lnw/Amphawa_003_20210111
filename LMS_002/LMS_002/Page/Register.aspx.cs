using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS_002.Page
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_save_ServerClick(object sender, EventArgs e)
        {

        }

        protected void btn_back_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Page/Login.aspx");
        }
    }
}