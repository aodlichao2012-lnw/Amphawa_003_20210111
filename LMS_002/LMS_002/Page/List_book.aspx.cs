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
    public partial class List_book : System.Web.UI.Page
    {
        MD_catralog_book mD_Catralog_ = new MD_catralog_book();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchCatalog_ServerClick(object sender, EventArgs e)
        {
            try
            {
                using (var db = new Dbcon_wan())
                {
                    mD_Catralog_.st_name_book = txt_name_book.Value;
                    mD_Catralog_.st_ISBN_ISSN = txt_iss_num.Value;

                    GridView1.DataSourceID = null;
                     List<MD_catralog_book> cs = new List<MD_catralog_book>();
                    if(Type.Value != "")
                    {
                        if (txt_iss_num.Value != "")
                        {
                            cs = db.tb_cattalog.Where(s => s.st_name_book.Contains(txt_iss_num.Value) && s.st_type_book == tx).ToList();
                        }
                        else if (txt_name_book.Value != "")
                        {
                            cs = db.tb_cattalog.Where(s => s.st_name_book.Contains(txt_name_book.Value)).ToList();
                        }
                        else
                        {

                        }
                    }
                    
                   
                    
                    GridView1.DataSource = cs;
                    GridView1.DataBind();

                }


            }
            catch
            {

            }
        }

        protected void clear_ServerClick(object sender, EventArgs e)
        {
            try
            {

            }
            catch
            {

            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void sendto_lend_ServerClick(object sender, EventArgs e)
        {
            try
            {
               var cs = GridView1.SelectedRow;

            }
            catch
            {

            }
        }

        protected void clear_list_ServerClick(object sender, EventArgs e)
        {
            try
            {
                GridView1_RowCancelingEdit("" , null);
            }
            catch
            {

            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                GridView1.EditIndex = e.NewEditIndex;
                this.DataBind();
            }
            catch
            {

            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                GridView1.EditIndex = -1;
                 this.DataBind();
            }
            catch
            {

            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                CheckBox checkBox = e.Row.Cells[0].Controls[0] as CheckBox;
                checkBox.Enabled = true;
            }
        }
    }
}