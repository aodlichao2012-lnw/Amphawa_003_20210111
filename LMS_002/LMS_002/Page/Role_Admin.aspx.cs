using LMS_002.DbContext_db;
using LMS_002.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS_002.Page
{
    public partial class Role_Admin : System.Web.UI.Page
    {
            MD_Account  md_account = new MD_Account();
        string user_  = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
               
            }
          
        }

        protected void gdv_Role_admin_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int id = int.Parse(gdv_Role_admin.DataKeys[index].Value.ToString());
            if(e.CommandName == "edit")
            {
                pn_edit_role.Visible = true;
                gdv_Role_admin.Visible = false;
                if (Session["user"] != null)
                {
                    user_ = Session["user"].ToString();
                }
                using (var db_ = new Dbcon_wan())
                {
                    md_account = db_.tb_account.Where(a => a.int_id == id).FirstOrDefault();
                    Session["id_Accont"] = md_account.int_id;
                    txt_login.Value = md_account.st_user;
                    txt_password.Value = md_account.st_password;
                    txt_Email.Value = md_account.st_email;
                    ddl_role.SelectedValue = md_account.int_type_cus.ToString();
                }
            }
            else if(e.CommandName =="delete")
            {
                try
                {
                    using (var db_ = new Dbcon_wan())
                    {
                        var ids = db_.tb_account.Where(a => a.int_id == id).Select(a => a.int_id).FirstOrDefault();
                        db_.tb_account.SqlQuery("delete from [dbo].[MD_Account] where int_id = " + id + "").ToList();
                    }
                }
                catch
                {
                    Response.Write(@"<script>alert('ลบเรียบร้อย')</script>");
                    Response.Redirect("~/Page/Role_Admin.aspx");
                }
               
            }
        }

        protected void btn_back_ServerClick(object sender, EventArgs e)
        {

            pn_edit_role.Visible = false;
            gdv_Role_admin.Visible = true;
        }

        protected void btn_save_ServerClick(object sender, EventArgs e)
        {
            if (txt_login.Value != "" && txt_password.Value == txt_compare.Value)
            {
                using (var db = new Dbcon_wan())
                {
                    try
                    {
                        var result = db.tb_account.Any(s => s.st_user == txt_login.Value);
                        if (result)
                        {
                            Response.Write(@"<script>alert('มีผู้ใช้อยู่แล้ว')</script>");
                        }

                        string user = txt_login.Value;
                        string st_password = txt_password.Value;
                        string st_email = txt_Email.Value;
                        string st_type_cus = ddl_role.SelectedItem.Text;
                        if(Session["user"].ToString() == user)
                        {
                            Session["user"] = user;
                        }
                        
                        int int_type_cus = ddl_role.SelectedValue.ToString().Equals("") ? 3 : Convert.ToInt32(ddl_role.SelectedValue.ToString());
                      var cs =   db.tb_account.SqlQuery(@" UPDATE [dbo].[MD_Account] SET st_user = '"+user+"' , " +
                            "st_password = '"+st_password+"' , st_email = '"+st_email+"' ,int_type_cus = "+int_type_cus+" , st_type_cus = '"+st_type_cus+"' where int_id = "+Session["id_Accont"].ToString()+" ").ToList();
                        Response.Write(@"<script>alert('บันทึกเรียบร้อย')</script>");
                        Response.Redirect(@"~/Page/Role_Admin.aspx");
                    }
                    catch(Exception ex)
                    {
                        Response.Write(@"<script>alert('บันทึกเรียบร้อย')</script>");
                        Response.Redirect("~/Page/List_book.aspx");
                    }
                }


                }

            
            else
            {
                Response.Write(@"<script>alert('กรุณากรอกข้อมูลให้ครบ')</script>");
            }
        }

        //protected void btn_edit_Click(object sender, EventArgs e)
        //{
        //    pn_edit_role.Visible = true;
        //    gdv_Role_admin.Visible = false;
        //    var  datarow = gdv_Role_admin.SelectedRow.FindControl("int_id");
        //}

        //protected void btn_delete_Click(object sender, EventArgs e)
        //{

        //}

        //protected void btn_edit_Click1(object sender, ImageClickEventArgs e)
        //{
        //    pn_edit_role.Visible = true;
        //    gdv_Role_admin.Visible = false;
        //    var selectrow = gdv_Role_admin.SelectedRow.Cells[0];
        //}

        //protected void btn_delete_Click1(object sender, ImageClickEventArgs e)
        //{

        //}
    }
}