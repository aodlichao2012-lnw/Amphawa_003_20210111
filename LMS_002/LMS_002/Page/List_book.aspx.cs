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
        string img_book = "";
        string id_book = "";
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.SetFocus(txt_ketword2.ClientID);
            if (!Page.IsPostBack)
            {
                using (var db = new Dbcon_wan())
                {

                    dt = Conncetions_db.Instance.Connection_command(@"SELECT st_name_book ,  st_ISBN_ISSN  , img_path , st_detail_book , dt_DATE_modify , st_cheeckin_out ,  tb_books_type.Type_book  , COUNT(st_ISBN_ISSN) as count_
                            FROM MD_catralog_book
                            LEFT JOIN MD_status_book_type ON MD_catralog_book.int_cheeckin_out = MD_status_book_type.self_id
                            INNER JOIN dbo.tb_books_type ON MD_catralog_book.st_type_book = tb_books_type.self_id
                            where  int_cheeckin_out != 3 group by [st_ISBN_ISSN], img_path, st_detail_book, dt_DATE_modify, st_cheeckin_out  , st_name_book  ,  tb_books_type.Type_book");
                    GridView1.DataSource = dt;
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
            var result = Conncetions_db.Instance.Connection_command("select count(*) as total from [dbo].[MD_catralog_book] where  int_cheeckin_out = 3 AND st_process_name_user = '" + profile + "' ");
            if (Session["roleid"] == null)
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
                clear_list.Visible = false;


            }

            ld_count.Text = result.Rows[0]["total"].ToString();


        }

        protected void searchCatalog_ServerClick(object sender, EventArgs e)
        {
            try
            {
                using (var db = new Dbcon_wan())
                {


                    string select = $@"SELECT st_name_book ,  st_ISBN_ISSN  , img_path , st_detail_book , dt_DATE_modify , st_cheeckin_out ,  tb_books_type.Type_book  , COUNT(st_ISBN_ISSN) as count_
                            FROM MD_catralog_book
                            LEFT JOIN MD_status_book_type ON MD_catralog_book.int_cheeckin_out = MD_status_book_type.self_id
                            INNER JOIN dbo.tb_books_type ON MD_catralog_book.st_type_book = tb_books_type.self_id  
                                                                   WHERE {Types.Value} LIKE 
                                                                 ";

                    GridView1.DataSourceID = null;
                    List<MD_catralog_book> cs = new List<MD_catralog_book>();
                    if (Types.Value != "")
                    {
                        if (txt_ketword2.Text != "")
                        {
                            switch (Types.Value)
                            {
                                case "st_name_book":
                                    select += $" '%{ txt_ketword2.Text }%' ";

                                    break;
                                case "st_ISBN_ISSN":
                                    select += $" '%{ txt_ketword2.Text }%' ";
                                    break;
                                case "st_type_book_name":
                                    select += $" '%{ txt_ketword2.Text }%' ";
                                    break;
                                case "st_author":
                                    select += $" '%{ txt_ketword2.Text }%' ";
                                    break;
                                case "barcode":
                                    select += $" '%{ txt_ketword2.Text }%' ";
                                    break;
                                case "count_print":
                                    select += $" '%{ txt_ketword2.Text }%' ";
                                    break;
                            }
                            dt = Conncetions_db.Instance.Connection_command(@"" + select + " AND  int_cheeckin_out != 3" +
                                " group by [st_ISBN_ISSN] , img_path , st_detail_book , dt_DATE_modify , st_cheeckin_out , st_name_book  ,  tb_books_type.Type_book");
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
                GridView1.DataBind();

            }
            catch (Exception ex)
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
                            var id = gvrow.Cells[3].Text;
                            id_book = id.ToString();

                            try
                            {
                                var update = Conncetions_db.Instance.Connection_command(@"UPDATE [dbo].[MD_catralog_book] SET  [int_cheeckin_out] = 3 ,[st_cheeckin_out] = 'เตรียมพร้อมเพื่อยืม' , st_process_name_user
                           = '" + profile + "' WHERE st_ISBN_ISSN = '" + id + "'");
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


            }
            catch
            {

            }
        }

        protected void clear_list_ServerClick(object sender, EventArgs e)
        {
            try
            {
                GridView1_RowCancelingEdit("", null);
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

                    dt = Conncetions_db.Instance.Connection_command(@"SELECT st_name_book ,  st_ISBN_ISSN  , img_path , st_detail_book , dt_DATE_modify , st_cheeckin_out ,  tb_books_type.Type_book , COUNT(st_ISBN_ISSN) as count_
                    FROM MD_catralog_book
                    LEFT JOIN MD_status_book_type ON MD_catralog_book.int_cheeckin_out = MD_status_book_type.self_id
                    INNER JOIN dbo.tb_books_type ON MD_catralog_book.st_type_book = tb_books_type.self_id  where  int_cheeckin_out != 3 AND st_type_book =" + Types.Value + " " +
                      " group by[st_ISBN_ISSN], img_path, st_detail_book, dt_DATE_modify, st_cheeckin_out , st_name_book ,  tb_books_type.Type_book ");
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
            catch
            {

            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }


        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void btn_open_Click(object sender, EventArgs e)
        {
            Button chk1 = (Button)sender;
            GridViewRow gvr = (GridViewRow)chk1.NamingContainer;
            string issn_book = gvr.Cells[3].Text;
            Response.Write(@"<script>window.open('book_detail.aspx?issn=" + issn_book + "');</script>");
        }

        protected void txt_ketword2_TextChanged(object sender, EventArgs e)
        {
            searchCatalog_ServerClick("", null);
        }
    }
}