using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS_002
{
    public partial class SiteMaster : MasterPage
    {
        string profile = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(Session["user"] == null)
            {
                Session["user"] = "ผู้ใช้ภายนอก";
                lb_user.Text = Session["user"].ToString();
            }
            else
            {
                lb_user.Text = Session["user"].ToString();
            }
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {

        }
    }
}