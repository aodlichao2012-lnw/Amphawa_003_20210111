using LMS_002.DbContext_db;
using LMS_002.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS_002.Page
{
    public partial class Login : System.Web.UI.Page
    {
          MD_Account  md_account = new MD_Account();
        protected void Page_Load(object sender, EventArgs e)
        {
            using (var db = new Dbcon_wan())
            {
                var cs = db.tb_account.ToList();
            }
       }

            protected void btn_save_ServerClick1(object sender, EventArgs e)
        {
            if (txt_login.Value != "" )
            {
                using (var db = new Dbcon_wan())
                {

                   var result = db.tb_account.Any(s => s.st_user == txt_login.Value && s.st_password == txt_password.Value);
                    if(result)
                    {
                        Session["user"] = txt_login.Value;
                        Response.Redirect(@"~/Page/List_book.aspx");
                    }
                    


                }

            }
            else
            {
                Response.Write(@"<script>alert('กรุณากรอกข้อมูลให้ครบ')</script>");
            }
        }
    }
}