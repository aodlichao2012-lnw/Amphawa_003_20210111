﻿using LMS_002.DbContext_db;
using LMS_002.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS_002.Page
{
    public partial class List_book : System.Web.UI.Page
    {
        MD_catralog_book mD_Catralog_ = new MD_catralog_book();
        string sql = "";
        string profile = "";
        string count_book = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                using (var db = new Dbcon_wan())
                {
                    //sql = "SELECT top 5 st_ISBN_ISSN , " +
                    //    "[int_id_catalog_book],[st_name_book], " +
                    //    "dbo.MD_statusbook.status_book as statusbook " +
                    //    ",[st_detail_book], format( [dt_DATE_modify]  " +
                    //    " , 'dd MMM yyyy' , 'th-TH') as dt_DATE_modify" +
                    //    "  ,[MD_Account_int_id],[st_type_book],[st_type_book_name] " +
                    //    ", bool_current FROM [dbo].[MD_catralog_book]  order by dt_DATE_modify DESC";

                    GridView1.DataSource = (from db_ in db.tb_cattalog
                                            where db_.int_cheeckin_out != 3
                                            join status in db.tb_statusbooks on db_.int_cheeckin_out equals status.self_id
                                            select new
                                            {
                                                status.status_book,
                                                db_.bool_current
,
                                                db_.dt_DATE_modify,
                                                db_.st_ISBN_ISSN,
                                                db_.st_name_book,
                                                db_.st_detail_book,
                                                db_.st_type_book_name,
                                                db_.int_id_catalog_book,
                                                db_.st_type_book
                                            }).ToList();
                    GridView1.DataBind();

                }
            }

            if (Session["user"] != null)
            {
                 ld_profile.Text = Session["user"].ToString();
                profile = Session["user"].ToString();
            }
            else
            {
                Session["user"] = "ผู้ใช้ภายนอก โปรด Login เพื่อเข้าสู่ระบบ";
                ld_profile.Text = "ผู้ใช้ภายนอก";
            }
              var  result = Conncetions_db.Connection_command("select count(*) as total from [dbo].[MD_catralog_book] where  int_cheeckin_out = 3 AND st_process_name_user = '"+profile+"' ");
            if(Session["roleid"] == null)
            {
                sendto_lend.Visible = false;
                foreach (GridViewRow gvrow in GridView1.Rows)
                {

                    CheckBox chk = (CheckBox)gvrow.FindControl("chkrows");
                    chk.Visible = false;
                }
                clear_list.Visible = false;
            }
            else if (Session["roleid"].ToString() == "3")
            {
                sendto_lend.Visible = false;
                foreach (GridViewRow gvrow in GridView1.Rows)
                {

                    CheckBox chk = (CheckBox)gvrow.FindControl("chkrows");
                     chk.Visible = false;
                }
                clear_list.Visible =false;
               

            }
         
            ld_count.Text  = result.Rows[0]["total"].ToString();
           
          
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
                    if(Types.Value != "")
                    {
                        if (txt_iss_num.Value != "")
                        {
                            //cs = db.tb_cattalog.Where(s => s.st_ISBN_ISSN.Contains(txt_iss_num.Value) && s.st_type_book == Type.SelectedIndex).ToList();
                            //    GridView1.DataSource = cs;
                            GridView1.DataSource = (from db_ in db.tb_cattalog
                                                    where db_.st_type_book == Types.SelectedIndex 
                                                    where db_.st_ISBN_ISSN.Contains(txt_iss_num.Value)
                                                      where db_.int_cheeckin_out != 3
                                                    join status in db.tb_statusbooks on db_.int_cheeckin_out equals status.self_id
                                                    select new
                                                    {
                                                        status.status_book,
                                                        db_.bool_current
,
                                                        db_.dt_DATE_modify,
                                                        db_.st_ISBN_ISSN,
                                                        db_.st_name_book,
                                                        db_.st_detail_book,
                                                        db_.st_type_book_name,
                                                        db_.int_id_catalog_book,
                                                        db_.st_type_book
                                                    }
                                                  ).ToList();
                            GridView1.DataBind();
                        }
                        else if (txt_name_book.Value != "")
                        {
                            //cs = db.tb_cattalog.Where(s => s.st_name_book.Contains(txt_name_book.Value) && s.st_type_book == Type.SelectedIndex).ToList();
                            //    GridView1.DataSource = cs;
                            GridView1.DataSource = (from db_ in db.tb_cattalog
                                                    where db_.st_type_book == Types.SelectedIndex
                                                      where db_.int_cheeckin_out != 3
                                                    where db_.st_ISBN_ISSN.Contains(txt_iss_num.Value)
                                                    join status in db.tb_statusbooks on db_.int_cheeckin_out equals status.self_id
                                                    select new
                                                    {
                                                        status.status_book,
                                                        db_.bool_current
,
                                                        db_.dt_DATE_modify,
                                                        db_.st_ISBN_ISSN,
                                                        db_.st_name_book,
                                                        db_.st_detail_book,
                                                        db_.st_type_book_name,
                                                        db_.int_id_catalog_book,
                                                        db_.st_type_book
                                                    }
                                                ).ToList();
                            GridView1.DataBind();
                        }
                        else
                        {
                            GridView1.DataSource = (from db_ in db.tb_cattalog
                                                    where db_.st_type_book  == Types.SelectedIndex
                                                      where db_.int_cheeckin_out != 3
                                                     where db_.st_name_book.Contains(txt_name_book.Value)
                                                    join status in db.tb_statusbooks on db_.int_cheeckin_out equals status.self_id
                                                    select new
                                                    {
                                                        status.status_book,
                                                        db_.bool_current
,
                                                        db_.dt_DATE_modify,
                                                        db_.st_ISBN_ISSN,
                                                        db_.st_name_book,
                                                        db_.st_detail_book,
                                                        db_.st_type_book_name,
                                                        db_.int_id_catalog_book,
                                                        db_.st_type_book
                                                    }
                                                   ).ToList();
                            GridView1.DataBind();
                            // SqlDataSource1.DataBind();

                        }
                    }
                    
                   
                    
               
                    GridView1.DataBind();

                }


            }
            catch(Exception ex)
            {
                ex.Message.ToString();
            }
        }

        protected void clear_ServerClick(object sender, EventArgs e)
        {
            try
            {
              Response.Redirect(@"~/Page/List_book.aspx");
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
                foreach (GridViewRow gvrow in GridView1.Rows)
                {
                    using (var db = new Dbcon_wan())
                    {

                        CheckBox chk = (CheckBox)gvrow.FindControl("chkrows");
                        if (chk != null & chk.Checked)
                        {
                            var id = Convert.ToInt32( gvrow.Cells[1].Text);

                            //                           var update = (from db_ in db.tb_cattalog

                            //                                                    where db_.int_id_catalog_book == id
                            //                                                    join status in db.tb_statusbooks on db_.int_cheeckin_out equals status.self_id
                            //                                                    select new
                            //                                                    {
                            //                                                        status.status_book,
                            //                                                        db_.bool_current
                            //,
                            //                                                        db_.dt_DATE_modify,
                            //                                                        db_.st_ISBN_ISSN,
                            //                                                        db_.st_name_book,
                            //                                                        db_.st_detail_book,
                            //                                                        db_.st_type_book_name,
                            //                                                        db_.int_id_catalog_book,
                            //                                                        db_.st_type_book
                            //                                                    }

                            //
                            //   ).FirstOrDefault();
                            try
                            {
                                var update = Conncetions_db.Connection_command(  @"UPDATE [dbo].[MD_catralog_book] SET  [int_cheeckin_out] = 3 ,[st_cheeckin_out] = 'เตรียมพร้อมเพื่อยืม' , st_process_name_user
                           = '"+profile+"' WHERE int_id_catalog_book = " + id + "");
                            }
                            catch
                            {
                                Response.Redirect(@"<script>alert('หนังสือที่ท่านเลือก ได้ถูกเตรียมที่จะยืมแล้ว')</script>");
                            }
                           
                            
                          
                        }
                    }
                }
                GridView1.DataBind();
                Response.Redirect(@"~/Page/List_book.aspx");
                //foreach (GridViewRow row in GridView1.Rows)
                //{
                //    //CheckBox chk = row.Cells[0].Controls[0] as CheckBox;
                //    //if (chk != null && chk.Checked)
                //    //{
                //    //    // ...
                //    //}
                //    CheckBox chkbox = (CheckBox)row.FindControl("chk_select");
                //    if (chkbox.Checked == true)
                //    {
                //        // Your Code
                //    }
                //}

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
                using (var db = new Dbcon_wan())
                {
                    GridView1.DataSource = (from db_ in db.tb_cattalog
                                              where db_.int_cheeckin_out != 3
                                            join status in db.tb_statusbooks on db_.int_cheeckin_out equals status.self_id
                                            select new
                                            {
                                                status.status_book,
                                                db_.bool_current
    ,
                                                db_.dt_DATE_modify,
                                                db_.st_ISBN_ISSN,
                                                db_.st_name_book,
                                                db_.st_detail_book,
                                                db_.st_type_book_name,
                                                db_.int_id_catalog_book,
                                                db_.st_type_book
                                            }).ToList();
                    GridView1.DataBind();
                }
            }
            catch
            {

            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    CheckBox checkBox = e.Row.Cells[0].Controls[0] as CheckBox;
            //    checkBox.Enabled = true;
            //}
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
           
        }
    }
}