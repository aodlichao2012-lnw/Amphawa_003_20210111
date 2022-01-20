using LMS_002.DbContext_db;
using LMS_002.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS_002.Admin
{
    public partial class Member_module : System.Web.UI.Page
    {

        DataTable dt = new DataTable();
        string sql = "";
        string profile = "";
        string count_book = "";
        string img_book = "";
        string id_book = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                gdv_Role_admin.DataSource = Conncetions_db.Instance.Connection_command("SELECT [int_id], [st_user], [st_email], [st_type_cus] FROM [MD_Account] where st_user != 'suparat004' ");
                gdv_Role_admin.DataBind();
            }
        }

        protected void gdv_Role_admin_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gdv_Role_admin_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gdv_Role_admin_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void doSearch_ServerClick(object sender, EventArgs e)
        {

            string select = $@"SELECT [int_id], [st_user], [st_email], [st_type_cus] FROM [MD_Account] 
                                                                   WHERE {Types.Value} LIKE 
                                                                 ";

            gdv_Role_admin.DataSourceID = null;
            List<MD_catralog_book> cs = new List<MD_catralog_book>();
            if (Types.Value != "")
            {
                if (keywords.Value != "")
                {
                    switch (Types.Value)
                    {
                        case "st_user":
                            select += $" '%{ keywords.Value }%' ";

                            break;
                        case "st_type_cus":
                            select += $" '%{ keywords.Value }%' ";
                            break;

                    }
                    dt = Conncetions_db.Instance.Connection_command(@"" + select + "");
                    gdv_Role_admin.DataSource = dt;
                    gdv_Role_admin.DataBind();
                }
            }
        }
    }
}