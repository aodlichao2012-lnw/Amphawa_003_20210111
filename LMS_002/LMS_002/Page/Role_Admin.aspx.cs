using LMS_002.DbContext_db;
using LMS_002.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS_002.Page
{
    public partial class Role_Admin : System.Web.UI.Page
    {
            MD_Account  md_account = new MD_Account();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gdv_Role_admin_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btn_back_ServerClick(object sender, EventArgs e)
        {

        }

        protected void btn_save_ServerClick(object sender, EventArgs e)
        {
            if (txt_login.Value != "" && txt_password.Value == txt_compare.Value)
            {
                using (var db = new Dbcon_wan())
                {
                    md_account.st_user = txt_login.Value;
                    md_account.st_password = txt_password.Value;
                    md_account.st_email = txt_Email.Value;
                    md_account.int_type_cus = ddl_role.SelectedValue.ToString().Equals("") ?  3 : Convert.ToInt32(ddl_role.SelectedValue.ToString());
                    db.tb_account.Add(md_account);
                    db.SaveChanges();
                    Response.Write(@"<script>alert('บันทึกเรียบร้อย')</script>");


                }

            }
            else
            {
                Response.Write(@"<script>alert('กรุณากรอกข้อมูลให้ครบ')</script>");
            }
        }
    }
}